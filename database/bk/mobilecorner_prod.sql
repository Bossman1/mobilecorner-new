/*
 Navicat Premium Data Transfer

 Source Server         : Linode
 Source Server Type    : MySQL
 Source Server Version : 80044
 Source Host           : 172.236.192.5:3306
 Source Schema         : mobilecorner

 Target Server Type    : MySQL
 Target Server Version : 80044
 File Encoding         : 65001

 Date: 08/12/2025 07:36:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE `attribute_values`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sort_order` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_values_slug_unique`(`slug`) USING BTREE,
  INDEX `attribute_values_attribute_id_foreign`(`attribute_id`) USING BTREE,
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attribute_values
-- ----------------------------
INSERT INTO `attribute_values` VALUES (52, 26, 'Apple', NULL, 0, '2025-12-06 22:17:43', '2025-12-06 22:17:43');
INSERT INTO `attribute_values` VALUES (53, 26, 'Samsung', NULL, 0, '2025-12-06 22:17:54', '2025-12-06 22:17:54');
INSERT INTO `attribute_values` VALUES (54, 26, 'Google', NULL, 0, '2025-12-06 22:18:09', '2025-12-06 22:18:09');
INSERT INTO `attribute_values` VALUES (55, 27, '32 GB', NULL, 0, '2025-12-06 22:52:58', '2025-12-06 22:52:58');
INSERT INTO `attribute_values` VALUES (56, 27, '64 GB', NULL, 0, '2025-12-06 22:53:18', '2025-12-06 22:53:18');
INSERT INTO `attribute_values` VALUES (57, 27, '128 GB', NULL, 0, '2025-12-06 22:53:35', '2025-12-06 22:53:35');
INSERT INTO `attribute_values` VALUES (58, 27, '256 GB', NULL, 0, '2025-12-06 22:53:59', '2025-12-06 22:53:59');
INSERT INTO `attribute_values` VALUES (59, 27, '512 GB', NULL, 0, '2025-12-06 22:54:13', '2025-12-06 22:54:13');
INSERT INTO `attribute_values` VALUES (60, 27, '1 TB', NULL, 0, '2025-12-06 22:55:02', '2025-12-06 22:55:02');
INSERT INTO `attribute_values` VALUES (61, 28, '6.1', NULL, 0, '2025-12-06 22:57:44', '2025-12-06 22:57:44');
INSERT INTO `attribute_values` VALUES (62, 29, '1179x2556', NULL, 0, '2025-12-06 22:59:10', '2025-12-06 22:59:10');
INSERT INTO `attribute_values` VALUES (63, 30, '48', NULL, 0, '2025-12-06 23:00:16', '2025-12-06 23:00:16');
INSERT INTO `attribute_values` VALUES (64, 31, 'Apple A16 Bionic', NULL, 0, '2025-12-06 23:04:08', '2025-12-06 23:04:08');
INSERT INTO `attribute_values` VALUES (65, 32, '6', NULL, 0, '2025-12-06 23:04:42', '2025-12-06 23:04:42');
INSERT INTO `attribute_values` VALUES (66, 33, '3200', NULL, 0, '2025-12-06 23:05:11', '2025-12-06 23:05:11');
INSERT INTO `attribute_values` VALUES (67, 32, '8', NULL, 0, '2025-12-07 00:47:28', '2025-12-07 00:47:28');
INSERT INTO `attribute_values` VALUES (68, 31, 'Apple A17 Pro', NULL, 0, '2025-12-07 00:48:00', '2025-12-07 00:48:00');
INSERT INTO `attribute_values` VALUES (69, 33, '3274', NULL, 0, '2025-12-07 00:48:29', '2025-12-07 00:48:29');
INSERT INTO `attribute_values` VALUES (70, 28, '6.7', NULL, 0, '2025-12-07 01:48:09', '2025-12-07 01:48:09');
INSERT INTO `attribute_values` VALUES (71, 29, '1290x2796', NULL, 0, '2025-12-07 01:48:37', '2025-12-07 01:48:37');
INSERT INTO `attribute_values` VALUES (72, 33, '4323', NULL, 0, '2025-12-07 01:49:22', '2025-12-07 01:49:22');
INSERT INTO `attribute_values` VALUES (73, 33, '4441', NULL, 0, '2025-12-07 01:50:36', '2025-12-07 01:50:36');
INSERT INTO `attribute_values` VALUES (74, 33, '3349', NULL, 0, '2025-12-07 01:51:32', '2025-12-07 01:51:32');
INSERT INTO `attribute_values` VALUES (75, 31, 'Apple A18', NULL, 0, '2025-12-07 01:54:31', '2025-12-07 01:54:31');
INSERT INTO `attribute_values` VALUES (76, 33, '3561', NULL, 0, '2025-12-07 01:55:03', '2025-12-07 01:55:03');
INSERT INTO `attribute_values` VALUES (77, 28, '6.3', NULL, 0, '2025-12-07 01:55:40', '2025-12-07 01:55:40');
INSERT INTO `attribute_values` VALUES (78, 29, '1206x2622', NULL, 0, '2025-12-07 01:56:07', '2025-12-07 01:56:07');
INSERT INTO `attribute_values` VALUES (79, 33, '3582', NULL, 0, '2025-12-07 01:56:56', '2025-12-07 01:56:56');
INSERT INTO `attribute_values` VALUES (80, 28, '6.9', NULL, 0, '2025-12-07 01:58:00', '2025-12-07 01:58:00');
INSERT INTO `attribute_values` VALUES (81, 29, '1320x2868', NULL, 0, '2025-12-07 01:58:32', '2025-12-07 01:58:32');
INSERT INTO `attribute_values` VALUES (82, 31, 'Apple A18 Pro', NULL, 0, '2025-12-07 01:59:09', '2025-12-07 01:59:09');
INSERT INTO `attribute_values` VALUES (83, 33, '4685', NULL, 0, '2025-12-07 01:59:51', '2025-12-07 01:59:51');
INSERT INTO `attribute_values` VALUES (84, 34, 'Apple M4', NULL, 0, '2025-12-07 10:06:54', '2025-12-07 10:06:54');
INSERT INTO `attribute_values` VALUES (85, 35, 'Liquid Retina Display', NULL, 0, '2025-12-07 10:08:00', '2025-12-07 10:08:00');
INSERT INTO `attribute_values` VALUES (86, 36, '60', NULL, 0, '2025-12-07 10:08:44', '2025-12-07 10:08:44');
INSERT INTO `attribute_values` VALUES (87, 37, '2', NULL, 0, '2025-12-07 10:09:08', '2025-12-07 10:09:08');
INSERT INTO `attribute_values` VALUES (88, 31, '10 Core', NULL, 0, '2025-12-07 10:17:44', '2025-12-07 10:17:44');
INSERT INTO `attribute_values` VALUES (89, 29, '2560x1664', NULL, 0, '2025-12-07 10:20:13', '2025-12-07 10:20:13');
INSERT INTO `attribute_values` VALUES (90, 28, '13.6', NULL, 0, '2025-12-07 10:21:30', '2025-12-07 10:21:47');
INSERT INTO `attribute_values` VALUES (91, 32, '16', NULL, 0, '2025-12-07 10:31:57', '2025-12-07 10:31:57');
INSERT INTO `attribute_values` VALUES (92, 38, 'კი', NULL, 0, '2025-12-07 10:38:06', '2025-12-07 10:38:06');
INSERT INTO `attribute_values` VALUES (93, 38, 'არა', NULL, 0, '2025-12-07 10:38:16', '2025-12-07 10:38:16');
INSERT INTO `attribute_values` VALUES (94, 39, 'Macbook Air', NULL, 0, '2025-12-07 10:38:33', '2025-12-07 10:38:33');
INSERT INTO `attribute_values` VALUES (95, 28, '15.3', NULL, 0, '2025-12-07 10:44:36', '2025-12-07 10:44:36');
INSERT INTO `attribute_values` VALUES (96, 29, '2880x1864', NULL, 0, '2025-12-07 10:45:15', '2025-12-07 10:45:15');
INSERT INTO `attribute_values` VALUES (97, 29, '1170x2532', NULL, 0, '2025-12-07 21:03:04', '2025-12-07 21:03:04');
INSERT INTO `attribute_values` VALUES (98, 30, '12', NULL, 0, '2025-12-07 21:03:55', '2025-12-07 21:03:55');
INSERT INTO `attribute_values` VALUES (99, 32, '6', NULL, 0, '2025-12-07 21:04:50', '2025-12-07 21:04:50');
INSERT INTO `attribute_values` VALUES (100, 33, '3095', NULL, 0, '2025-12-07 21:05:23', '2025-12-07 21:05:23');
INSERT INTO `attribute_values` VALUES (101, 31, 'Apple A15 Bionic', NULL, 0, '2025-12-07 21:11:01', '2025-12-07 21:11:01');

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('text','number','boolean','select','json') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `options` json NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attributes_slug_unique`(`slug`) USING BTREE,
  INDEX `attributes_slug_index`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attributes
-- ----------------------------
INSERT INTO `attributes` VALUES (26, 'ბრენდი', 'brendi', 'select', NULL, NULL, '2025-12-06 22:17:07', '2025-12-06 22:17:07');
INSERT INTO `attributes` VALUES (27, 'მეხსიერება', 'mekhsiereba', 'select', NULL, NULL, '2025-12-06 22:52:39', '2025-12-06 22:52:39');
INSERT INTO `attributes` VALUES (28, 'ეკრანის ზომა', 'ekranis-zoma', 'select', 'inches', NULL, '2025-12-06 22:57:20', '2025-12-06 22:58:00');
INSERT INTO `attributes` VALUES (29, 'რეზოლუცია', 'rezolutsia', 'select', 'pixels', NULL, '2025-12-06 22:58:30', '2025-12-06 22:58:30');
INSERT INTO `attributes` VALUES (30, 'კამერა', 'kamera', 'select', 'MP', NULL, '2025-12-06 22:59:59', '2025-12-06 22:59:59');
INSERT INTO `attributes` VALUES (31, 'გრაფიკული პროცესორი', 'protsesori', 'select', 'GPU', NULL, '2025-12-06 23:01:32', '2025-12-07 10:00:56');
INSERT INTO `attributes` VALUES (32, 'RAM', 'ram', 'select', 'GB', NULL, '2025-12-06 23:02:18', '2025-12-06 23:02:18');
INSERT INTO `attributes` VALUES (33, 'ელემენტი', 'elementi', 'select', 'mAh', NULL, '2025-12-06 23:02:54', '2025-12-06 23:02:54');
INSERT INTO `attributes` VALUES (34, 'ცენტრალური პროცესორი', 'tsentraluri-protsesoei', 'select', NULL, NULL, '2025-12-07 10:03:34', '2025-12-07 10:50:53');
INSERT INTO `attributes` VALUES (35, 'ეკრანის ტიპი', 'ekranis-tipi', 'select', NULL, NULL, '2025-12-07 10:04:41', '2025-12-07 10:04:41');
INSERT INTO `attributes` VALUES (36, 'განახლების სიხშირე', 'ganakhlebis-sikhshire', 'select', 'Hz', NULL, '2025-12-07 10:05:26', '2025-12-07 10:08:24');
INSERT INTO `attributes` VALUES (37, 'Type-C პორტი', 'type-c-porti', 'select', 'X', NULL, '2025-12-07 10:06:06', '2025-12-07 10:09:19');
INSERT INTO `attributes` VALUES (38, 'სენსორული ეკრანი', 'sensoruli-ekrani', 'select', NULL, NULL, '2025-12-07 10:37:02', '2025-12-07 10:37:02');
INSERT INTO `attributes` VALUES (39, 'მოდელი', 'modeli', 'select', NULL, NULL, '2025-12-07 10:37:38', '2025-12-07 10:37:38');

-- ----------------------------
-- Table structure for banner_group_banners
-- ----------------------------
DROP TABLE IF EXISTS `banner_group_banners`;
CREATE TABLE `banner_group_banners`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `banner_group_id` bigint UNSIGNED NOT NULL,
  `banner_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `banner_group_banners_banner_group_id_banner_id_unique`(`banner_group_id`, `banner_id`) USING BTREE,
  INDEX `banner_group_banners_banner_id_foreign`(`banner_id`) USING BTREE,
  INDEX `banner_group_banner_group_banner_index`(`banner_group_id`, `banner_id`) USING BTREE,
  CONSTRAINT `banner_group_banners_banner_group_id_foreign` FOREIGN KEY (`banner_group_id`) REFERENCES `banner_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `banner_group_banners_banner_id_foreign` FOREIGN KEY (`banner_id`) REFERENCES `banners` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner_group_banners
-- ----------------------------
INSERT INTO `banner_group_banners` VALUES (6, 3, 5, NULL, NULL);

-- ----------------------------
-- Table structure for banner_groups
-- ----------------------------
DROP TABLE IF EXISTS `banner_groups`;
CREATE TABLE `banner_groups`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bg_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `banner_groups_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner_groups
-- ----------------------------
INSERT INTO `banner_groups` VALUES (3, 'ორიგინალი დამტენი', 'originali-damteni', '#0178ff', '2025-12-06 23:47:52', '2025-12-07 00:35:32');

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (5, 'ორიგინალი დამტენი', NULL, 'banners/December2025/JiYvhFlj6glzSfbswSe5.png', '2025-12-07 00:17:39', '2025-12-07 00:34:40');

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cache
-- ----------------------------
INSERT INTO `cache` VALUES ('mobilecorner-cache-77de68daecd823babbb58edb1c8e14d7106e83bb', 'i:3;', 1765140445);
INSERT INTO `cache` VALUES ('mobilecorner-cache-77de68daecd823babbb58edb1c8e14d7106e83bb:timer', 'i:1765140445;', 1765140445);
INSERT INTO `cache` VALUES ('mobilecorner-cache-95cf92a158d5cbff5265696b5b11ff3cb9a3c790', 'i:4;', 1765137109);
INSERT INTO `cache` VALUES ('mobilecorner-cache-95cf92a158d5cbff5265696b5b11ff3cb9a3c790:timer', 'i:1765137109;', 1765137109);
INSERT INTO `cache` VALUES ('mobilecorner-cache-voyager_menu_admin', 'O:23:\"TCG\\Voyager\\Models\\Menu\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"menus\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:1;s:4:\"name\";s:5:\"admin\";s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-02 23:32:51\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:1;s:4:\"name\";s:5:\"admin\";s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-02 23:32:51\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:12:\"parent_items\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:15:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:1;s:7:\"menu_id\";i:1;s:5:\"title\";s:9:\"Dashboard\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-boat\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-28 06:13:26\";s:5:\"route\";s:17:\"voyager.dashboard\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:1;s:7:\"menu_id\";i:1;s:5:\"title\";s:9:\"Dashboard\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-boat\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-28 06:13:26\";s:5:\"route\";s:17:\"voyager.dashboard\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:2;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Media\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-images\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:13;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";s:19:\"voyager.media.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:2;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Media\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-images\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:13;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";s:19:\"voyager.media.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:2;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:3;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Users\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-person\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:12;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";s:19:\"voyager.users.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:3;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Users\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-person\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:12;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";s:19:\"voyager.users.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:3;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:4;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Roles\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-lock\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:11;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";s:19:\"voyager.roles.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:4;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Roles\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-lock\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:11;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";s:19:\"voyager.roles.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:4;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:5;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Tools\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-tools\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:14;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";N;s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:5;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Tools\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-tools\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:14;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";N;s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:4:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:6;s:7:\"menu_id\";i:1;s:5:\"title\";s:12:\"Menu Builder\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-list\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.menus.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:6;s:7:\"menu_id\";i:1;s:5:\"title\";s:12:\"Menu Builder\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-list\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.menus.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:7;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Database\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-data\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:22:\"voyager.database.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:7;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Database\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-data\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:22:\"voyager.database.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:2;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:8;s:7:\"menu_id\";i:1;s:5:\"title\";s:7:\"Compass\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:15:\"voyager-compass\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:21:\"voyager.compass.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:8;s:7:\"menu_id\";i:1;s:5:\"title\";s:7:\"Compass\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:15:\"voyager-compass\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:21:\"voyager.compass.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:3;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:9;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"BREAD\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-bread\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.bread.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:9;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"BREAD\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-bread\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.bread.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:5;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:10;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Settings\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:16:\"voyager-settings\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:15;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";s:22:\"voyager.settings.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:10;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Settings\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:16:\"voyager-settings\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:15;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";s:22:\"voyager.settings.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:6;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:11;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Categories\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-25 14:40:28\";s:10:\"updated_at\";s:19:\"2025-11-29 15:00:53\";s:5:\"route\";s:24:\"voyager.categories.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:11;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Categories\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-25 14:40:28\";s:10:\"updated_at\";s:19:\"2025-11-29 15:00:53\";s:5:\"route\";s:24:\"voyager.categories.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:7;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:12;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Products\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-shop\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:6;s:10:\"created_at\";s:19:\"2025-11-27 21:34:24\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:22:\"voyager.products.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:12;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Products\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-shop\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:6;s:10:\"created_at\";s:19:\"2025-11-27 21:34:24\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:22:\"voyager.products.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:8;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:13;s:7:\"menu_id\";i:1;s:5:\"title\";s:6:\"Colors\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:5;s:10:\"created_at\";s:19:\"2025-11-27 22:10:32\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:20:\"voyager.colors.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:13;s:7:\"menu_id\";i:1;s:5:\"title\";s:6:\"Colors\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:5;s:10:\"created_at\";s:19:\"2025-11-27 22:10:32\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:20:\"voyager.colors.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:9;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:16;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-27 23:44:26\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:08\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:16;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-27 23:44:26\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:08\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:2:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:14;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-27 22:50:17\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:42\";s:5:\"route\";s:24:\"voyager.attributes.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:14;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-27 22:50:17\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:42\";s:5:\"route\";s:24:\"voyager.attributes.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:15;s:7:\"menu_id\";i:1;s:5:\"title\";s:16:\"Attribute Values\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-27 23:44:01\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:47\";s:5:\"route\";s:30:\"voyager.attribute-values.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:15;s:7:\"menu_id\";i:1;s:5:\"title\";s:16:\"Attribute Values\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-27 23:44:01\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:47\";s:5:\"route\";s:30:\"voyager.attribute-values.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:10;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:17;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Pages\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:7;s:10:\"created_at\";s:19:\"2025-11-28 16:47:10\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:19:\"voyager.pages.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:17;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Pages\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:7;s:10:\"created_at\";s:19:\"2025-11-28 16:47:10\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:19:\"voyager.pages.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:11;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:21;s:7:\"menu_id\";i:1;s:5:\"title\";s:14:\"Banner Section\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-29 15:13:28\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:00\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:21;s:7:\"menu_id\";i:1;s:5:\"title\";s:14:\"Banner Section\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-29 15:13:28\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:00\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:2:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:20;s:7:\"menu_id\";i:1;s:5:\"title\";s:13:\"Banner Groups\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:21;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-29 15:12:09\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:17\";s:5:\"route\";s:27:\"voyager.banner-groups.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:20;s:7:\"menu_id\";i:1;s:5:\"title\";s:13:\"Banner Groups\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:21;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-29 15:12:09\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:17\";s:5:\"route\";s:27:\"voyager.banner-groups.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:22;s:7:\"menu_id\";i:1;s:5:\"title\";s:7:\"Banners\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:21;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-29 15:14:09\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:22\";s:5:\"route\";s:21:\"voyager.banners.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:22;s:7:\"menu_id\";i:1;s:5:\"title\";s:7:\"Banners\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:21;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-29 15:14:09\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:22\";s:5:\"route\";s:21:\"voyager.banners.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:12;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:23;s:7:\"menu_id\";i:1;s:5:\"title\";s:9:\"Carousels\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:8;s:10:\"created_at\";s:19:\"2025-11-29 22:49:28\";s:10:\"updated_at\";s:19:\"2025-11-29 22:51:27\";s:5:\"route\";s:23:\"voyager.carousels.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:23;s:7:\"menu_id\";i:1;s:5:\"title\";s:9:\"Carousels\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:8;s:10:\"created_at\";s:19:\"2025-11-29 22:49:28\";s:10:\"updated_at\";s:19:\"2025-11-29 22:51:27\";s:5:\"route\";s:23:\"voyager.carousels.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:13;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:24;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Contacts\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-mail\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:9;s:10:\"created_at\";s:19:\"2025-12-06 01:20:54\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:09\";s:5:\"route\";s:22:\"voyager.contacts.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:24;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Contacts\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-mail\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:9;s:10:\"created_at\";s:19:\"2025-12-06 01:20:54\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:09\";s:5:\"route\";s:22:\"voyager.contacts.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:14;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:27;s:7:\"menu_id\";i:1;s:5:\"title\";s:17:\"Installment Group\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:10;s:10:\"created_at\";s:19:\"2025-12-06 02:10:15\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:27;s:7:\"menu_id\";i:1;s:5:\"title\";s:17:\"Installment Group\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:10;s:10:\"created_at\";s:19:\"2025-12-06 02:10:15\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:43\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:2:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:25;s:7:\"menu_id\";i:1;s:5:\"title\";s:12:\"Installments\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:27;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-12-06 02:00:55\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:58\";s:5:\"route\";s:26:\"voyager.installments.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:25;s:7:\"menu_id\";i:1;s:5:\"title\";s:12:\"Installments\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:27;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-12-06 02:00:55\";s:10:\"updated_at\";s:19:\"2025-12-06 02:10:58\";s:5:\"route\";s:26:\"voyager.installments.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:26;s:7:\"menu_id\";i:1;s:5:\"title\";s:23:\"Installment Order Items\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:27;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-12-06 02:01:05\";s:10:\"updated_at\";s:19:\"2025-12-06 02:11:03\";s:5:\"route\";s:37:\"voyager.installment-order-items.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:26;s:7:\"menu_id\";i:1;s:5:\"title\";s:23:\"Installment Order Items\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:27;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-12-06 02:01:05\";s:10:\"updated_at\";s:19:\"2025-12-06 02:11:03\";s:5:\"route\";s:37:\"voyager.installment-order-items.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}', 1767729181);

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for carousels
-- ----------------------------
DROP TABLE IF EXISTS `carousels`;
CREATE TABLE `carousels`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carousels
-- ----------------------------
INSERT INTO `carousels` VALUES (5, 'iphone 17 Pro', 'carousels/December2025/9Tjtmm4ljiFs0P89Kyo6.jpg', NULL, '2025-12-06 16:04:38', '2025-12-06 16:04:38');
INSERT INTO `carousels` VALUES (6, 'iphone 17 pro', 'carousels/December2025/dxBRbehI4unDePdH5Xbv.jpg', NULL, '2025-12-06 16:05:33', '2025-12-06 16:05:33');
INSERT INTO `carousels` VALUES (8, 'macbook', 'carousels/December2025/8PaXCFJ7tGxljtortCT6.png', 'https://mobilecorner.alertme.top/categories/macbook', '2025-12-08 01:12:28', '2025-12-08 01:43:06');
INSERT INTO `carousels` VALUES (9, 'iphone air', 'carousels/December2025/lRiyOh5kWX9bocYoqK4A.png', NULL, '2025-12-08 01:19:29', '2025-12-08 01:36:18');
INSERT INTO `carousels` VALUES (10, 'pixel', 'carousels/December2025/dnhtjbKyPIHLFXj2ixsw.png', NULL, '2025-12-08 01:27:57', '2025-12-08 01:27:57');
INSERT INTO `carousels` VALUES (11, 'galaxy', 'carousels/December2025/nJeeYRIV6oZfdtfOSSeo.png', NULL, '2025-12-08 01:41:35', '2025-12-08 01:42:10');

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carts
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint UNSIGNED NULL DEFAULT NULL,
  `banner_group_id` bigint UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `icons` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `position` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug`) USING BTREE,
  INDEX `categories_parent_id_index`(`parent_id`) USING BTREE,
  INDEX `banner_group_id_foreign`(`banner_group_id`) USING BTREE,
  CONSTRAINT `banner_group_id_foreign` FOREIGN KEY (`banner_group_id`) REFERENCES `banner_groups` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (37, NULL, 3, 'მობილურები', NULL, 'device-mobile', 'mobilurebi', NULL, 0, NULL, '2025-12-07 00:19:40');
INSERT INTO `categories` VALUES (38, NULL, NULL, 'ტაბები', NULL, 'device-tablet-camera', 'tabebi', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (39, NULL, NULL, 'ლეპტოპები', NULL, 'laptop', 'leptopebi', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (40, NULL, NULL, 'აუდიო სისტემები', NULL, 'cassette-tape', 'audio-sistemebi', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (41, NULL, NULL, 'Gaming', NULL, 'game-controller', 'gaming', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (42, NULL, NULL, 'აქსესუარები', NULL, 'usb', 'originali-aqsesuarebi', NULL, 0, NULL, '2025-12-06 16:57:39');
INSERT INTO `categories` VALUES (43, 37, NULL, 'ბრენდები', NULL, NULL, 'apple-iphone', NULL, 0, NULL, '2025-12-07 01:30:07');
INSERT INTO `categories` VALUES (46, 43, NULL, 'Apple iphone', 'categories/December2025/uoK4xlPMZyoydgRj9wIF.png', NULL, 'apple-iphone-1', NULL, 0, NULL, '2025-12-08 00:06:58');
INSERT INTO `categories` VALUES (47, 43, NULL, 'Samsung Galaxy', 'categories/December2025/WOCZYlK4T9wMCyzMjF4a.png', NULL, 'samsung-galaxy', NULL, 0, NULL, '2025-12-08 00:03:14');
INSERT INTO `categories` VALUES (48, 43, NULL, 'Google Pixel', 'categories/December2025/dKriBl7ZN1Mdp2WY5TF5.png', NULL, 'google-pixel', NULL, 0, NULL, '2025-12-08 00:03:28');
INSERT INTO `categories` VALUES (49, 38, NULL, 'ბრენდები', NULL, NULL, 'tabis-modelebi', NULL, 0, NULL, '2025-12-07 01:29:12');
INSERT INTO `categories` VALUES (50, 49, NULL, 'Apple ipad', 'categories/December2025/Zo1SEWK5kl8Pti7ibZS5.png', NULL, 'apple-2', NULL, 0, NULL, '2025-12-08 00:11:46');
INSERT INTO `categories` VALUES (51, 49, NULL, 'Samsung', 'categories/December2025/dELPX9tD2Au4j7jzOnRp.png', NULL, 'samsung-1', NULL, 0, NULL, '2025-12-08 00:12:02');
INSERT INTO `categories` VALUES (52, 39, NULL, 'Apple', NULL, NULL, 'macbook', NULL, 0, NULL, '2025-12-06 17:15:03');
INSERT INTO `categories` VALUES (53, 52, NULL, 'MacBook Air 2025', 'categories/December2025/oxRE00aTakSRMv8hfOOD.png', NULL, 'macbook-air', NULL, 0, NULL, '2025-12-08 00:16:09');
INSERT INTO `categories` VALUES (54, 52, NULL, 'Macbook Pro 2025', 'categories/December2025/2NXEZTzfhFepd9l8J5T4.png', NULL, 'macbook-pro-2025', NULL, 0, NULL, '2025-12-08 00:16:22');
INSERT INTO `categories` VALUES (55, 39, NULL, 'HP', 'categories/December2025/hSCkoxglSd7KlyxAkz6m.png', NULL, 'hp', NULL, 0, NULL, '2025-12-08 00:17:02');
INSERT INTO `categories` VALUES (56, 55, NULL, 'HP OmniBook', 'categories/December2025/VV5PzEsY5uM1ZLVotgw2.png', NULL, 'hp-omnibook', NULL, 0, NULL, '2025-12-08 00:16:54');
INSERT INTO `categories` VALUES (57, 55, NULL, 'HP Victus', 'categories/December2025/aLsQRqLtamVGQFx3Qufg.png', NULL, 'hp-victus', NULL, 0, NULL, '2025-12-08 00:16:48');
INSERT INTO `categories` VALUES (58, 40, NULL, 'Apple', NULL, NULL, 'apple-3', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (59, 40, NULL, 'Samsung', NULL, NULL, 'samsung-2', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (60, 58, NULL, 'AirPods', 'categories/December2025/wHfMtBE4MNTZeX6xeSuo.png', NULL, 'airpods', NULL, 0, NULL, '2025-12-08 00:26:51');
INSERT INTO `categories` VALUES (61, 59, NULL, 'Samsung Buds', 'categories/December2025/8q9FpidUWgxgkyGpOtZM.png', NULL, 'samsung-buds', NULL, 0, NULL, '2025-12-08 00:31:15');
INSERT INTO `categories` VALUES (62, 42, NULL, 'Apple', NULL, NULL, 'apple-4', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (63, 42, NULL, 'Samsung', NULL, NULL, 'samsung-4', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (64, 62, NULL, 'Apple USB კაბელი', 'categories/December2025/zAcTiIwwtCm36pGOBouW.png', NULL, 'originali-usb-kabeli', NULL, 0, NULL, '2025-12-08 00:39:00');
INSERT INTO `categories` VALUES (65, 62, NULL, 'Apple ადაპტერი', 'categories/December2025/8uYIwJWVnUsUJH5EPuqQ.png', NULL, 'originali-adapteri', NULL, 0, NULL, '2025-12-08 00:42:57');
INSERT INTO `categories` VALUES (66, 63, NULL, 'Samsung USB კაბელი', 'categories/December2025/LWAKrfNEW9kEb6fopXWZ.png', NULL, 'originali-usb-kabeli-1', NULL, 0, NULL, '2025-12-08 00:39:18');
INSERT INTO `categories` VALUES (67, 63, NULL, 'Samsung ადაპტერი', 'categories/December2025/irbowMnxcZM2fS3Rdna5.png', NULL, 'originali-adapteri-1', NULL, 0, NULL, '2025-12-08 00:43:27');
INSERT INTO `categories` VALUES (68, 42, NULL, 'Google Pixel', NULL, NULL, 'google-pixel-1', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (69, 68, NULL, 'Google USB კაბელი', 'categories/December2025/gzAC30NpsgPkGgE49EY4.png', NULL, 'google-usb-kabeli', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (70, 68, NULL, 'Google ადაპტერი', 'categories/December2025/zwUgo7YiUkEIdAIjt3JG.png', NULL, 'google-adapteri', NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES (6, 'Space Black', '#4c5361', NULL, '2025-12-07 20:57:40');
INSERT INTO `colors` VALUES (7, 'Silver', '#ededed', NULL, NULL);
INSERT INTO `colors` VALUES (8, 'Gold', '#f7e9cd', NULL, '2025-12-07 20:59:33');
INSERT INTO `colors` VALUES (9, 'Deep Purple', '#7e3e79', NULL, NULL);
INSERT INTO `colors` VALUES (10, 'Black Titanium', '#3b3b3b', NULL, NULL);
INSERT INTO `colors` VALUES (11, 'White Titanium', '#f7f7f7', NULL, NULL);
INSERT INTO `colors` VALUES (12, 'Blue Titanium', '#4b515e', NULL, '2025-12-07 21:02:18');
INSERT INTO `colors` VALUES (13, 'Natural Titanium', '#d6d6d6', NULL, NULL);
INSERT INTO `colors` VALUES (14, 'Sky Blue', '#ebf4ff', NULL, NULL);
INSERT INTO `colors` VALUES (15, 'Midnight', '#133c67', NULL, NULL);
INSERT INTO `colors` VALUES (16, 'Silver', '#f0f0f0', NULL, NULL);
INSERT INTO `colors` VALUES (17, 'Starlight', '#f4f4eb', NULL, '2025-12-07 11:25:06');
INSERT INTO `colors` VALUES (18, 'Graphite', '#787878', NULL, NULL);
INSERT INTO `colors` VALUES (19, 'Sierra Blue', '#9ebad5', NULL, NULL);
INSERT INTO `colors` VALUES (20, 'Alpine Green', '#4c6450', NULL, NULL);

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contacts
-- ----------------------------

-- ----------------------------
-- Table structure for data_rows
-- ----------------------------
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `order` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data_rows_data_type_id_foreign`(`data_type_id`) USING BTREE,
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_rows
-- ----------------------------
INSERT INTO `data_rows` VALUES (1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3);
INSERT INTO `data_rows` VALUES (4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5);
INSERT INTO `data_rows` VALUES (6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6);
INSERT INTO `data_rows` VALUES (7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7);
INSERT INTO `data_rows` VALUES (8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8);
INSERT INTO `data_rows` VALUES (9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10);
INSERT INTO `data_rows` VALUES (10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11);
INSERT INTO `data_rows` VALUES (11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12);
INSERT INTO `data_rows` VALUES (12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3);
INSERT INTO `data_rows` VALUES (15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3);
INSERT INTO `data_rows` VALUES (19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5);
INSERT INTO `data_rows` VALUES (21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9);
INSERT INTO `data_rows` VALUES (22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (23, 4, 'parent_id', 'select_dropdown', 'Parent Id', 0, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (24, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (25, 4, 'slug', 'text', 'Slug', 1, 0, 1, 1, 0, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (26, 4, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (27, 4, 'position', 'text', 'Position', 1, 0, 0, 0, 0, 0, '{}', 7);
INSERT INTO `data_rows` VALUES (28, 4, 'created_at', 'text', 'Created At', 0, 0, 0, 0, 1, 1, '{}', 10);
INSERT INTO `data_rows` VALUES (29, 4, 'updated_at', 'text', 'Updated At', 0, 0, 0, 0, 1, 1, '{}', 11);
INSERT INTO `data_rows` VALUES (30, 4, 'category_hasone_category_relationship', 'relationship', 'Parent category', 0, 1, 1, 1, 1, 1, '{\"default\":\"Default text\",\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attributes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3);
INSERT INTO `data_rows` VALUES (31, 4, 'images', 'image', 'Images', 0, 0, 1, 1, 1, 1, '{\"quality\":\"100%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 8);
INSERT INTO `data_rows` VALUES (32, 5, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (33, 5, 'category_id', 'text', 'Category Id', 0, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (34, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 5);
INSERT INTO `data_rows` VALUES (35, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 0, 1, '{\"display\":{\"width\":\"6\"}}', 6);
INSERT INTO `data_rows` VALUES (36, 5, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 7);
INSERT INTO `data_rows` VALUES (39, 5, 'currency', 'text', 'Currency', 0, 0, 0, 0, 0, 0, '{}', 8);
INSERT INTO `data_rows` VALUES (40, 5, 'stock', 'select_dropdown', 'Stock', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"3\"},\"default\":\"1\",\"options\":{\"1\":\"IN STOCK\",\"2\":\"OUT OF STOCK\"}}', 19);
INSERT INTO `data_rows` VALUES (41, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"3\"},\"default\":\"active\",\"options\":{\"active\":\"Active\",\"draft\":\"Draft\"}}', 20);
INSERT INTO `data_rows` VALUES (42, 5, 'deleted_at', 'text', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 23);
INSERT INTO `data_rows` VALUES (43, 5, 'created_at', 'text', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 24);
INSERT INTO `data_rows` VALUES (44, 5, 'updated_at', 'text', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 25);
INSERT INTO `data_rows` VALUES (46, 5, 'product_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attributes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4);
INSERT INTO `data_rows` VALUES (47, 5, 'color_id', 'text', 'Color Id', 0, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (48, 5, 'a_old_price', 'text', 'A) Price', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 9);
INSERT INTO `data_rows` VALUES (49, 5, 'b_old_price', 'text', 'B) Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 12);
INSERT INTO `data_rows` VALUES (50, 5, 'c_old_price', 'text', 'C) Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 15);
INSERT INTO `data_rows` VALUES (51, 5, 'a_new_price', 'text', 'A)  New Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 10);
INSERT INTO `data_rows` VALUES (52, 5, 'b_new_price', 'text', 'B)  New Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 13);
INSERT INTO `data_rows` VALUES (53, 5, 'c_new_price', 'text', 'C)  New Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 16);
INSERT INTO `data_rows` VALUES (54, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (55, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (56, 6, 'color', 'color', 'Color', 0, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (57, 6, 'created_at', 'text', 'Created At', 0, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (58, 6, 'updated_at', 'text', 'Updated At', 0, 1, 1, 1, 1, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (59, 5, 'product_belongsto_color_relationship', 'relationship', 'colors', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"3\"},\"model\":\"App\\\\Models\\\\Color\",\"table\":\"colors\",\"type\":\"belongsTo\",\"column\":\"color_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attributes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 18);
INSERT INTO `data_rows` VALUES (60, 5, 'images', 'multiple_images', 'Images', 0, 0, 0, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"1273\"},\"quality\":\"100%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 22);
INSERT INTO `data_rows` VALUES (61, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (62, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (63, 7, 'slug', 'text', 'Slug', 1, 1, 1, 1, 0, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (64, 7, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"select\",\"options\":{\"text\":\"Text\",\"number\":\"Number\",\"boolean\":\"Boolean\",\"select\":\"Select\",\"json\":\"Json\"}}', 4);
INSERT INTO `data_rows` VALUES (65, 7, 'unit', 'text', 'Unit', 0, 1, 1, 1, 1, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (66, 7, 'options', 'text', 'Options', 0, 0, 0, 0, 0, 0, '{}', 6);
INSERT INTO `data_rows` VALUES (67, 7, 'created_at', 'text', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7);
INSERT INTO `data_rows` VALUES (68, 7, 'updated_at', 'text', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);
INSERT INTO `data_rows` VALUES (70, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 2);
INSERT INTO `data_rows` VALUES (71, 9, 'attribute_id', 'text', 'Attribute Id', 1, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (72, 9, 'value', 'text', 'Value', 1, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (73, 9, 'slug', 'text', 'Slug', 0, 0, 1, 1, 0, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (74, 9, 'sort_order', 'text', 'Sort Order', 1, 0, 0, 0, 0, 0, '{}', 6);
INSERT INTO `data_rows` VALUES (75, 9, 'created_at', 'text', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7);
INSERT INTO `data_rows` VALUES (76, 9, 'updated_at', 'text', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);
INSERT INTO `data_rows` VALUES (77, 9, 'attribute_value_belongsto_attribute_relationship', 'relationship', 'attributes', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Attribute\",\"table\":\"attributes\",\"type\":\"belongsTo\",\"column\":\"attribute_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attributes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 1);
INSERT INTO `data_rows` VALUES (78, 5, 'condition', 'select_dropdown', 'Condition', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"3\"},\"default\":\"new\",\"options\":{\"new\":\"New\",\"owned\":\"Owned\"}}', 21);
INSERT INTO `data_rows` VALUES (79, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (80, 10, 'slug', 'text', 'Slug', 1, 1, 1, 1, 0, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (81, 10, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (82, 10, 'content', 'markdown_editor', 'Content', 0, 0, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (83, 10, 'position', 'select_dropdown', 'Position', 1, 1, 1, 1, 1, 1, '{\"default\":\"everywhere\",\"options\":{\"everywhere\":\"Everywhere\",\"header\":\"Header\",\"footer\":\"Footer\"}}', 4);
INSERT INTO `data_rows` VALUES (84, 10, 'created_at', 'text', 'Created At', 0, 1, 1, 1, 1, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (85, 10, 'updated_at', 'text', 'Updated At', 0, 1, 1, 1, 1, 1, '{}', 7);
INSERT INTO `data_rows` VALUES (86, 4, 'icons', 'text', 'Icons', 0, 1, 1, 1, 1, 1, '{\"description\":\"Icons from phosphoricons.com, Enter icon name, e.g: house-simple\"}', 9);
INSERT INTO `data_rows` VALUES (87, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (88, 11, 'category_id', 'text', 'Category Id', 1, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (89, 11, 'images', 'image', 'Images', 1, 1, 1, 1, 1, 1, '{\"quality\":\"100%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 5);
INSERT INTO `data_rows` VALUES (90, 11, 'bg_color', 'color', 'Bg Color', 0, 1, 1, 1, 1, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (91, 11, 'link', 'text', 'Link', 0, 0, 1, 1, 1, 1, '{}', 7);
INSERT INTO `data_rows` VALUES (92, 11, 'blank', 'select_dropdown', 'Blank', 1, 1, 1, 1, 1, 1, '{\"default\":\"_blank\",\"options\":{\"_blank\":\"_blank\",\"_self\":\"_self\",\"_parent\":\"_parent\",\"_top\":\"_top\"}}', 8);
INSERT INTO `data_rows` VALUES (93, 11, 'position', 'text', 'Position', 1, 0, 0, 0, 0, 0, '{}', 9);
INSERT INTO `data_rows` VALUES (94, 11, 'created_at', 'text', 'Created At', 0, 1, 1, 1, 1, 1, '{}', 10);
INSERT INTO `data_rows` VALUES (95, 11, 'updated_at', 'text', 'Updated At', 0, 1, 1, 1, 1, 1, '{}', 11);
INSERT INTO `data_rows` VALUES (96, 11, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (97, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (98, 12, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (99, 12, 'slug', 'text', 'Slug', 1, 1, 1, 1, 0, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (100, 12, 'bg_color', 'color', 'Background Color', 0, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (101, 12, 'created_at', 'text', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 6);
INSERT INTO `data_rows` VALUES (102, 12, 'updated_at', 'text', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7);
INSERT INTO `data_rows` VALUES (103, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (104, 13, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (105, 13, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (106, 13, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (107, 13, 'created_at', 'text', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5);
INSERT INTO `data_rows` VALUES (108, 13, 'updated_at', 'text', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6);
INSERT INTO `data_rows` VALUES (109, 12, 'banner_group_belongstomany_banner_relationship', 'relationship', 'Banners', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Banner\",\"table\":\"banners\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"banner_group_banners\",\"pivot\":\"1\",\"taggable\":\"0\"}', 5);
INSERT INTO `data_rows` VALUES (110, 4, 'banner_group_id', 'text', 'Banner Group Id', 0, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (111, 4, 'category_belongsto_banner_group_relationship', 'relationship', 'Banner Groups', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\BannerGroup\",\"table\":\"banner_groups\",\"type\":\"belongsTo\",\"column\":\"banner_group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attributes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12);
INSERT INTO `data_rows` VALUES (112, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (113, 14, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (114, 14, 'images', 'image', 'Images', 0, 1, 1, 1, 1, 1, '{\"quality\":\"100%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 3);
INSERT INTO `data_rows` VALUES (115, 14, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (116, 14, 'created_at', 'text', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5);
INSERT INTO `data_rows` VALUES (117, 14, 'updated_at', 'text', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6);
INSERT INTO `data_rows` VALUES (118, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (119, 15, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (120, 15, 'subject', 'text', 'Subject', 1, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (121, 15, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (122, 15, 'phone', 'text', 'Phone', 1, 1, 1, 1, 1, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (123, 15, 'message', 'rich_text_box', 'Message', 0, 1, 1, 1, 1, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (124, 15, 'created_at', 'text', 'Created At', 0, 1, 1, 1, 1, 1, '{}', 7);
INSERT INTO `data_rows` VALUES (125, 15, 'updated_at', 'text', 'Updated At', 0, 1, 1, 1, 1, 1, '{}', 8);
INSERT INTO `data_rows` VALUES (126, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (127, 16, 'fname', 'text', 'Fname', 0, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (128, 16, 'lname', 'text', 'Lname', 0, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (129, 16, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (130, 16, 'city', 'text', 'City', 0, 1, 1, 1, 1, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (131, 16, 'address', 'text', 'Address', 0, 1, 1, 1, 1, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (132, 16, 'comment', 'text', 'Comment', 0, 1, 1, 1, 1, 1, '{}', 7);
INSERT INTO `data_rows` VALUES (133, 16, 'transaction_id', 'text', 'Transaction Id', 0, 0, 1, 1, 1, 1, '{}', 8);
INSERT INTO `data_rows` VALUES (134, 16, 'provider', 'text', 'Provider', 1, 1, 1, 1, 1, 1, '{}', 9);
INSERT INTO `data_rows` VALUES (135, 16, 'ip', 'text', 'Ip', 1, 1, 1, 1, 1, 1, '{}', 10);
INSERT INTO `data_rows` VALUES (136, 16, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 11);
INSERT INTO `data_rows` VALUES (137, 16, 'total_amount', 'text', 'Total Amount', 1, 1, 1, 1, 1, 1, '{}', 12);
INSERT INTO `data_rows` VALUES (138, 16, 'gateway_order_id', 'text', 'Gateway Order Id', 0, 0, 1, 1, 1, 1, '{}', 13);
INSERT INTO `data_rows` VALUES (139, 16, 'gateway_session_id', 'text', 'Gateway Session Id', 0, 0, 1, 1, 1, 1, '{}', 14);
INSERT INTO `data_rows` VALUES (140, 16, 'created_at', 'text', 'Created At', 0, 1, 1, 1, 1, 1, '{}', 15);
INSERT INTO `data_rows` VALUES (141, 16, 'updated_at', 'text', 'Updated At', 0, 0, 1, 1, 1, 1, '{}', 16);
INSERT INTO `data_rows` VALUES (142, 17, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1);
INSERT INTO `data_rows` VALUES (143, 17, 'installment_id', 'text', 'Installment Id', 1, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (144, 17, 'product_id', 'text', 'Product Id', 1, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (145, 17, 'qty', 'text', 'Qty', 1, 1, 1, 1, 1, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (146, 17, 'unit_price', 'text', 'Unit Price', 1, 1, 1, 1, 1, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (147, 17, 'total_price', 'text', 'Total Price', 1, 1, 1, 1, 1, 1, '{}', 7);
INSERT INTO `data_rows` VALUES (148, 17, 'created_at', 'text', 'Created At', 0, 1, 1, 1, 1, 1, '{}', 8);
INSERT INTO `data_rows` VALUES (149, 17, 'updated_at', 'text', 'Updated At', 0, 1, 1, 1, 1, 1, '{}', 9);
INSERT INTO `data_rows` VALUES (150, 16, 'installment_hasmany_installment_order_item_relationship', 'relationship', 'installment_order_items', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\InstallmentOrderItem\",\"table\":\"installment_order_items\",\"type\":\"hasMany\",\"column\":\"installment_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"attribute_values\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17);
INSERT INTO `data_rows` VALUES (151, 17, 'installment_order_item_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"attribute_values\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2);
INSERT INTO `data_rows` VALUES (152, 5, 'a_text', 'text', 'A)  Text', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 11);
INSERT INTO `data_rows` VALUES (153, 5, 'b_text', 'text', 'B) Text', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 14);
INSERT INTO `data_rows` VALUES (154, 5, 'c_text', 'text', 'C) Text', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 17);

-- ----------------------------
-- Table structure for data_types
-- ----------------------------
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `data_types_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `data_types_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO `data_types` VALUES (1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2025-11-02 23:32:50', '2025-11-02 23:32:50');
INSERT INTO `data_types` VALUES (2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2025-11-02 23:32:50', '2025-11-02 23:32:50');
INSERT INTO `data_types` VALUES (3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2025-11-02 23:32:50', '2025-11-02 23:32:50');
INSERT INTO `data_types` VALUES (4, 'categories', 'categories', 'Category', 'Categories', NULL, 'App\\Models\\Category', NULL, 'App\\Http\\Controllers\\Nboard\\CategoryController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2025-11-25 14:40:27', '2025-11-29 16:23:02');
INSERT INTO `data_types` VALUES (5, 'products', 'products', 'Product', 'Products', NULL, 'App\\Models\\Product', NULL, 'App\\Http\\Controllers\\Nboard\\ProductController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-27 21:34:24', '2025-12-07 15:21:41');
INSERT INTO `data_types` VALUES (6, 'colors', 'colors', 'Color', 'Colors', NULL, 'App\\Models\\Color', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2025-11-27 22:10:32', '2025-11-27 22:10:32');
INSERT INTO `data_types` VALUES (7, 'attributes', 'attributes', 'Attribute', 'Attributes', NULL, 'App\\Models\\Attribute', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-27 22:50:17', '2025-11-28 04:27:57');
INSERT INTO `data_types` VALUES (9, 'attribute_values', 'attribute-values', 'Attribute Value', 'Attribute Values', NULL, 'App\\Models\\AttributeValue', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-27 23:44:01', '2025-11-27 23:51:30');
INSERT INTO `data_types` VALUES (10, 'pages', 'pages', 'Static Pages', 'Pages', NULL, 'App\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-28 16:47:10', '2025-11-28 16:49:50');
INSERT INTO `data_types` VALUES (11, 'category_banners', 'category-banners', 'Category Banner', 'Category Banners', NULL, 'App\\Models\\CategoryBanner', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-28 17:57:22', '2025-11-28 18:13:37');
INSERT INTO `data_types` VALUES (12, 'banner_groups', 'banner-groups', 'Banner Groups', 'Banner Groups', NULL, 'App\\Models\\BannerGroup', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-29 15:12:09', '2025-11-29 15:23:01');
INSERT INTO `data_types` VALUES (13, 'banners', 'banners', 'Banner', 'Banners', NULL, 'App\\Models\\Banner', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-29 15:14:09', '2025-11-29 15:25:56');
INSERT INTO `data_types` VALUES (14, 'carousels', 'carousels', 'Carousel', 'Carousels', NULL, 'App\\Models\\Carousel', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-29 22:49:27', '2025-11-29 22:54:44');
INSERT INTO `data_types` VALUES (15, 'contacts', 'contacts', 'Contact', 'Contacts', NULL, 'App\\Models\\Contact', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2025-12-06 01:20:54', '2025-12-06 01:20:54');
INSERT INTO `data_types` VALUES (16, 'installments', 'installments', 'Installment', 'Installments', NULL, 'App\\Models\\Installment', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-12-06 02:00:55', '2025-12-06 02:09:24');
INSERT INTO `data_types` VALUES (17, 'installment_order_items', 'installment-order-items', 'Installment Order Item', 'Installment Order Items', NULL, 'App\\Models\\InstallmentOrderItem', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-12-06 02:01:05', '2025-12-06 02:11:41');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `paths` json NOT NULL,
  `imageable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `images_imageable_type_imageable_id_index`(`imageable_type`, `imageable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------

-- ----------------------------
-- Table structure for installment_callbacks
-- ----------------------------
DROP TABLE IF EXISTS `installment_callbacks`;
CREATE TABLE `installment_callbacks`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of installment_callbacks
-- ----------------------------

-- ----------------------------
-- Table structure for installment_order_items
-- ----------------------------
DROP TABLE IF EXISTS `installment_order_items`;
CREATE TABLE `installment_order_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `installment_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `qty` int UNSIGNED NOT NULL,
  `unit_price` decimal(12, 2) NOT NULL,
  `total_price` decimal(12, 2) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `installment_order_items_installment_id_foreign`(`installment_id`) USING BTREE,
  INDEX `installment_order_items_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `installment_order_items_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `installment_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of installment_order_items
-- ----------------------------
INSERT INTO `installment_order_items` VALUES (18, 11, 16, 1, 49.00, 49.00, '2025-12-06 19:29:24', '2025-12-06 19:29:24');
INSERT INTO `installment_order_items` VALUES (19, 12, 16, 1, 49.00, 49.00, '2025-12-06 20:01:00', '2025-12-06 20:01:00');
INSERT INTO `installment_order_items` VALUES (20, 13, 16, 1, 49.00, 49.00, '2025-12-06 20:01:13', '2025-12-06 20:01:13');
INSERT INTO `installment_order_items` VALUES (21, 14, 16, 1, 49.00, 49.00, '2025-12-06 20:01:49', '2025-12-06 20:01:49');
INSERT INTO `installment_order_items` VALUES (22, 15, 16, 3, 49.00, 147.00, '2025-12-06 20:03:10', '2025-12-06 20:03:10');
INSERT INTO `installment_order_items` VALUES (23, 16, 16, 3, 49.00, 147.00, '2025-12-06 20:03:16', '2025-12-06 20:03:16');
INSERT INTO `installment_order_items` VALUES (24, 17, 21, 2, 1499.00, 2998.00, '2025-12-07 04:21:53', '2025-12-07 04:21:53');

-- ----------------------------
-- Table structure for installments
-- ----------------------------
DROP TABLE IF EXISTS `installments`;
CREATE TABLE `installments`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `transaction_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `provider` enum('tbc','credo','bog') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tbc',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status` enum('pending','paid','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_amount` decimal(12, 2) NOT NULL DEFAULT 0.00,
  `gateway_order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gateway_session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of installments
-- ----------------------------
INSERT INTO `installments` VALUES (11, 'Xandra Bryant', 'Lani Ramos', '+1 (475) 936-5766', '1', 'Cum nihil proident', 'Dolores ut eligendi', NULL, 'bog', '212.58.103.194', 'pending', 49.00, NULL, NULL, '2025-12-06 19:29:24', '2025-12-06 19:29:25');
INSERT INTO `installments` VALUES (12, 'Patricia Stanton', 'Rosalyn Craig', '+1 (943) 531-2269', '1', 'Ullam sunt sit imped', 'Consequatur quas su', NULL, 'credo', '212.58.103.194', 'pending', 49.00, NULL, NULL, '2025-12-06 20:01:00', '2025-12-06 20:01:00');
INSERT INTO `installments` VALUES (13, 'Patricia Stanton', 'Rosalyn Craig', '+1 (943) 531-2269', '1', 'Ullam sunt sit imped', 'Consequatur quas su', NULL, 'tbc', '212.58.103.194', 'pending', 49.00, NULL, '32b05e12-9bfd-4222-ade9-8dde4584d1c7', '2025-12-06 20:01:13', '2025-12-06 20:01:14');
INSERT INTO `installments` VALUES (14, 'Patricia Stanton', 'Rosalyn Craig', '+1 (943) 531-2269', '1', 'Ullam sunt sit imped', 'Consequatur quas su', NULL, 'bog', '212.58.103.194', 'pending', 49.00, NULL, NULL, '2025-12-06 20:01:49', '2025-12-06 20:01:50');
INSERT INTO `installments` VALUES (15, 'Patricia Stanton', 'Rosalyn Craig', '+1 (943) 531-2269', '1', 'Ullam sunt sit imped', 'Consequatur quas su', NULL, 'credo', '212.58.103.194', 'pending', 147.00, NULL, NULL, '2025-12-06 20:03:10', '2025-12-06 20:03:10');
INSERT INTO `installments` VALUES (16, 'Patricia Stanton', 'Rosalyn Craig', '+1 (943) 531-2269', '1', 'Ullam sunt sit imped', 'Consequatur quas su', NULL, 'tbc', '212.58.103.194', 'pending', 147.00, NULL, '963cefa0-e87f-407b-ac2e-9e010336c17a', '2025-12-06 20:03:16', '2025-12-06 20:03:17');
INSERT INTO `installments` VALUES (17, 'Veda Wade', 'Rhea Logan', '+1 (698) 947-6587', '1', 'Omnis id cumque labo', 'Dicta amet perspici', NULL, 'credo', '212.58.103.194', 'pending', 2998.00, NULL, NULL, '2025-12-07 04:21:53', '2025-12-07 04:21:53');

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_items_menu_id_foreign`(`menu_id`) USING BTREE,
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES (1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2025-11-02 23:32:51', '2025-11-28 06:13:26', 'voyager.dashboard', NULL);
INSERT INTO `menu_items` VALUES (2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 13, '2025-11-02 23:32:51', '2025-12-06 02:10:43', 'voyager.media.index', NULL);
INSERT INTO `menu_items` VALUES (3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 12, '2025-11-02 23:32:51', '2025-12-06 02:10:43', 'voyager.users.index', NULL);
INSERT INTO `menu_items` VALUES (4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 11, '2025-11-02 23:32:51', '2025-12-06 02:10:43', 'voyager.roles.index', NULL);
INSERT INTO `menu_items` VALUES (5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 14, '2025-11-02 23:32:51', '2025-12-06 02:10:43', NULL, NULL);
INSERT INTO `menu_items` VALUES (6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.menus.index', NULL);
INSERT INTO `menu_items` VALUES (7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.database.index', NULL);
INSERT INTO `menu_items` VALUES (8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.compass.index', NULL);
INSERT INTO `menu_items` VALUES (9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.bread.index', NULL);
INSERT INTO `menu_items` VALUES (10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 15, '2025-11-02 23:32:51', '2025-12-06 02:10:43', 'voyager.settings.index', NULL);
INSERT INTO `menu_items` VALUES (11, 1, 'Categories', '', '_self', 'voyager-file-text', '#000000', NULL, 2, '2025-11-25 14:40:28', '2025-11-29 15:00:53', 'voyager.categories.index', 'null');
INSERT INTO `menu_items` VALUES (12, 1, 'Products', '', '_self', 'voyager-shop', '#000000', NULL, 6, '2025-11-27 21:34:24', '2025-11-29 15:13:37', 'voyager.products.index', 'null');
INSERT INTO `menu_items` VALUES (13, 1, 'Colors', '', '_self', 'voyager-file-text', '#000000', NULL, 5, '2025-11-27 22:10:32', '2025-11-29 15:13:37', 'voyager.colors.index', 'null');
INSERT INTO `menu_items` VALUES (14, 1, 'Attributes', '', '_self', 'voyager-dot', '#000000', 16, 1, '2025-11-27 22:50:17', '2025-11-28 09:22:42', 'voyager.attributes.index', 'null');
INSERT INTO `menu_items` VALUES (15, 1, 'Attribute Values', '', '_self', 'voyager-dot', '#000000', 16, 2, '2025-11-27 23:44:01', '2025-11-28 09:22:47', 'voyager.attribute-values.index', 'null');
INSERT INTO `menu_items` VALUES (16, 1, 'Attributes', '', '_self', 'voyager-folder', '#000000', NULL, 3, '2025-11-27 23:44:26', '2025-11-29 15:13:08', NULL, '');
INSERT INTO `menu_items` VALUES (17, 1, 'Pages', '', '_self', 'voyager-file-text', '#000000', NULL, 7, '2025-11-28 16:47:10', '2025-11-29 15:13:37', 'voyager.pages.index', 'null');
INSERT INTO `menu_items` VALUES (20, 1, 'Banner Groups', '', '_self', 'voyager-dot', '#000000', 21, 1, '2025-11-29 15:12:09', '2025-11-29 15:25:17', 'voyager.banner-groups.index', 'null');
INSERT INTO `menu_items` VALUES (21, 1, 'Banner Section', '', '_self', 'voyager-folder', '#000000', NULL, 4, '2025-11-29 15:13:28', '2025-11-29 15:25:00', NULL, '');
INSERT INTO `menu_items` VALUES (22, 1, 'Banners', '', '_self', 'voyager-dot', '#000000', 21, 2, '2025-11-29 15:14:09', '2025-11-29 15:25:22', 'voyager.banners.index', 'null');
INSERT INTO `menu_items` VALUES (23, 1, 'Carousels', '', '_self', 'voyager-file-text', '#000000', NULL, 8, '2025-11-29 22:49:28', '2025-11-29 22:51:27', 'voyager.carousels.index', 'null');
INSERT INTO `menu_items` VALUES (24, 1, 'Contacts', '', '_self', 'voyager-mail', '#000000', NULL, 9, '2025-12-06 01:20:54', '2025-12-06 01:21:09', 'voyager.contacts.index', 'null');
INSERT INTO `menu_items` VALUES (25, 1, 'Installments', '', '_self', 'voyager-file-text', '#000000', 27, 1, '2025-12-06 02:00:55', '2025-12-06 02:10:58', 'voyager.installments.index', 'null');
INSERT INTO `menu_items` VALUES (26, 1, 'Installment Order Items', '', '_self', 'voyager-file-text', '#000000', 27, 2, '2025-12-06 02:01:05', '2025-12-06 02:11:03', 'voyager.installment-order-items.index', 'null');
INSERT INTO `menu_items` VALUES (27, 1, 'Installment Group', '', '_self', 'voyager-folder', '#000000', NULL, 10, '2025-12-06 02:10:15', '2025-12-06 02:10:43', NULL, '');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menus_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'admin', '2025-11-02 23:32:51', '2025-11-02 23:32:51');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2016_01_01_000000_add_voyager_user_fields', 1);
INSERT INTO `migrations` VALUES (5, '2016_01_01_000000_create_data_types_table', 1);
INSERT INTO `migrations` VALUES (6, '2016_05_19_173453_create_menu_table', 1);
INSERT INTO `migrations` VALUES (7, '2016_10_21_190000_create_roles_table', 1);
INSERT INTO `migrations` VALUES (8, '2016_10_21_190000_create_settings_table', 1);
INSERT INTO `migrations` VALUES (9, '2016_11_30_135954_create_permission_table', 1);
INSERT INTO `migrations` VALUES (10, '2016_11_30_141208_create_permission_role_table', 1);
INSERT INTO `migrations` VALUES (11, '2016_12_26_201236_data_types__add__server_side', 1);
INSERT INTO `migrations` VALUES (12, '2017_01_13_000000_add_route_to_menu_items_table', 1);
INSERT INTO `migrations` VALUES (13, '2017_01_14_005015_create_translations_table', 1);
INSERT INTO `migrations` VALUES (14, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1);
INSERT INTO `migrations` VALUES (15, '2017_03_06_000000_add_controller_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (16, '2017_04_21_000000_add_order_to_data_rows_table', 1);
INSERT INTO `migrations` VALUES (17, '2017_07_05_210000_add_policyname_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (18, '2017_08_05_000000_add_group_to_settings_table', 1);
INSERT INTO `migrations` VALUES (19, '2017_11_26_013050_add_user_role_relationship', 1);
INSERT INTO `migrations` VALUES (20, '2017_11_26_015000_create_user_roles_table', 1);
INSERT INTO `migrations` VALUES (21, '2018_03_11_000000_add_user_settings', 1);
INSERT INTO `migrations` VALUES (22, '2018_03_14_000000_add_details_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (23, '2018_03_16_000000_make_settings_value_nullable', 1);
INSERT INTO `migrations` VALUES (24, '2025_11_15_033354_create_carts_table', 2);
INSERT INTO `migrations` VALUES (48, '2025_11_15_033354_create_colors_table', 3);
INSERT INTO `migrations` VALUES (49, '2025_11_25_134316_create_categories_table', 3);
INSERT INTO `migrations` VALUES (50, '2025_11_25_134610_create_products_table', 3);
INSERT INTO `migrations` VALUES (51, '2025_11_25_135301_create_attributes_table', 3);
INSERT INTO `migrations` VALUES (52, '2025_11_25_135416_create_product_attribute_values_table', 3);
INSERT INTO `migrations` VALUES (53, '2025_11_25_135549_create_images_table', 3);
INSERT INTO `migrations` VALUES (54, '2025_11_25_135302_create_attribute_values_table', 4);
INSERT INTO `migrations` VALUES (55, '2025_08_31_185407_create_pages_table', 5);
INSERT INTO `migrations` VALUES (59, '0001_01_01_000008_create_banner_groups_table', 1);
INSERT INTO `migrations` VALUES (60, '0001_01_01_000009_create_banners_table', 1);
INSERT INTO `migrations` VALUES (61, '0001_01_01_000010_create_banner_group_banners_table', 1);
INSERT INTO `migrations` VALUES (62, '2025_11_29_224348_create_carousels_table', 6);
INSERT INTO `migrations` VALUES (63, '2025_11_30_155703_create_telescope_entries_table', 7);
INSERT INTO `migrations` VALUES (64, '2025_12_04_210703_create_installments_table', 8);
INSERT INTO `migrations` VALUES (65, '2025_12_04_213705_create_installment_callbacks_table', 8);
INSERT INTO `migrations` VALUES (66, '2025_12_05_022717_installment_order_items', 8);
INSERT INTO `migrations` VALUES (67, '2018_08_08_100000_create_telescope_entries_table', 9);
INSERT INTO `migrations` VALUES (68, '2025_12_06_003038_create_contacts_table', 10);

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `position` enum('everywhere','header','footer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'everywhere',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES (5, 'tsesebi-da-pirobebi', 'წესები და პირობები', 'ჩვენთან იყიდება მხოლოდ შემოწმებული, მხოლოდ ამერიკული და მხოლოდ ორიგინალი ახალი და მეორადი ტელეფონები.\r\nმობაილ ქორნერ-ში ყველა შეძენილ ტელეფონზე გაქვთ რეალური გარანტია. \r\n\r\nყველა მეორადი ტელეფონი არის შეუკეთებელ “გაუხსნელ“ მდგოამრეობებში.\r\n\r\nყველა ტელეფონი გაყიდვის დროს მომხმარებელთან ერთად გადის სრულ შემოწმებას და ამის შემდეგ მომხმარებელს ეძლევა სრული გარანტია.\r\n\r\nმეორადი ტელეფონები არის 10/9 – 10/9.5 კოსმეტიკური მდგომარეობით, გაუხსნელი და შეუკეთებელი. ამაზე კომპანია იღებს სრულ პასუხისმგებლობას. ჩვენი ყველა ტელეფონი არის Sim Free და მუშაობს მსოფლიოს ნებისმიერ ოპერატორზრზე! მობაილ ქორნერ - გთავაზობთ უმაღლესი ხარისხის ორიგინალ ტელეფონებს საქართველოში ყველაზე კონკურენტულ ფასად.', 'everywhere', NULL, '2025-12-07 11:31:02');

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_permission_id_index`(`permission_id`) USING BTREE,
  INDEX `permission_role_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (1, 1);
INSERT INTO `permission_role` VALUES (1, 3);
INSERT INTO `permission_role` VALUES (2, 1);
INSERT INTO `permission_role` VALUES (3, 1);
INSERT INTO `permission_role` VALUES (4, 1);
INSERT INTO `permission_role` VALUES (5, 1);
INSERT INTO `permission_role` VALUES (6, 1);
INSERT INTO `permission_role` VALUES (7, 1);
INSERT INTO `permission_role` VALUES (8, 1);
INSERT INTO `permission_role` VALUES (9, 1);
INSERT INTO `permission_role` VALUES (10, 1);
INSERT INTO `permission_role` VALUES (11, 1);
INSERT INTO `permission_role` VALUES (12, 1);
INSERT INTO `permission_role` VALUES (13, 1);
INSERT INTO `permission_role` VALUES (14, 1);
INSERT INTO `permission_role` VALUES (15, 1);
INSERT INTO `permission_role` VALUES (16, 1);
INSERT INTO `permission_role` VALUES (16, 3);
INSERT INTO `permission_role` VALUES (17, 1);
INSERT INTO `permission_role` VALUES (17, 3);
INSERT INTO `permission_role` VALUES (18, 1);
INSERT INTO `permission_role` VALUES (18, 3);
INSERT INTO `permission_role` VALUES (19, 1);
INSERT INTO `permission_role` VALUES (19, 3);
INSERT INTO `permission_role` VALUES (20, 1);
INSERT INTO `permission_role` VALUES (21, 1);
INSERT INTO `permission_role` VALUES (22, 1);
INSERT INTO `permission_role` VALUES (23, 1);
INSERT INTO `permission_role` VALUES (24, 1);
INSERT INTO `permission_role` VALUES (25, 1);
INSERT INTO `permission_role` VALUES (26, 1);
INSERT INTO `permission_role` VALUES (26, 3);
INSERT INTO `permission_role` VALUES (27, 1);
INSERT INTO `permission_role` VALUES (28, 1);
INSERT INTO `permission_role` VALUES (28, 3);
INSERT INTO `permission_role` VALUES (29, 1);
INSERT INTO `permission_role` VALUES (29, 3);
INSERT INTO `permission_role` VALUES (30, 1);
INSERT INTO `permission_role` VALUES (30, 3);
INSERT INTO `permission_role` VALUES (31, 1);
INSERT INTO `permission_role` VALUES (31, 3);
INSERT INTO `permission_role` VALUES (32, 1);
INSERT INTO `permission_role` VALUES (33, 1);
INSERT INTO `permission_role` VALUES (33, 3);
INSERT INTO `permission_role` VALUES (34, 1);
INSERT INTO `permission_role` VALUES (34, 3);
INSERT INTO `permission_role` VALUES (35, 1);
INSERT INTO `permission_role` VALUES (35, 3);
INSERT INTO `permission_role` VALUES (36, 1);
INSERT INTO `permission_role` VALUES (36, 3);
INSERT INTO `permission_role` VALUES (37, 1);
INSERT INTO `permission_role` VALUES (38, 1);
INSERT INTO `permission_role` VALUES (38, 3);
INSERT INTO `permission_role` VALUES (39, 1);
INSERT INTO `permission_role` VALUES (39, 3);
INSERT INTO `permission_role` VALUES (40, 1);
INSERT INTO `permission_role` VALUES (40, 3);
INSERT INTO `permission_role` VALUES (41, 1);
INSERT INTO `permission_role` VALUES (41, 3);
INSERT INTO `permission_role` VALUES (42, 1);
INSERT INTO `permission_role` VALUES (43, 1);
INSERT INTO `permission_role` VALUES (43, 3);
INSERT INTO `permission_role` VALUES (44, 1);
INSERT INTO `permission_role` VALUES (44, 3);
INSERT INTO `permission_role` VALUES (45, 1);
INSERT INTO `permission_role` VALUES (45, 3);
INSERT INTO `permission_role` VALUES (46, 1);
INSERT INTO `permission_role` VALUES (46, 3);
INSERT INTO `permission_role` VALUES (47, 1);
INSERT INTO `permission_role` VALUES (48, 1);
INSERT INTO `permission_role` VALUES (48, 3);
INSERT INTO `permission_role` VALUES (49, 1);
INSERT INTO `permission_role` VALUES (49, 3);
INSERT INTO `permission_role` VALUES (50, 1);
INSERT INTO `permission_role` VALUES (50, 3);
INSERT INTO `permission_role` VALUES (51, 1);
INSERT INTO `permission_role` VALUES (51, 3);
INSERT INTO `permission_role` VALUES (52, 1);
INSERT INTO `permission_role` VALUES (53, 1);
INSERT INTO `permission_role` VALUES (53, 3);
INSERT INTO `permission_role` VALUES (54, 1);
INSERT INTO `permission_role` VALUES (54, 3);
INSERT INTO `permission_role` VALUES (55, 1);
INSERT INTO `permission_role` VALUES (55, 3);
INSERT INTO `permission_role` VALUES (56, 1);
INSERT INTO `permission_role` VALUES (56, 3);
INSERT INTO `permission_role` VALUES (57, 1);
INSERT INTO `permission_role` VALUES (58, 1);
INSERT INTO `permission_role` VALUES (58, 3);
INSERT INTO `permission_role` VALUES (59, 1);
INSERT INTO `permission_role` VALUES (59, 3);
INSERT INTO `permission_role` VALUES (60, 1);
INSERT INTO `permission_role` VALUES (60, 3);
INSERT INTO `permission_role` VALUES (61, 1);
INSERT INTO `permission_role` VALUES (61, 3);
INSERT INTO `permission_role` VALUES (62, 1);
INSERT INTO `permission_role` VALUES (63, 1);
INSERT INTO `permission_role` VALUES (63, 3);
INSERT INTO `permission_role` VALUES (64, 1);
INSERT INTO `permission_role` VALUES (64, 3);
INSERT INTO `permission_role` VALUES (65, 1);
INSERT INTO `permission_role` VALUES (65, 3);
INSERT INTO `permission_role` VALUES (66, 1);
INSERT INTO `permission_role` VALUES (66, 3);
INSERT INTO `permission_role` VALUES (67, 1);
INSERT INTO `permission_role` VALUES (68, 1);
INSERT INTO `permission_role` VALUES (68, 3);
INSERT INTO `permission_role` VALUES (69, 1);
INSERT INTO `permission_role` VALUES (69, 3);
INSERT INTO `permission_role` VALUES (70, 1);
INSERT INTO `permission_role` VALUES (70, 3);
INSERT INTO `permission_role` VALUES (71, 1);
INSERT INTO `permission_role` VALUES (71, 3);
INSERT INTO `permission_role` VALUES (72, 1);
INSERT INTO `permission_role` VALUES (73, 1);
INSERT INTO `permission_role` VALUES (73, 3);
INSERT INTO `permission_role` VALUES (74, 1);
INSERT INTO `permission_role` VALUES (74, 3);
INSERT INTO `permission_role` VALUES (75, 1);
INSERT INTO `permission_role` VALUES (75, 3);
INSERT INTO `permission_role` VALUES (76, 1);
INSERT INTO `permission_role` VALUES (76, 3);
INSERT INTO `permission_role` VALUES (77, 1);
INSERT INTO `permission_role` VALUES (78, 1);
INSERT INTO `permission_role` VALUES (78, 3);
INSERT INTO `permission_role` VALUES (79, 1);
INSERT INTO `permission_role` VALUES (79, 3);
INSERT INTO `permission_role` VALUES (80, 1);
INSERT INTO `permission_role` VALUES (80, 3);
INSERT INTO `permission_role` VALUES (81, 1);
INSERT INTO `permission_role` VALUES (81, 3);
INSERT INTO `permission_role` VALUES (82, 1);
INSERT INTO `permission_role` VALUES (83, 1);
INSERT INTO `permission_role` VALUES (83, 3);
INSERT INTO `permission_role` VALUES (84, 1);
INSERT INTO `permission_role` VALUES (84, 3);
INSERT INTO `permission_role` VALUES (85, 1);
INSERT INTO `permission_role` VALUES (85, 3);
INSERT INTO `permission_role` VALUES (86, 1);
INSERT INTO `permission_role` VALUES (86, 3);
INSERT INTO `permission_role` VALUES (87, 1);
INSERT INTO `permission_role` VALUES (88, 1);
INSERT INTO `permission_role` VALUES (88, 3);
INSERT INTO `permission_role` VALUES (89, 1);
INSERT INTO `permission_role` VALUES (89, 3);
INSERT INTO `permission_role` VALUES (90, 1);
INSERT INTO `permission_role` VALUES (90, 3);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permissions_key_index`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'browse_admin', NULL, '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (2, 'browse_bread', NULL, '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (3, 'browse_database', NULL, '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (4, 'browse_media', NULL, '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (5, 'browse_compass', NULL, '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (6, 'browse_menus', 'menus', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (7, 'read_menus', 'menus', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (8, 'edit_menus', 'menus', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (9, 'add_menus', 'menus', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (10, 'delete_menus', 'menus', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (11, 'browse_roles', 'roles', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (12, 'read_roles', 'roles', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (13, 'edit_roles', 'roles', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (14, 'add_roles', 'roles', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (15, 'delete_roles', 'roles', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (16, 'browse_users', 'users', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (17, 'read_users', 'users', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (18, 'edit_users', 'users', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (19, 'add_users', 'users', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (20, 'delete_users', 'users', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (21, 'browse_settings', 'settings', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (22, 'read_settings', 'settings', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (23, 'edit_settings', 'settings', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (24, 'add_settings', 'settings', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (25, 'delete_settings', 'settings', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `permissions` VALUES (26, 'browse_categories', 'categories', '2025-11-25 14:40:28', '2025-11-25 14:40:28');
INSERT INTO `permissions` VALUES (27, 'read_categories', 'categories', '2025-11-25 14:40:28', '2025-11-25 14:40:28');
INSERT INTO `permissions` VALUES (28, 'edit_categories', 'categories', '2025-11-25 14:40:28', '2025-11-25 14:40:28');
INSERT INTO `permissions` VALUES (29, 'add_categories', 'categories', '2025-11-25 14:40:28', '2025-11-25 14:40:28');
INSERT INTO `permissions` VALUES (30, 'delete_categories', 'categories', '2025-11-25 14:40:28', '2025-11-25 14:40:28');
INSERT INTO `permissions` VALUES (31, 'browse_products', 'products', '2025-11-27 21:34:24', '2025-11-27 21:34:24');
INSERT INTO `permissions` VALUES (32, 'read_products', 'products', '2025-11-27 21:34:24', '2025-11-27 21:34:24');
INSERT INTO `permissions` VALUES (33, 'edit_products', 'products', '2025-11-27 21:34:24', '2025-11-27 21:34:24');
INSERT INTO `permissions` VALUES (34, 'add_products', 'products', '2025-11-27 21:34:24', '2025-11-27 21:34:24');
INSERT INTO `permissions` VALUES (35, 'delete_products', 'products', '2025-11-27 21:34:24', '2025-11-27 21:34:24');
INSERT INTO `permissions` VALUES (36, 'browse_colors', 'colors', '2025-11-27 22:10:32', '2025-11-27 22:10:32');
INSERT INTO `permissions` VALUES (37, 'read_colors', 'colors', '2025-11-27 22:10:32', '2025-11-27 22:10:32');
INSERT INTO `permissions` VALUES (38, 'edit_colors', 'colors', '2025-11-27 22:10:32', '2025-11-27 22:10:32');
INSERT INTO `permissions` VALUES (39, 'add_colors', 'colors', '2025-11-27 22:10:32', '2025-11-27 22:10:32');
INSERT INTO `permissions` VALUES (40, 'delete_colors', 'colors', '2025-11-27 22:10:32', '2025-11-27 22:10:32');
INSERT INTO `permissions` VALUES (41, 'browse_attributes', 'attributes', '2025-11-27 22:50:17', '2025-11-27 22:50:17');
INSERT INTO `permissions` VALUES (42, 'read_attributes', 'attributes', '2025-11-27 22:50:17', '2025-11-27 22:50:17');
INSERT INTO `permissions` VALUES (43, 'edit_attributes', 'attributes', '2025-11-27 22:50:17', '2025-11-27 22:50:17');
INSERT INTO `permissions` VALUES (44, 'add_attributes', 'attributes', '2025-11-27 22:50:17', '2025-11-27 22:50:17');
INSERT INTO `permissions` VALUES (45, 'delete_attributes', 'attributes', '2025-11-27 22:50:17', '2025-11-27 22:50:17');
INSERT INTO `permissions` VALUES (46, 'browse_attribute_values', 'attribute_values', '2025-11-27 23:44:01', '2025-11-27 23:44:01');
INSERT INTO `permissions` VALUES (47, 'read_attribute_values', 'attribute_values', '2025-11-27 23:44:01', '2025-11-27 23:44:01');
INSERT INTO `permissions` VALUES (48, 'edit_attribute_values', 'attribute_values', '2025-11-27 23:44:01', '2025-11-27 23:44:01');
INSERT INTO `permissions` VALUES (49, 'add_attribute_values', 'attribute_values', '2025-11-27 23:44:01', '2025-11-27 23:44:01');
INSERT INTO `permissions` VALUES (50, 'delete_attribute_values', 'attribute_values', '2025-11-27 23:44:01', '2025-11-27 23:44:01');
INSERT INTO `permissions` VALUES (51, 'browse_pages', 'pages', '2025-11-28 16:47:10', '2025-11-28 16:47:10');
INSERT INTO `permissions` VALUES (52, 'read_pages', 'pages', '2025-11-28 16:47:10', '2025-11-28 16:47:10');
INSERT INTO `permissions` VALUES (53, 'edit_pages', 'pages', '2025-11-28 16:47:10', '2025-11-28 16:47:10');
INSERT INTO `permissions` VALUES (54, 'add_pages', 'pages', '2025-11-28 16:47:10', '2025-11-28 16:47:10');
INSERT INTO `permissions` VALUES (55, 'delete_pages', 'pages', '2025-11-28 16:47:10', '2025-11-28 16:47:10');
INSERT INTO `permissions` VALUES (56, 'browse_category_banners', 'category_banners', '2025-11-28 17:57:22', '2025-11-28 17:57:22');
INSERT INTO `permissions` VALUES (57, 'read_category_banners', 'category_banners', '2025-11-28 17:57:22', '2025-11-28 17:57:22');
INSERT INTO `permissions` VALUES (58, 'edit_category_banners', 'category_banners', '2025-11-28 17:57:22', '2025-11-28 17:57:22');
INSERT INTO `permissions` VALUES (59, 'add_category_banners', 'category_banners', '2025-11-28 17:57:22', '2025-11-28 17:57:22');
INSERT INTO `permissions` VALUES (60, 'delete_category_banners', 'category_banners', '2025-11-28 17:57:22', '2025-11-28 17:57:22');
INSERT INTO `permissions` VALUES (61, 'browse_banner_groups', 'banner_groups', '2025-11-29 15:12:09', '2025-11-29 15:12:09');
INSERT INTO `permissions` VALUES (62, 'read_banner_groups', 'banner_groups', '2025-11-29 15:12:09', '2025-11-29 15:12:09');
INSERT INTO `permissions` VALUES (63, 'edit_banner_groups', 'banner_groups', '2025-11-29 15:12:09', '2025-11-29 15:12:09');
INSERT INTO `permissions` VALUES (64, 'add_banner_groups', 'banner_groups', '2025-11-29 15:12:09', '2025-11-29 15:12:09');
INSERT INTO `permissions` VALUES (65, 'delete_banner_groups', 'banner_groups', '2025-11-29 15:12:09', '2025-11-29 15:12:09');
INSERT INTO `permissions` VALUES (66, 'browse_banners', 'banners', '2025-11-29 15:14:09', '2025-11-29 15:14:09');
INSERT INTO `permissions` VALUES (67, 'read_banners', 'banners', '2025-11-29 15:14:09', '2025-11-29 15:14:09');
INSERT INTO `permissions` VALUES (68, 'edit_banners', 'banners', '2025-11-29 15:14:09', '2025-11-29 15:14:09');
INSERT INTO `permissions` VALUES (69, 'add_banners', 'banners', '2025-11-29 15:14:09', '2025-11-29 15:14:09');
INSERT INTO `permissions` VALUES (70, 'delete_banners', 'banners', '2025-11-29 15:14:09', '2025-11-29 15:14:09');
INSERT INTO `permissions` VALUES (71, 'browse_carousels', 'carousels', '2025-11-29 22:49:28', '2025-11-29 22:49:28');
INSERT INTO `permissions` VALUES (72, 'read_carousels', 'carousels', '2025-11-29 22:49:28', '2025-11-29 22:49:28');
INSERT INTO `permissions` VALUES (73, 'edit_carousels', 'carousels', '2025-11-29 22:49:28', '2025-11-29 22:49:28');
INSERT INTO `permissions` VALUES (74, 'add_carousels', 'carousels', '2025-11-29 22:49:28', '2025-11-29 22:49:28');
INSERT INTO `permissions` VALUES (75, 'delete_carousels', 'carousels', '2025-11-29 22:49:28', '2025-11-29 22:49:28');
INSERT INTO `permissions` VALUES (76, 'browse_contacts', 'contacts', '2025-12-06 01:20:54', '2025-12-06 01:20:54');
INSERT INTO `permissions` VALUES (77, 'read_contacts', 'contacts', '2025-12-06 01:20:54', '2025-12-06 01:20:54');
INSERT INTO `permissions` VALUES (78, 'edit_contacts', 'contacts', '2025-12-06 01:20:54', '2025-12-06 01:20:54');
INSERT INTO `permissions` VALUES (79, 'add_contacts', 'contacts', '2025-12-06 01:20:54', '2025-12-06 01:20:54');
INSERT INTO `permissions` VALUES (80, 'delete_contacts', 'contacts', '2025-12-06 01:20:54', '2025-12-06 01:20:54');
INSERT INTO `permissions` VALUES (81, 'browse_installments', 'installments', '2025-12-06 02:00:55', '2025-12-06 02:00:55');
INSERT INTO `permissions` VALUES (82, 'read_installments', 'installments', '2025-12-06 02:00:55', '2025-12-06 02:00:55');
INSERT INTO `permissions` VALUES (83, 'edit_installments', 'installments', '2025-12-06 02:00:55', '2025-12-06 02:00:55');
INSERT INTO `permissions` VALUES (84, 'add_installments', 'installments', '2025-12-06 02:00:55', '2025-12-06 02:00:55');
INSERT INTO `permissions` VALUES (85, 'delete_installments', 'installments', '2025-12-06 02:00:55', '2025-12-06 02:00:55');
INSERT INTO `permissions` VALUES (86, 'browse_installment_order_items', 'installment_order_items', '2025-12-06 02:01:05', '2025-12-06 02:01:05');
INSERT INTO `permissions` VALUES (87, 'read_installment_order_items', 'installment_order_items', '2025-12-06 02:01:05', '2025-12-06 02:01:05');
INSERT INTO `permissions` VALUES (88, 'edit_installment_order_items', 'installment_order_items', '2025-12-06 02:01:05', '2025-12-06 02:01:05');
INSERT INTO `permissions` VALUES (89, 'add_installment_order_items', 'installment_order_items', '2025-12-06 02:01:05', '2025-12-06 02:01:05');
INSERT INTO `permissions` VALUES (90, 'delete_installment_order_items', 'installment_order_items', '2025-12-06 02:01:05', '2025-12-06 02:01:05');

-- ----------------------------
-- Table structure for product_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute_values`;
CREATE TABLE `product_attribute_values`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `attribute_value_id` bigint NULL DEFAULT NULL,
  `value_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value_id` bigint UNSIGNED NULL DEFAULT NULL,
  `value_number` bigint NULL DEFAULT NULL,
  `value_json` json NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_attribute_values_product_id_attribute_id_unique`(`product_id`, `attribute_id`) USING BTREE,
  INDEX `product_attribute_values_attribute_id_index`(`attribute_id`) USING BTREE,
  INDEX `product_attribute_values_id_foreign`(`value_id`) USING BTREE,
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_attribute_values_id_foreign` FOREIGN KEY (`value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 261 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_attribute_values
-- ----------------------------
INSERT INTO `product_attribute_values` VALUES (99, 19, 26, NULL, NULL, 52, NULL, NULL, '2025-12-06 23:08:36', '2025-12-06 23:08:36');
INSERT INTO `product_attribute_values` VALUES (100, 19, 27, NULL, NULL, 57, NULL, NULL, '2025-12-06 23:08:36', '2025-12-06 23:08:36');
INSERT INTO `product_attribute_values` VALUES (101, 19, 28, NULL, NULL, 61, NULL, NULL, '2025-12-06 23:08:36', '2025-12-06 23:08:36');
INSERT INTO `product_attribute_values` VALUES (102, 19, 29, NULL, NULL, 62, NULL, NULL, '2025-12-06 23:08:36', '2025-12-06 23:08:36');
INSERT INTO `product_attribute_values` VALUES (103, 19, 30, NULL, NULL, 63, NULL, NULL, '2025-12-06 23:08:36', '2025-12-06 23:08:36');
INSERT INTO `product_attribute_values` VALUES (104, 19, 31, NULL, NULL, 64, NULL, NULL, '2025-12-06 23:08:36', '2025-12-06 23:08:36');
INSERT INTO `product_attribute_values` VALUES (105, 19, 32, NULL, NULL, 65, NULL, NULL, '2025-12-06 23:08:36', '2025-12-06 23:08:36');
INSERT INTO `product_attribute_values` VALUES (106, 19, 33, NULL, NULL, 66, NULL, NULL, '2025-12-06 23:08:36', '2025-12-06 23:08:36');
INSERT INTO `product_attribute_values` VALUES (107, 20, 26, NULL, NULL, 52, NULL, NULL, '2025-12-06 23:13:27', '2025-12-06 23:13:27');
INSERT INTO `product_attribute_values` VALUES (108, 20, 27, NULL, NULL, 57, NULL, NULL, '2025-12-06 23:13:27', '2025-12-06 23:13:27');
INSERT INTO `product_attribute_values` VALUES (109, 20, 28, NULL, NULL, 61, NULL, NULL, '2025-12-06 23:13:27', '2025-12-06 23:13:27');
INSERT INTO `product_attribute_values` VALUES (110, 20, 29, NULL, NULL, 62, NULL, NULL, '2025-12-06 23:13:27', '2025-12-06 23:13:27');
INSERT INTO `product_attribute_values` VALUES (111, 20, 30, NULL, NULL, 63, NULL, NULL, '2025-12-06 23:13:27', '2025-12-06 23:13:27');
INSERT INTO `product_attribute_values` VALUES (112, 20, 31, NULL, NULL, 64, NULL, NULL, '2025-12-06 23:13:27', '2025-12-06 23:13:27');
INSERT INTO `product_attribute_values` VALUES (113, 20, 32, NULL, NULL, 65, NULL, NULL, '2025-12-06 23:13:27', '2025-12-06 23:13:27');
INSERT INTO `product_attribute_values` VALUES (114, 20, 33, NULL, NULL, 66, NULL, NULL, '2025-12-06 23:13:27', '2025-12-06 23:13:27');
INSERT INTO `product_attribute_values` VALUES (115, 21, 26, NULL, NULL, 52, NULL, NULL, '2025-12-06 23:21:41', '2025-12-06 23:21:41');
INSERT INTO `product_attribute_values` VALUES (117, 21, 28, NULL, NULL, 61, NULL, NULL, '2025-12-06 23:21:41', '2025-12-06 23:21:41');
INSERT INTO `product_attribute_values` VALUES (118, 21, 29, NULL, NULL, 62, NULL, NULL, '2025-12-06 23:21:41', '2025-12-06 23:21:41');
INSERT INTO `product_attribute_values` VALUES (119, 21, 30, NULL, NULL, 63, NULL, NULL, '2025-12-06 23:21:41', '2025-12-06 23:21:41');
INSERT INTO `product_attribute_values` VALUES (120, 21, 31, NULL, NULL, 64, NULL, NULL, '2025-12-06 23:21:41', '2025-12-06 23:21:41');
INSERT INTO `product_attribute_values` VALUES (121, 21, 32, NULL, NULL, 65, NULL, NULL, '2025-12-06 23:21:41', '2025-12-06 23:21:41');
INSERT INTO `product_attribute_values` VALUES (122, 21, 33, NULL, NULL, 66, NULL, NULL, '2025-12-06 23:21:41', '2025-12-06 23:21:41');
INSERT INTO `product_attribute_values` VALUES (123, 21, 27, NULL, NULL, 57, NULL, NULL, '2025-12-06 23:26:47', '2025-12-06 23:26:47');
INSERT INTO `product_attribute_values` VALUES (124, 22, 26, NULL, NULL, 52, NULL, NULL, '2025-12-06 23:29:57', '2025-12-06 23:29:57');
INSERT INTO `product_attribute_values` VALUES (125, 22, 27, NULL, NULL, 57, NULL, NULL, '2025-12-06 23:29:57', '2025-12-06 23:29:57');
INSERT INTO `product_attribute_values` VALUES (126, 22, 28, NULL, NULL, 61, NULL, NULL, '2025-12-06 23:29:57', '2025-12-06 23:29:57');
INSERT INTO `product_attribute_values` VALUES (127, 22, 29, NULL, NULL, 62, NULL, NULL, '2025-12-06 23:29:57', '2025-12-06 23:29:57');
INSERT INTO `product_attribute_values` VALUES (128, 22, 30, NULL, NULL, 63, NULL, NULL, '2025-12-06 23:29:57', '2025-12-06 23:29:57');
INSERT INTO `product_attribute_values` VALUES (129, 22, 31, NULL, NULL, 64, NULL, NULL, '2025-12-06 23:29:57', '2025-12-06 23:29:57');
INSERT INTO `product_attribute_values` VALUES (130, 22, 32, NULL, NULL, 65, NULL, NULL, '2025-12-06 23:29:57', '2025-12-06 23:29:57');
INSERT INTO `product_attribute_values` VALUES (131, 22, 33, NULL, NULL, 66, NULL, NULL, '2025-12-06 23:29:57', '2025-12-06 23:29:57');
INSERT INTO `product_attribute_values` VALUES (132, 23, 26, NULL, NULL, 52, NULL, NULL, '2025-12-06 23:36:19', '2025-12-06 23:36:19');
INSERT INTO `product_attribute_values` VALUES (133, 23, 27, NULL, NULL, 58, NULL, NULL, '2025-12-06 23:36:19', '2025-12-06 23:36:19');
INSERT INTO `product_attribute_values` VALUES (134, 23, 28, NULL, NULL, 61, NULL, NULL, '2025-12-06 23:36:19', '2025-12-06 23:36:19');
INSERT INTO `product_attribute_values` VALUES (135, 23, 29, NULL, NULL, 62, NULL, NULL, '2025-12-06 23:36:19', '2025-12-06 23:36:19');
INSERT INTO `product_attribute_values` VALUES (136, 23, 30, NULL, NULL, 63, NULL, NULL, '2025-12-06 23:36:19', '2025-12-06 23:36:19');
INSERT INTO `product_attribute_values` VALUES (137, 23, 31, NULL, NULL, 64, NULL, NULL, '2025-12-06 23:36:19', '2025-12-06 23:36:19');
INSERT INTO `product_attribute_values` VALUES (138, 23, 32, NULL, NULL, 65, NULL, NULL, '2025-12-06 23:36:19', '2025-12-06 23:36:19');
INSERT INTO `product_attribute_values` VALUES (139, 23, 33, NULL, NULL, 66, NULL, NULL, '2025-12-06 23:36:19', '2025-12-06 23:36:19');
INSERT INTO `product_attribute_values` VALUES (140, 24, 26, NULL, NULL, 52, NULL, NULL, '2025-12-06 23:38:34', '2025-12-06 23:38:34');
INSERT INTO `product_attribute_values` VALUES (141, 24, 27, NULL, NULL, 58, NULL, NULL, '2025-12-06 23:38:34', '2025-12-06 23:38:34');
INSERT INTO `product_attribute_values` VALUES (142, 24, 28, NULL, NULL, 61, NULL, NULL, '2025-12-06 23:38:34', '2025-12-06 23:38:34');
INSERT INTO `product_attribute_values` VALUES (143, 24, 29, NULL, NULL, 62, NULL, NULL, '2025-12-06 23:38:34', '2025-12-06 23:38:34');
INSERT INTO `product_attribute_values` VALUES (144, 24, 30, NULL, NULL, 63, NULL, NULL, '2025-12-06 23:38:34', '2025-12-06 23:38:34');
INSERT INTO `product_attribute_values` VALUES (145, 24, 31, NULL, NULL, 64, NULL, NULL, '2025-12-06 23:38:34', '2025-12-06 23:38:34');
INSERT INTO `product_attribute_values` VALUES (146, 24, 32, NULL, NULL, 65, NULL, NULL, '2025-12-06 23:38:34', '2025-12-06 23:38:34');
INSERT INTO `product_attribute_values` VALUES (147, 24, 33, NULL, NULL, 66, NULL, NULL, '2025-12-06 23:38:34', '2025-12-06 23:38:34');
INSERT INTO `product_attribute_values` VALUES (148, 25, 26, NULL, NULL, 52, NULL, NULL, '2025-12-06 23:40:43', '2025-12-06 23:40:43');
INSERT INTO `product_attribute_values` VALUES (149, 25, 27, NULL, NULL, 58, NULL, NULL, '2025-12-06 23:40:43', '2025-12-06 23:40:43');
INSERT INTO `product_attribute_values` VALUES (150, 25, 28, NULL, NULL, 61, NULL, NULL, '2025-12-06 23:40:43', '2025-12-06 23:40:43');
INSERT INTO `product_attribute_values` VALUES (151, 25, 29, NULL, NULL, 62, NULL, NULL, '2025-12-06 23:40:43', '2025-12-06 23:40:43');
INSERT INTO `product_attribute_values` VALUES (152, 25, 30, NULL, NULL, 63, NULL, NULL, '2025-12-06 23:40:43', '2025-12-06 23:40:43');
INSERT INTO `product_attribute_values` VALUES (153, 25, 31, NULL, NULL, 64, NULL, NULL, '2025-12-06 23:40:43', '2025-12-06 23:40:43');
INSERT INTO `product_attribute_values` VALUES (154, 25, 32, NULL, NULL, 65, NULL, NULL, '2025-12-06 23:40:43', '2025-12-06 23:40:43');
INSERT INTO `product_attribute_values` VALUES (155, 25, 33, NULL, NULL, 66, NULL, NULL, '2025-12-06 23:40:43', '2025-12-06 23:40:43');
INSERT INTO `product_attribute_values` VALUES (156, 26, 26, NULL, NULL, 52, NULL, NULL, '2025-12-07 00:57:27', '2025-12-07 00:57:27');
INSERT INTO `product_attribute_values` VALUES (157, 26, 27, NULL, NULL, 57, NULL, NULL, '2025-12-07 00:57:27', '2025-12-07 00:57:27');
INSERT INTO `product_attribute_values` VALUES (158, 26, 28, NULL, NULL, 61, NULL, NULL, '2025-12-07 00:57:27', '2025-12-07 00:57:27');
INSERT INTO `product_attribute_values` VALUES (159, 26, 29, NULL, NULL, 62, NULL, NULL, '2025-12-07 00:57:27', '2025-12-07 00:57:27');
INSERT INTO `product_attribute_values` VALUES (160, 26, 30, NULL, NULL, 63, NULL, NULL, '2025-12-07 00:57:27', '2025-12-07 00:57:27');
INSERT INTO `product_attribute_values` VALUES (161, 26, 31, NULL, NULL, 68, NULL, NULL, '2025-12-07 00:57:27', '2025-12-07 00:57:27');
INSERT INTO `product_attribute_values` VALUES (162, 26, 32, NULL, NULL, 67, NULL, NULL, '2025-12-07 00:57:27', '2025-12-07 00:57:27');
INSERT INTO `product_attribute_values` VALUES (163, 26, 33, NULL, NULL, 69, NULL, NULL, '2025-12-07 00:57:27', '2025-12-07 00:57:27');
INSERT INTO `product_attribute_values` VALUES (173, 27, 26, NULL, NULL, 52, NULL, NULL, '2025-12-07 10:32:46', '2025-12-07 10:32:46');
INSERT INTO `product_attribute_values` VALUES (174, 27, 27, NULL, NULL, 58, NULL, NULL, '2025-12-07 10:32:46', '2025-12-07 10:32:46');
INSERT INTO `product_attribute_values` VALUES (175, 27, 34, NULL, NULL, 84, NULL, NULL, '2025-12-07 10:32:46', '2025-12-07 10:32:46');
INSERT INTO `product_attribute_values` VALUES (176, 27, 31, NULL, NULL, 88, NULL, NULL, '2025-12-07 10:32:46', '2025-12-07 10:32:46');
INSERT INTO `product_attribute_values` VALUES (177, 27, 29, NULL, NULL, 89, NULL, NULL, '2025-12-07 10:32:46', '2025-12-07 10:32:46');
INSERT INTO `product_attribute_values` VALUES (178, 27, 28, NULL, NULL, 90, NULL, NULL, '2025-12-07 10:32:46', '2025-12-07 10:32:46');
INSERT INTO `product_attribute_values` VALUES (179, 27, 35, NULL, NULL, 85, NULL, NULL, '2025-12-07 10:32:46', '2025-12-07 10:32:46');
INSERT INTO `product_attribute_values` VALUES (180, 27, 36, NULL, NULL, 86, NULL, NULL, '2025-12-07 10:32:46', '2025-12-07 10:32:46');
INSERT INTO `product_attribute_values` VALUES (181, 27, 32, NULL, NULL, 91, NULL, NULL, '2025-12-07 10:32:46', '2025-12-07 10:32:46');
INSERT INTO `product_attribute_values` VALUES (182, 27, 37, NULL, NULL, 87, NULL, NULL, '2025-12-07 10:32:46', '2025-12-07 10:32:46');
INSERT INTO `product_attribute_values` VALUES (183, 27, 38, NULL, NULL, 93, NULL, NULL, '2025-12-07 10:39:22', '2025-12-07 10:39:22');
INSERT INTO `product_attribute_values` VALUES (184, 27, 39, NULL, NULL, 94, NULL, NULL, '2025-12-07 10:39:22', '2025-12-07 10:39:22');
INSERT INTO `product_attribute_values` VALUES (185, 28, 26, NULL, NULL, 52, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (186, 28, 27, NULL, NULL, 58, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (187, 28, 28, NULL, NULL, 95, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (188, 28, 29, NULL, NULL, 96, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (189, 28, 31, NULL, NULL, 88, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (190, 28, 34, NULL, NULL, 84, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (191, 28, 32, NULL, NULL, 91, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (192, 28, 35, NULL, NULL, 85, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (193, 28, 36, NULL, NULL, 86, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (194, 28, 37, NULL, NULL, 87, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (195, 28, 38, NULL, NULL, 93, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (196, 28, 39, NULL, NULL, 94, NULL, NULL, '2025-12-07 10:50:27', '2025-12-07 10:50:27');
INSERT INTO `product_attribute_values` VALUES (197, 29, 26, NULL, NULL, 52, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (198, 29, 27, NULL, NULL, 59, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (199, 29, 28, NULL, NULL, 95, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (200, 29, 29, NULL, NULL, 96, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (201, 29, 31, NULL, NULL, 88, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (202, 29, 34, NULL, NULL, 84, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (203, 29, 32, NULL, NULL, 91, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (204, 29, 35, NULL, NULL, 85, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (205, 29, 36, NULL, NULL, 86, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (206, 29, 37, NULL, NULL, 87, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (207, 29, 38, NULL, NULL, 93, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (208, 29, 39, NULL, NULL, 94, NULL, NULL, '2025-12-07 10:58:44', '2025-12-07 10:58:44');
INSERT INTO `product_attribute_values` VALUES (209, 30, 26, NULL, NULL, 52, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (210, 30, 27, NULL, NULL, 59, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (211, 30, 28, NULL, NULL, 95, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (212, 30, 29, NULL, NULL, 96, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (213, 30, 31, NULL, NULL, 88, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (214, 30, 32, NULL, NULL, 91, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (215, 30, 34, NULL, NULL, 84, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (216, 30, 35, NULL, NULL, 85, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (217, 30, 36, NULL, NULL, 86, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (218, 30, 37, NULL, NULL, 87, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (219, 30, 38, NULL, NULL, 93, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (220, 30, 39, NULL, NULL, 94, NULL, NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `product_attribute_values` VALUES (221, 31, 26, NULL, NULL, 52, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (222, 31, 27, NULL, NULL, 58, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (223, 31, 28, NULL, NULL, 90, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (224, 31, 29, NULL, NULL, 89, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (225, 31, 31, NULL, NULL, 88, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (226, 31, 32, NULL, NULL, 91, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (227, 31, 34, NULL, NULL, 84, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (228, 31, 35, NULL, NULL, 85, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (229, 31, 36, NULL, NULL, 86, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (230, 31, 37, NULL, NULL, 87, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (231, 31, 38, NULL, NULL, 93, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (232, 31, 39, NULL, NULL, 94, NULL, NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `product_attribute_values` VALUES (233, 32, 26, NULL, NULL, 52, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (234, 32, 27, NULL, NULL, 58, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (235, 32, 28, NULL, NULL, 90, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (236, 32, 29, NULL, NULL, 89, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (237, 32, 31, NULL, NULL, 88, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (238, 32, 32, NULL, NULL, 91, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (239, 32, 34, NULL, NULL, 84, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (240, 32, 35, NULL, NULL, 85, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (241, 32, 36, NULL, NULL, 86, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (242, 32, 37, NULL, NULL, 87, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (243, 32, 38, NULL, NULL, 93, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (244, 32, 39, NULL, NULL, 94, NULL, NULL, '2025-12-07 11:22:45', '2025-12-07 11:22:45');
INSERT INTO `product_attribute_values` VALUES (245, 33, 26, NULL, NULL, 52, NULL, NULL, '2025-12-07 21:13:29', '2025-12-07 21:13:29');
INSERT INTO `product_attribute_values` VALUES (246, 33, 27, NULL, NULL, 57, NULL, NULL, '2025-12-07 21:13:29', '2025-12-07 21:13:29');
INSERT INTO `product_attribute_values` VALUES (247, 33, 28, NULL, NULL, 61, NULL, NULL, '2025-12-07 21:13:29', '2025-12-07 21:13:29');
INSERT INTO `product_attribute_values` VALUES (248, 33, 29, NULL, NULL, 97, NULL, NULL, '2025-12-07 21:13:29', '2025-12-07 21:13:29');
INSERT INTO `product_attribute_values` VALUES (249, 33, 30, NULL, NULL, 98, NULL, NULL, '2025-12-07 21:13:29', '2025-12-07 21:13:29');
INSERT INTO `product_attribute_values` VALUES (250, 33, 31, NULL, NULL, 101, NULL, NULL, '2025-12-07 21:13:29', '2025-12-07 21:13:29');
INSERT INTO `product_attribute_values` VALUES (251, 33, 32, NULL, NULL, 65, NULL, NULL, '2025-12-07 21:13:29', '2025-12-07 21:13:29');
INSERT INTO `product_attribute_values` VALUES (252, 33, 33, NULL, NULL, 100, NULL, NULL, '2025-12-07 21:13:29', '2025-12-07 21:13:29');
INSERT INTO `product_attribute_values` VALUES (253, 34, 26, NULL, NULL, 52, NULL, NULL, '2025-12-07 21:24:57', '2025-12-07 21:24:57');
INSERT INTO `product_attribute_values` VALUES (254, 34, 27, NULL, NULL, 57, NULL, NULL, '2025-12-07 21:24:57', '2025-12-07 21:24:57');
INSERT INTO `product_attribute_values` VALUES (255, 34, 28, NULL, NULL, 61, NULL, NULL, '2025-12-07 21:24:57', '2025-12-07 21:24:57');
INSERT INTO `product_attribute_values` VALUES (256, 34, 29, NULL, NULL, 97, NULL, NULL, '2025-12-07 21:24:57', '2025-12-07 21:24:57');
INSERT INTO `product_attribute_values` VALUES (257, 34, 30, NULL, NULL, 98, NULL, NULL, '2025-12-07 21:24:57', '2025-12-07 21:24:57');
INSERT INTO `product_attribute_values` VALUES (258, 34, 31, NULL, NULL, 101, NULL, NULL, '2025-12-07 21:24:57', '2025-12-07 21:24:57');
INSERT INTO `product_attribute_values` VALUES (259, 34, 32, NULL, NULL, 65, NULL, NULL, '2025-12-07 21:24:57', '2025-12-07 21:24:57');
INSERT INTO `product_attribute_values` VALUES (260, 34, 33, NULL, NULL, 100, NULL, NULL, '2025-12-07 21:24:57', '2025-12-07 21:24:57');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED NULL DEFAULT NULL,
  `color_id` bigint UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `a_old_price` decimal(12, 2) NOT NULL DEFAULT 0.00,
  `b_old_price` decimal(12, 2) NULL DEFAULT 0.00,
  `c_old_price` decimal(12, 2) NULL DEFAULT 0.00,
  `a_new_price` decimal(12, 2) NULL DEFAULT 0.00,
  `b_new_price` decimal(12, 2) NULL DEFAULT 0.00,
  `c_new_price` decimal(12, 2) NULL DEFAULT 0.00,
  `a_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `b_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `c_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `currency` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'LARI',
  `stock` int NOT NULL DEFAULT 1,
  `status` enum('draft','active') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `condition` enum('owned','new') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'new',
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_slug_unique`(`slug`) USING BTREE,
  INDEX `products_category_id_index`(`category_id`) USING BTREE,
  INDEX `products_color_id_index`(`color_id`) USING BTREE,
  INDEX `products_status_index`(`status`) USING BTREE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `products_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (16, 65, 6, '20W USB-C Power Adapter', '20w-usb-c-power-adapter', '<p>The Apple 20W USB‑C Power Adapter offers fast, efficient charging at home, in the office, or on the go. Pair it with iPhone 8 or later for fast charging &mdash; up to 50 percent battery in around 35 minutes.&sup1; Or pair it with the iPad Pro and iPad Air for optimal charging performance. You can also pair it with iPhone 8 or later to take advantage of the fast-charging feature.</p>', 75.00, NULL, NULL, 49.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'new', '[\"products\\/December2025\\/EwJ5Fy0FWF3qnZGM1LCD.jpg\",\"products\\/December2025\\/JDTODDExoHEZWOk26Dxz.jpg\",\"products\\/December2025\\/JW15PDX49dXIV9B93Kiv.jpg\",\"products\\/December2025\\/1e0ipWkVy6PcvB6ZPJNj.jpg\"]', '2025-12-06 22:16:02', '2025-12-06 17:34:20', '2025-12-06 22:16:02');
INSERT INTO `products` VALUES (17, 46, 9, 'Apple iPhone 14 Pro', 'apple-iphone-14-pro', NULL, 1699.00, NULL, NULL, 1499.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/M9G99vINT48fGGmyYsxL.jpg\"]', '2025-12-06 22:15:59', '2025-12-06 21:21:06', '2025-12-06 22:15:59');
INSERT INTO `products` VALUES (18, 46, 8, 'Apple iPhone 14 Pro', 'apple-iphone-14-pro-1', NULL, 1699.00, NULL, NULL, 1499.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/ggO2pozCvihFCSbVyvgs.jpg\"]', '2025-12-06 22:15:55', '2025-12-06 21:40:46', '2025-12-06 22:15:55');
INSERT INTO `products` VALUES (19, 46, 9, 'Apple iPhone 14 Pro 128GB', 'apple-iphone-14-pro-2', NULL, 1699.00, NULL, NULL, 1499.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/dTDZqcGhaLelRGaTvmiC.jpg\"]', NULL, '2025-12-06 23:08:36', '2025-12-06 23:32:49');
INSERT INTO `products` VALUES (20, 46, 8, 'Apple iPhone 14 Pro 128GB', 'apple-iphone-14-pro-3', NULL, 1699.00, NULL, NULL, 1499.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/qpJZOBobEbe7W29FObTG.jpg\"]', NULL, '2025-12-06 23:13:27', '2025-12-06 23:32:35');
INSERT INTO `products` VALUES (21, 46, 6, 'Apple iPhone 14 Pro 128GB', 'apple-iphone-14-pro-4', NULL, 1699.00, NULL, NULL, 1499.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/ZAUKpy3ub42dbB3BByyt.jpg\"]', NULL, '2025-12-06 23:21:41', '2025-12-06 23:32:20');
INSERT INTO `products` VALUES (22, 46, 7, 'Apple iPhone 14 Pro 128GB', 'apple-iphone-14-pro-5', NULL, 1699.00, NULL, NULL, 1499.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/UcWbgJx7YbLAVpS8QnBX.jpg\"]', NULL, '2025-12-06 23:29:57', '2025-12-06 23:32:08');
INSERT INTO `products` VALUES (23, 46, 6, 'Apple iPhone 14 Pro 256GB', 'apple-iphone-14-pro-256gb', NULL, 1799.00, NULL, NULL, 1599.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/mwFfjVn128WQAp3XaLaN.jpg\"]', NULL, '2025-12-06 23:36:19', '2025-12-06 23:36:19');
INSERT INTO `products` VALUES (24, 46, 7, 'Apple iPhone 14 Pro 256GB', 'apple-iphone-14-pro-256gb-1', NULL, 1799.00, NULL, NULL, 1599.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/15Wt7SRnPN1mpk1RSulJ.jpg\"]', NULL, '2025-12-06 23:38:34', '2025-12-06 23:38:34');
INSERT INTO `products` VALUES (25, 46, 8, 'Apple iPhone 14 Pro 256GB', 'apple-iphone-14-pro-256gb-2', '<p>გარანტია: 6 თვე&nbsp; კომპლექტაცია: ორიგინალი USB კაბელი, დამცავი ფირი, ქეისი</p>', 1799.00, NULL, NULL, 1599.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/PtWkLFeHef38eZz0cWEW.jpg\"]', NULL, '2025-12-06 23:40:43', '2025-12-06 23:43:46');
INSERT INTO `products` VALUES (26, 46, 10, 'Apple iphone 15 pro 128GB', 'iphone-15-pro-128gb', NULL, 1999.00, NULL, NULL, 1849.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/7KsayQaj7qBpJ9xh5dLw.webp\"]', NULL, '2025-12-07 00:57:27', '2025-12-07 21:26:28');
INSERT INTO `products` VALUES (27, 53, 7, 'MacBook Air 2025 256GB 13 inch Silver', 'macbook-air-2025-256gb-13-inch', '<p>Apple MacBook Air 13 inch 2025 MW0X3LL/A M4 Chip 10c CPU 10c GPU 16GB/256GB SSD Silver გამოირჩევა კომპაქტურობით, მაღალი წარმადობითა და სრულყოფილი ინტეგრაციით Apple ეკოსისტემაში, რაც მას იდეალურ არჩევანად აქცევს მათთვის, ვისაც სჭირდება საიმედო, მოქნილი და სტილზე მორგებული სამუშაო ინსტრუმენტი ყოველდღიური გამოყენებისთვის. Apple M4 ჩიპი და macOS ოპერაციული სისტემა უზრუნველყოფს შეუფერხებელ მუშაობას, ენერგოეფექტურობასა და მარტივ სინქრონიზაციას სხვა Apple მოწყობილობებთან. 16 GB ოპერატიული მეხსიერება გაძლევთ საშუალებას შეუფერხებლად იმუშაოთ ერთდროულად რამდენიმე პროგრამაში და ეფექტურად გამოიყენოთ ლეპტოპის მთლიანი რესურსი. 256 GB SSD კი გთავაზობთ ელვისებურ ჩატვირთვას, აპლიკაციების მყისიერ გახსნას და მონაცემების ეფექტურ დამუშავებას. 13.6 ინჩიანი Retina Display გამორჩეულია დეტალური გამოსახულებით, მაღალი კონტრასტითა და ფერების იდეალური სიზუსტით, რაც განსაკუთრებით გამოსადეგია როგორც ტექსტზე მუშაობისას,ისე გრაფიკულ და ვიზუალურ ამოცანებზე. მსუბუქი კორპუსი და დახვეწილი დიზაინი ლეპტოპს იდეალურს ხდის სხვადასხვა სამუშაო სივრცისთვის.&nbsp;</p>', 2899.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'new', '[\"products\\/December2025\\/IhkPcyC1oJlrz4dVa2zF.jpeg\"]', NULL, '2025-12-07 10:23:54', '2025-12-07 11:10:49');
INSERT INTO `products` VALUES (28, 53, 15, 'Macbook Air 2025 256GB 15 inch Midnight', 'macbook-air-2025-256gb-15-inch', '<p>Apple MacBook Air 15 inch 2025 MW0X3LL/A M4 Chip 10c CPU 10c GPU 16GB/256GB SSD Midnight გამოირჩევა კომპაქტურობით, მაღალი წარმადობითა და სრულყოფილი ინტეგრაციით Apple ეკოსისტემაში, რაც მას იდეალურ არჩევანად აქცევს მათთვის, ვისაც სჭირდება საიმედო, მოქნილი და სტილზე მორგებული სამუშაო ინსტრუმენტი ყოველდღიური გამოყენებისთვის. Apple M4 ჩიპი და macOS ოპერაციული სისტემა უზრუნველყოფს შეუფერხებელ მუშაობას, ენერგოეფექტურობასა და მარტივ სინქრონიზაციას სხვა Apple მოწყობილობებთან. 16 GB ოპერატიული მეხსიერება გაძლევთ საშუალებას შეუფერხებლად იმუშაოთ ერთდროულად რამდენიმე პროგრამაში და ეფექტურად გამოიყენოთ ლეპტოპის მთლიანი რესურსი. 256 GB SSD კი გთავაზობთ ელვისებურ ჩატვირთვას, აპლიკაციების მყისიერ გახსნას და მონაცემების ეფექტურ დამუშავებას. 15.3 ინჩიანი Retina Display გამორჩეულია დეტალური გამოსახულებით, მაღალი კონტრასტითა და ფერების იდეალური სიზუსტით, რაც განსაკუთრებით გამოსადეგია როგორც ტექსტზე მუშაობისას,ისე გრაფიკულ და ვიზუალურ ამოცანებზე. მსუბუქი კორპუსი და დახვეწილი დიზაინი ლეპტოპს იდეალურს ხდის სხვადასხვა სამუშაო სივრცისთვის.&nbsp;</p>', 3499.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'new', '[\"products\\/December2025\\/s4JWG4xQfkLDXBk6P7WL.jpeg\"]', NULL, '2025-12-07 10:50:27', '2025-12-07 11:08:49');
INSERT INTO `products` VALUES (29, 53, 7, 'Macbook Air 2025 512GB 15 inch Silver', 'macbook-air-2025-512gb-15-inch', '<p>Apple MacBook Air 15 inch 2025 MW0X3LL/A M4 Chip 10c CPU 10c GPU 16GB/512GB SSD Silver გამოირჩევა კომპაქტურობით, მაღალი წარმადობითა და სრულყოფილი ინტეგრაციით Apple ეკოსისტემაში, რაც მას იდეალურ არჩევანად აქცევს მათთვის, ვისაც სჭირდება საიმედო, მოქნილი და სტილზე მორგებული სამუშაო ინსტრუმენტი ყოველდღიური გამოყენებისთვის. Apple M4 ჩიპი და macOS ოპერაციული სისტემა უზრუნველყოფს შეუფერხებელ მუშაობას, ენერგოეფექტურობასა და მარტივ სინქრონიზაციას სხვა Apple მოწყობილობებთან. 16 GB ოპერატიული მეხსიერება გაძლევთ საშუალებას შეუფერხებლად იმუშაოთ ერთდროულად რამდენიმე პროგრამაში და ეფექტურად გამოიყენოთ ლეპტოპის მთლიანი რესურსი. 512 GB SSD კი გთავაზობთ ელვისებურ ჩატვირთვას, აპლიკაციების მყისიერ გახსნას და მონაცემების ეფექტურ დამუშავებას. 15.3 ინჩიანი Retina Display გამორჩეულია დეტალური გამოსახულებით, მაღალი კონტრასტითა და ფერების იდეალური სიზუსტით, რაც განსაკუთრებით გამოსადეგია როგორც ტექსტზე მუშაობისას,ისე გრაფიკულ და ვიზუალურ ამოცანებზე. მსუბუქი კორპუსი და დახვეწილი დიზაინი ლეპტოპს იდეალურს ხდის სხვადასხვა სამუშაო სივრცისთვის.&nbsp;</p>', 3999.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'new', '[\"products\\/December2025\\/x5FTIczIT8gjrpoaK3p7.jpeg\"]', NULL, '2025-12-07 10:58:44', '2025-12-07 11:07:57');
INSERT INTO `products` VALUES (30, 53, 17, 'Macbook Air 2025 512GB 15 inch Starlight', 'macbook-air-2025-512gb-15-inch-starlight', '<p>Apple MacBook Air 15 inch 2025 MW0X3LL/A M4 Chip 10c CPU 10c GPU 16GB/512GB SSD StarLight გამოირჩევა კომპაქტურობით, მაღალი წარმადობითა და სრულყოფილი ინტეგრაციით Apple ეკოსისტემაში, რაც მას იდეალურ არჩევანად აქცევს მათთვის, ვისაც სჭირდება საიმედო, მოქნილი და სტილზე მორგებული სამუშაო ინსტრუმენტი ყოველდღიური გამოყენებისთვის. Apple M4 ჩიპი და macOS ოპერაციული სისტემა უზრუნველყოფს შეუფერხებელ მუშაობას, ენერგოეფექტურობასა და მარტივ სინქრონიზაციას სხვა Apple მოწყობილობებთან. 16 GB ოპერატიული მეხსიერება გაძლევთ საშუალებას შეუფერხებლად იმუშაოთ ერთდროულად რამდენიმე პროგრამაში და ეფექტურად გამოიყენოთ ლეპტოპის მთლიანი რესურსი. 512 GB SSD კი გთავაზობთ ელვისებურ ჩატვირთვას, აპლიკაციების მყისიერ გახსნას და მონაცემების ეფექტურ დამუშავებას. 15.3 ინჩიანი Retina Display გამორჩეულია დეტალური გამოსახულებით, მაღალი კონტრასტითა და ფერების იდეალური სიზუსტით, რაც განსაკუთრებით გამოსადეგია როგორც ტექსტზე მუშაობისას,ისე გრაფიკულ და ვიზუალურ ამოცანებზე. მსუბუქი კორპუსი და დახვეწილი დიზაინი ლეპტოპს იდეალურს ხდის სხვადასხვა სამუშაო სივრცისთვის.&nbsp;</p>', 3999.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LARI', 2, 'active', 'new', '[\"products\\/December2025\\/Iel5FO3g50UjbIg3KB27.jpeg\"]', NULL, '2025-12-07 11:07:43', '2025-12-07 11:07:43');
INSERT INTO `products` VALUES (31, 53, 14, 'MacBook Air 2025 256GB 13 inch Sky Blue', 'macbook-air-2025-256gb-13-inch-sky-blue', '<p>Apple MacBook Air 13 inch 2025 MW0X3LL/A M4 Chip 10c CPU 10c GPU 16GB/256GB SSD Sky Blue გამოირჩევა კომპაქტურობით, მაღალი წარმადობითა და სრულყოფილი ინტეგრაციით Apple ეკოსისტემაში, რაც მას იდეალურ არჩევანად აქცევს მათთვის, ვისაც სჭირდება საიმედო, მოქნილი და სტილზე მორგებული სამუშაო ინსტრუმენტი ყოველდღიური გამოყენებისთვის. Apple M4 ჩიპი და macOS ოპერაციული სისტემა უზრუნველყოფს შეუფერხებელ მუშაობას, ენერგოეფექტურობასა და მარტივ სინქრონიზაციას სხვა Apple მოწყობილობებთან. 16 GB ოპერატიული მეხსიერება გაძლევთ საშუალებას შეუფერხებლად იმუშაოთ ერთდროულად რამდენიმე პროგრამაში და ეფექტურად გამოიყენოთ ლეპტოპის მთლიანი რესურსი. 256 GB SSD კი გთავაზობთ ელვისებურ ჩატვირთვას, აპლიკაციების მყისიერ გახსნას და მონაცემების ეფექტურ დამუშავებას. 13.6 ინჩიანი Retina Display გამორჩეულია დეტალური გამოსახულებით, მაღალი კონტრასტითა და ფერების იდეალური სიზუსტით, რაც განსაკუთრებით გამოსადეგია როგორც ტექსტზე მუშაობისას,ისე გრაფიკულ და ვიზუალურ ამოცანებზე. მსუბუქი კორპუსი და დახვეწილი დიზაინი ლეპტოპს იდეალურს ხდის სხვადასხვა სამუშაო სივრცისთვის.&nbsp;</p>', 2899.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LARI', 2, 'active', 'new', '[\"products\\/December2025\\/7snv1Zme98b6iaOSfYmT.jpeg\"]', NULL, '2025-12-07 11:16:46', '2025-12-07 11:16:46');
INSERT INTO `products` VALUES (32, 53, 17, 'MacBook Air 2025 256GB 13 inch Starlight', 'macbook-air-2025-256gb-13-inch-starlight', '<p>Apple MacBook Air 13 inch 2025 MW0X3LL/A M4 Chip 10c CPU 10c GPU 16GB/256GB SSD StarLight გამოირჩევა კომპაქტურობით, მაღალი წარმადობითა და სრულყოფილი ინტეგრაციით Apple ეკოსისტემაში, რაც მას იდეალურ არჩევანად აქცევს მათთვის, ვისაც სჭირდება საიმედო, მოქნილი და სტილზე მორგებული სამუშაო ინსტრუმენტი ყოველდღიური გამოყენებისთვის. Apple M4 ჩიპი და macOS ოპერაციული სისტემა უზრუნველყოფს შეუფერხებელ მუშაობას, ენერგოეფექტურობასა და მარტივ სინქრონიზაციას სხვა Apple მოწყობილობებთან. 16 GB ოპერატიული მეხსიერება გაძლევთ საშუალებას შეუფერხებლად იმუშაოთ ერთდროულად რამდენიმე პროგრამაში და ეფექტურად გამოიყენოთ ლეპტოპის მთლიანი რესურსი. 256 GB SSD კი გთავაზობთ ელვისებურ ჩატვირთვას, აპლიკაციების მყისიერ გახსნას და მონაცემების ეფექტურ დამუშავებას. 13.6 ინჩიანი Retina Display გამორჩეულია დეტალური გამოსახულებით, მაღალი კონტრასტითა და ფერების იდეალური სიზუსტით, რაც განსაკუთრებით გამოსადეგია როგორც ტექსტზე მუშაობისას,ისე გრაფიკულ და ვიზუალურ ამოცანებზე. მსუბუქი კორპუსი და დახვეწილი დიზაინი ლეპტოპს იდეალურს ხდის სხვადასხვა სამუშაო სივრცისთვის.&nbsp;</p>', 2899.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LARI', 2, 'active', 'new', '[\"products\\/December2025\\/Xa5JwaTlELkF42hjG3qt.jpeg\"]', NULL, '2025-12-07 11:22:45', '2025-12-07 15:22:23');
INSERT INTO `products` VALUES (33, 46, 20, 'Apple iPhone 13 Pro 128GB', 'apple-iphone-13-pro-128gb', NULL, 1499.00, NULL, NULL, 1299.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/1AHKyz4ZcfRelRuVjTMe.png\"]', NULL, '2025-12-07 21:13:29', '2025-12-07 21:17:21');
INSERT INTO `products` VALUES (34, 46, 19, 'Apple iPhone 13 Pro 128GB', 'apple-iphone-13-pro-128gb-1', NULL, 1499.00, NULL, NULL, 1299.00, NULL, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\/December2025\\/pbiMCr447kJipuUwQxgA.png\"]', NULL, '2025-12-07 21:24:57', '2025-12-07 21:24:57');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'Administrator', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `roles` VALUES (2, 'user', 'Normal User', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `roles` VALUES (3, 'manager', 'Manager', '2025-12-06 15:13:33', '2025-12-06 15:13:40');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('MGD2XLfYSaYRXSoxwlIpDbmVPGrv3m7P4inoCxvY', NULL, '212.58.121.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_1_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/143.0.7499.92 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEhENG4zeTBSOEFBNnpaZTVveldud1phSE1ZUXBFRllzUzhkU3R3ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vbW9iaWxlY29ybmVyLmFsZXJ0bWUudG9wL3Byb2R1Y3QvYXBwbGUtaXBob25lLTEzLXByby0xMjhnYi0xIjtzOjU6InJvdXRlIjtzOjE1OiJwYWdlcy5mdWxsLXBhZ2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765146270);
INSERT INTO `sessions` VALUES ('Or3mqEATdO9pEU3YYQG3bFznLjn9wMychkpGYZMF', NULL, '212.58.103.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTRkV0MzTklzclJxTDdKVDZ6UzJCN0VGamhURUJjQWxranFHNHBqQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vbW9iaWxlY29ybmVyLmFsZXJ0bWUudG9wL3Byb2R1Y3QvaXBob25lLTE1LXByby0xMjhnYiI7czo1OiJyb3V0ZSI7czoxNToicGFnZXMuZnVsbC1wYWdlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765160262);
INSERT INTO `sessions` VALUES ('RE4woPAvXZ18Ce8eiy1hIGnzPbPcdY8YRmyt4oKp', 3, '212.58.121.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTnN5dWVOTTluV2NOc0JEcXJpdm5kMnZqQVVyRnZSeU80akpHTUhYRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vbW9iaWxlY29ybmVyLmFsZXJ0bWUudG9wIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1765143856);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT 1,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_key_unique`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site');
INSERT INTO `settings` VALUES (2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site');
INSERT INTO `settings` VALUES (3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site');
INSERT INTO `settings` VALUES (4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site');
INSERT INTO `settings` VALUES (5, 'admin.bg_image', 'Admin Background Image', 'settings\\November2025\\y5Fa0k4vnYdJlmVnT11C.webp', '', 'image', 5, 'Admin');
INSERT INTO `settings` VALUES (6, 'admin.title', 'Admin Title', 'Mobilecorner', '', 'text', 1, 'Admin');
INSERT INTO `settings` VALUES (7, 'admin.description', 'Admin Description', 'Mobilecorner.ge', '', 'text', 2, 'Admin');
INSERT INTO `settings` VALUES (8, 'admin.loader', 'Admin Loader', 'settings\\November2025\\Z9NqC7UCuvCp1capvLMw.png', '', 'image', 3, 'Admin');
INSERT INTO `settings` VALUES (9, 'admin.icon_image', 'Admin Icon Image', 'settings\\November2025\\cWtBEpj1JOjkNmQcYMSY.png', '', 'image', 4, 'Admin');
INSERT INTO `settings` VALUES (10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- ----------------------------
-- Table structure for telescope_entries
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries`;
CREATE TABLE `telescope_entries`  (
  `sequence` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`sequence`) USING BTREE,
  UNIQUE INDEX `telescope_entries_uuid_unique`(`uuid`) USING BTREE,
  INDEX `telescope_entries_batch_id_index`(`batch_id`) USING BTREE,
  INDEX `telescope_entries_family_hash_index`(`family_hash`) USING BTREE,
  INDEX `telescope_entries_created_at_index`(`created_at`) USING BTREE,
  INDEX `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telescope_entries
-- ----------------------------

-- ----------------------------
-- Table structure for telescope_entries_tags
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries_tags`;
CREATE TABLE `telescope_entries_tags`  (
  `entry_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`entry_uuid`, `tag`) USING BTREE,
  INDEX `telescope_entries_tags_tag_index`(`tag`) USING BTREE,
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telescope_entries_tags
-- ----------------------------

-- ----------------------------
-- Table structure for telescope_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `telescope_monitoring`;
CREATE TABLE `telescope_monitoring`  (
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telescope_monitoring
-- ----------------------------

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `translations_table_name_column_name_foreign_key_locale_unique`(`table_name`, `column_name`, `foreign_key`, `locale`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of translations
-- ----------------------------
INSERT INTO `translations` VALUES (1, 'data_rows', 'display_name', 22, 'en', 'Id', '2025-11-25 14:56:21', '2025-11-25 14:56:21');
INSERT INTO `translations` VALUES (2, 'data_rows', 'display_name', 23, 'en', 'Parent Id', '2025-11-25 14:56:21', '2025-11-25 14:56:21');
INSERT INTO `translations` VALUES (3, 'data_rows', 'display_name', 24, 'en', 'Name', '2025-11-25 14:56:21', '2025-11-25 14:56:21');
INSERT INTO `translations` VALUES (4, 'data_rows', 'display_name', 25, 'en', 'Slug', '2025-11-25 14:56:21', '2025-11-25 14:56:21');
INSERT INTO `translations` VALUES (5, 'data_rows', 'display_name', 26, 'en', 'Description', '2025-11-25 14:56:21', '2025-11-25 14:56:21');
INSERT INTO `translations` VALUES (6, 'data_rows', 'display_name', 27, 'en', 'Position', '2025-11-25 14:56:21', '2025-11-25 14:56:21');
INSERT INTO `translations` VALUES (7, 'data_rows', 'display_name', 28, 'en', 'Created At', '2025-11-25 14:56:21', '2025-11-25 14:56:21');
INSERT INTO `translations` VALUES (8, 'data_rows', 'display_name', 29, 'en', 'Updated At', '2025-11-25 14:56:21', '2025-11-25 14:56:21');
INSERT INTO `translations` VALUES (9, 'data_rows', 'display_name', 30, 'en', 'categories', '2025-11-25 14:56:21', '2025-11-25 14:56:21');
INSERT INTO `translations` VALUES (10, 'data_types', 'display_name_singular', 4, 'en', 'Category', '2025-11-25 14:56:21', '2025-11-25 14:56:21');
INSERT INTO `translations` VALUES (11, 'data_types', 'display_name_plural', 4, 'en', 'Categories', '2025-11-25 14:56:21', '2025-11-25 14:56:21');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `user_roles_user_id_index`(`user_id`) USING BTREE,
  INDEX `user_roles_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_roles
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'users/default.png',
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 1, 'Super Admin', 'nikakharadze82@gmail.com', 'users\\November2025\\jhVjRCjEACqHauNvq9EE.png', NULL, '$2y$12$TYoccilpFM8RqOzdCgNDGuzJisjLazBD2bcjGcdJO.TmrGUM7Ex5i', NULL, '{\"locale\":\"en\"}', '2025-11-02 23:38:58', '2025-11-28 09:55:09');
INSERT INTO `users` VALUES (3, 3, 'მიშო', 'misho@gmail.com', 'users/default.png', NULL, '$2y$12$.74PBaGHZrXB1zOaYm0bGuamawdc878bDv59aECghAv0BYAd04Nua', '7k0Evqdrr5X4n97lpzC9CcI64jHJOcvic5rSX8AGSeluxDFrCNuuKMDVPpmT', '{\"locale\":\"en\"}', '2025-12-06 15:14:55', '2025-12-06 15:14:55');

SET FOREIGN_KEY_CHECKS = 1;
