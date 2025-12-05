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

 Date: 06/12/2025 01:28:24
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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attribute_values
-- ----------------------------
INSERT INTO `attribute_values` VALUES (13, 6, 'Adreno 830', NULL, 0, '2025-11-28 04:35:31', '2025-11-28 04:35:31');
INSERT INTO `attribute_values` VALUES (14, 6, 'Adreno 735', NULL, 0, '2025-11-28 04:37:15', '2025-11-28 04:37:15');
INSERT INTO `attribute_values` VALUES (15, 7, 'QHD+', NULL, 0, '2025-11-28 04:38:05', '2025-11-28 04:38:05');
INSERT INTO `attribute_values` VALUES (16, 7, 'FHD+', NULL, 0, '2025-11-28 04:38:17', '2025-11-28 04:38:17');
INSERT INTO `attribute_values` VALUES (17, 8, '6.90', NULL, 0, '2025-11-28 04:39:18', '2025-11-28 04:39:18');
INSERT INTO `attribute_values` VALUES (18, 8, '3.4', NULL, 0, '2025-11-28 04:40:08', '2025-11-28 04:40:08');
INSERT INTO `attribute_values` VALUES (19, 9, '120', NULL, 0, '2025-11-28 04:40:24', '2025-11-28 04:40:24');
INSERT INTO `attribute_values` VALUES (20, 9, '60', NULL, 0, '2025-11-28 04:40:37', '2025-11-28 04:40:37');
INSERT INTO `attribute_values` VALUES (21, 10, 'Dynamic AMOLED 2X', NULL, 0, '2025-11-28 04:41:00', '2025-11-28 04:41:00');
INSERT INTO `attribute_values` VALUES (22, 10, 'AMOLED', NULL, 0, '2025-11-28 04:41:19', '2025-11-28 04:41:19');
INSERT INTO `attribute_values` VALUES (23, 11, '256', NULL, 0, '2025-11-28 04:41:40', '2025-11-28 04:41:40');
INSERT INTO `attribute_values` VALUES (24, 11, '512', NULL, 0, '2025-11-28 04:42:01', '2025-11-28 04:42:01');
INSERT INTO `attribute_values` VALUES (25, 12, '12', NULL, 0, '2025-11-28 04:42:20', '2025-11-28 04:42:20');
INSERT INTO `attribute_values` VALUES (26, 12, '8', NULL, 0, '2025-11-28 04:42:45', '2025-11-28 04:42:45');
INSERT INTO `attribute_values` VALUES (27, 13, '5000', NULL, 0, '2025-11-28 04:42:59', '2025-11-28 04:42:59');
INSERT INTO `attribute_values` VALUES (28, 13, '2000', NULL, 0, '2025-11-28 04:43:09', '2025-11-28 04:43:09');
INSERT INTO `attribute_values` VALUES (29, 14, '1', NULL, 0, '2025-12-02 22:05:10', '2025-12-02 22:05:10');
INSERT INTO `attribute_values` VALUES (30, 14, '2', NULL, 0, '2025-12-02 22:05:21', '2025-12-02 22:05:21');
INSERT INTO `attribute_values` VALUES (31, 14, '3', NULL, 0, '2025-12-02 22:05:32', '2025-12-02 22:05:32');

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attributes
-- ----------------------------
INSERT INTO `attributes` VALUES (6, 'გრაფიკული პროცესორი', 'grafikuli-protsesori', 'select', NULL, NULL, '2025-11-28 04:32:00', '2025-11-28 04:32:00');
INSERT INTO `attributes` VALUES (7, 'რეზოლუცია', 'rezolutsia', 'select', NULL, NULL, '2025-11-28 04:32:38', '2025-11-28 04:38:32');
INSERT INTO `attributes` VALUES (8, 'ეკრანის ზომა', 'ekranis-zoma', 'select', 'inches', NULL, '2025-11-28 04:33:10', '2025-11-28 04:33:10');
INSERT INTO `attributes` VALUES (9, 'განახლების სიხშირე', 'ganakhlebis-sikhshire', 'select', 'Hz', NULL, '2025-11-28 04:33:36', '2025-11-28 04:33:36');
INSERT INTO `attributes` VALUES (10, 'ეკრანის ტიპი', 'ekranis-tipi', 'select', NULL, NULL, '2025-11-28 04:33:54', '2025-11-28 04:33:54');
INSERT INTO `attributes` VALUES (11, 'შიდა მეხსიერება', 'shida-mekhsiereba', 'select', 'GB', NULL, '2025-11-28 04:34:15', '2025-11-28 04:34:15');
INSERT INTO `attributes` VALUES (12, 'ოპერატიული მეხსიერება', 'operatiuli-mekhsiereba', 'select', 'GB', NULL, '2025-11-28 04:34:30', '2025-11-28 04:34:30');
INSERT INTO `attributes` VALUES (13, 'ელემენტი', 'elementi', 'select', 'mAh', NULL, '2025-11-28 04:34:46', '2025-11-28 04:34:46');
INSERT INTO `attributes` VALUES (14, 'კამერების რაოდენობა', 'kamerebis-raodenoba', 'select', NULL, NULL, '2025-12-02 22:04:48', '2025-12-02 22:04:48');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner_group_banners
-- ----------------------------
INSERT INTO `banner_group_banners` VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `banner_group_banners` VALUES (2, 1, 2, NULL, NULL);
INSERT INTO `banner_group_banners` VALUES (3, 2, 3, NULL, NULL);
INSERT INTO `banner_group_banners` VALUES (4, 1, 4, NULL, NULL);
INSERT INTO `banner_group_banners` VALUES (5, 1, 3, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner_groups
-- ----------------------------
INSERT INTO `banner_groups` VALUES (1, 'სმარტფონები', 'smartfonebi', '#ff0000', '2025-11-29 15:23:36', '2025-12-02 22:15:10');
INSERT INTO `banner_groups` VALUES (2, 'ლეპტოპები', 'leptopebi', '#1eff00', '2025-11-30 00:32:01', '2025-11-30 00:32:10');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (1, 'banner 1', 'https://google.com', 'banners\\November2025\\oDzDAfxNslmQEf6FhxNA.jpeg', '2025-11-29 15:15:57', '2025-11-29 15:15:57');
INSERT INTO `banners` VALUES (2, 'banner 2', 'http://yahoo.com', 'banners\\November2025\\HGnmNeBlwcjcsIajAgQq.jpeg', '2025-11-29 15:16:12', '2025-11-30 00:28:31');
INSERT INTO `banners` VALUES (3, 'banner 3', NULL, 'banners\\November2025\\wobYwp00uUjLcSVbi5eh.webp', '2025-11-30 00:31:44', '2025-11-30 00:31:44');
INSERT INTO `banners` VALUES (4, 'ბანნერ 4', NULL, 'banners\\December2025\\8KjKbgwD4vomwT7A62lt.jpeg', '2025-12-02 22:13:53', '2025-12-02 22:13:53');

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
INSERT INTO `cache` VALUES ('mobilecorner-cache-67fee4e3ce2688c5c67cc2f4f783aa918ff5a08d', 'i:2;', 1764945489);
INSERT INTO `cache` VALUES ('mobilecorner-cache-67fee4e3ce2688c5c67cc2f4f783aa918ff5a08d:timer', 'i:1764945489;', 1764945489);
INSERT INTO `cache` VALUES ('mobilecorner-cache-95cf92a158d5cbff5265696b5b11ff3cb9a3c790', 'i:1;', 1764965757);
INSERT INTO `cache` VALUES ('mobilecorner-cache-95cf92a158d5cbff5265696b5b11ff3cb9a3c790:timer', 'i:1764965757;', 1764965757);
INSERT INTO `cache` VALUES ('mobilecorner-cache-voyager_menu_admin', 'O:23:\"TCG\\Voyager\\Models\\Menu\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"menus\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:1;s:4:\"name\";s:5:\"admin\";s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-02 23:32:51\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:1;s:4:\"name\";s:5:\"admin\";s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-02 23:32:51\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:12:\"parent_items\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:14:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:1;s:7:\"menu_id\";i:1;s:5:\"title\";s:9:\"Dashboard\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-boat\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-28 06:13:26\";s:5:\"route\";s:17:\"voyager.dashboard\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:1;s:7:\"menu_id\";i:1;s:5:\"title\";s:9:\"Dashboard\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-boat\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-28 06:13:26\";s:5:\"route\";s:17:\"voyager.dashboard\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:2;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Media\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-images\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:12;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:06\";s:5:\"route\";s:19:\"voyager.media.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:2;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Media\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-images\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:12;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:06\";s:5:\"route\";s:19:\"voyager.media.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:2;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:3;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Users\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-person\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:11;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:06\";s:5:\"route\";s:19:\"voyager.users.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:3;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Users\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-person\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:11;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:06\";s:5:\"route\";s:19:\"voyager.users.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:3;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:4;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Roles\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-lock\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:10;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:06\";s:5:\"route\";s:19:\"voyager.roles.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:4;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Roles\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-lock\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:10;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:06\";s:5:\"route\";s:19:\"voyager.roles.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:4;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:5;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Tools\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-tools\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:13;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:06\";s:5:\"route\";N;s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:5;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Tools\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-tools\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:13;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:06\";s:5:\"route\";N;s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:4:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:6;s:7:\"menu_id\";i:1;s:5:\"title\";s:12:\"Menu Builder\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-list\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.menus.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:6;s:7:\"menu_id\";i:1;s:5:\"title\";s:12:\"Menu Builder\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-list\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.menus.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:7;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Database\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-data\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:22:\"voyager.database.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:7;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Database\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-data\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:22:\"voyager.database.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:2;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:8;s:7:\"menu_id\";i:1;s:5:\"title\";s:7:\"Compass\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:15:\"voyager-compass\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:21:\"voyager.compass.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:8;s:7:\"menu_id\";i:1;s:5:\"title\";s:7:\"Compass\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:15:\"voyager-compass\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:21:\"voyager.compass.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:3;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:9;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"BREAD\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-bread\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.bread.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:9;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"BREAD\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-bread\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.bread.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:5;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:10;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Settings\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:16:\"voyager-settings\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:14;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:06\";s:5:\"route\";s:22:\"voyager.settings.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:10;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Settings\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:16:\"voyager-settings\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:14;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:06\";s:5:\"route\";s:22:\"voyager.settings.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:6;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:11;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Categories\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-25 14:40:28\";s:10:\"updated_at\";s:19:\"2025-11-29 15:00:53\";s:5:\"route\";s:24:\"voyager.categories.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:11;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Categories\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-25 14:40:28\";s:10:\"updated_at\";s:19:\"2025-11-29 15:00:53\";s:5:\"route\";s:24:\"voyager.categories.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:7;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:12;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Products\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-shop\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:6;s:10:\"created_at\";s:19:\"2025-11-27 21:34:24\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:22:\"voyager.products.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:12;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Products\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-shop\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:6;s:10:\"created_at\";s:19:\"2025-11-27 21:34:24\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:22:\"voyager.products.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:8;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:13;s:7:\"menu_id\";i:1;s:5:\"title\";s:6:\"Colors\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:5;s:10:\"created_at\";s:19:\"2025-11-27 22:10:32\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:20:\"voyager.colors.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:13;s:7:\"menu_id\";i:1;s:5:\"title\";s:6:\"Colors\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:5;s:10:\"created_at\";s:19:\"2025-11-27 22:10:32\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:20:\"voyager.colors.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:9;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:16;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-27 23:44:26\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:08\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:16;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-27 23:44:26\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:08\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:2:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:14;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-27 22:50:17\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:42\";s:5:\"route\";s:24:\"voyager.attributes.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:14;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-27 22:50:17\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:42\";s:5:\"route\";s:24:\"voyager.attributes.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:15;s:7:\"menu_id\";i:1;s:5:\"title\";s:16:\"Attribute Values\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-27 23:44:01\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:47\";s:5:\"route\";s:30:\"voyager.attribute-values.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:15;s:7:\"menu_id\";i:1;s:5:\"title\";s:16:\"Attribute Values\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-27 23:44:01\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:47\";s:5:\"route\";s:30:\"voyager.attribute-values.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:10;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:17;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Pages\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:7;s:10:\"created_at\";s:19:\"2025-11-28 16:47:10\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:19:\"voyager.pages.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:17;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Pages\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:7;s:10:\"created_at\";s:19:\"2025-11-28 16:47:10\";s:10:\"updated_at\";s:19:\"2025-11-29 15:13:37\";s:5:\"route\";s:19:\"voyager.pages.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:11;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:21;s:7:\"menu_id\";i:1;s:5:\"title\";s:14:\"Banner Section\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-29 15:13:28\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:00\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:21;s:7:\"menu_id\";i:1;s:5:\"title\";s:14:\"Banner Section\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-29 15:13:28\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:00\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:2:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:20;s:7:\"menu_id\";i:1;s:5:\"title\";s:13:\"Banner Groups\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:21;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-29 15:12:09\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:17\";s:5:\"route\";s:27:\"voyager.banner-groups.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:20;s:7:\"menu_id\";i:1;s:5:\"title\";s:13:\"Banner Groups\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:21;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-29 15:12:09\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:17\";s:5:\"route\";s:27:\"voyager.banner-groups.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:22;s:7:\"menu_id\";i:1;s:5:\"title\";s:7:\"Banners\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:21;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-29 15:14:09\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:22\";s:5:\"route\";s:21:\"voyager.banners.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:22;s:7:\"menu_id\";i:1;s:5:\"title\";s:7:\"Banners\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:21;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-29 15:14:09\";s:10:\"updated_at\";s:19:\"2025-11-29 15:25:22\";s:5:\"route\";s:21:\"voyager.banners.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:12;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:23;s:7:\"menu_id\";i:1;s:5:\"title\";s:9:\"Carousels\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:8;s:10:\"created_at\";s:19:\"2025-11-29 22:49:28\";s:10:\"updated_at\";s:19:\"2025-11-29 22:51:27\";s:5:\"route\";s:23:\"voyager.carousels.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:23;s:7:\"menu_id\";i:1;s:5:\"title\";s:9:\"Carousels\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:8;s:10:\"created_at\";s:19:\"2025-11-29 22:49:28\";s:10:\"updated_at\";s:19:\"2025-11-29 22:51:27\";s:5:\"route\";s:23:\"voyager.carousels.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:13;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:24;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Contacts\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-mail\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:9;s:10:\"created_at\";s:19:\"2025-12-06 01:20:54\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:09\";s:5:\"route\";s:22:\"voyager.contacts.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:24;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Contacts\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-mail\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:9;s:10:\"created_at\";s:19:\"2025-12-06 01:20:54\";s:10:\"updated_at\";s:19:\"2025-12-06 01:21:09\";s:5:\"route\";s:22:\"voyager.contacts.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}', 1767561670);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carousels
-- ----------------------------
INSERT INTO `carousels` VALUES (3, 'carousel 1', 'carousels\\November2025\\4AJw6McRKRlpcpwwMtAr.jpg', 'https://google.com', '2025-11-29 23:13:15', '2025-11-29 23:13:15');
INSERT INTO `carousels` VALUES (4, 'carousel 2', 'carousels/December2025/8mKDSPxaZ8n7HHAPMKR6.webp', NULL, '2025-11-29 23:13:31', '2025-12-03 00:41:06');

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (4, NULL, 1, 'სმარტფონები', 'categories\\November2025\\KFt17GmxeUb0S4iU4O3w.jpeg', 'device-mobile', 'smartfonebi', '<p>აქ რამე</p>', 0, NULL, '2025-11-29 16:29:45');
INSERT INTO `categories` VALUES (5, NULL, 2, 'ლეპტოპები', 'categories\\\\November2025\\\\zobwRwhjtwP6JIDAHZRD.jpeg', 'laptop', 'leptopebi', '<p>ლეპტოპების&nbsp; აღწერა</p>', 0, NULL, '2025-11-30 00:32:25');
INSERT INTO `categories` VALUES (6, 4, NULL, 'სამსუნგი', 'categories\\\\November2025\\\\NyYXEYEZSVxANGnYpfw1.jpeg', NULL, 'samsungi', '<p>სამსუნგების აღწერა</p>', 0, NULL, NULL);
INSERT INTO `categories` VALUES (7, 4, NULL, 'Iphone', 'categories\\\\November2025\\\\8bUVHruWNDNin9UE4u0k.jpeg', NULL, 'iphone', '<p>აიფონის აღწერა</p>', 0, NULL, NULL);
INSERT INTO `categories` VALUES (8, 5, NULL, 'Asus', 'categories\\\\November2025\\\\YduIJ7GP5hRwfk87uKme.jpeg', NULL, 'asus', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (9, 5, NULL, 'Acer', 'categories\\\\November2025\\\\Kxf3pLMKoJXnzQaO9IoO.jpeg', NULL, 'acer', '<p>acer desc</p>', 0, NULL, NULL);
INSERT INTO `categories` VALUES (10, 6, NULL, 'სამსუნგის ტელეფონი 1', NULL, NULL, 'samsungis-telefoni-1', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (11, 4, NULL, 'ძველი ტელეფონები', 'categories\\November2025\\6ZiDJf3DhS3747CIb4lQ.webp', NULL, 'dzveli-telefonebi', NULL, 0, NULL, '2025-11-29 16:53:39');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES (1, 'მწვანე', '#36fa00', NULL, NULL);
INSERT INTO `colors` VALUES (2, 'ვერცხლისფერი', '#b8b8b8', NULL, NULL);
INSERT INTO `colors` VALUES (3, 'შავი', '#000000', NULL, NULL);
INSERT INTO `colors` VALUES (4, 'ყვითელი', '#fffb80', NULL, NULL);
INSERT INTO `colors` VALUES (5, 'ფორთოხლისფერი', '#dbff29', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `data_rows` VALUES (40, 5, 'stock', 'select_dropdown', 'Stock', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"3\"},\"default\":\"1\",\"options\":{\"1\":\"IN STOCK\",\"2\":\"OUT OF STOCK\"}}', 16);
INSERT INTO `data_rows` VALUES (41, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"3\"},\"default\":\"active\",\"options\":{\"active\":\"Active\",\"draft\":\"Draft\"}}', 17);
INSERT INTO `data_rows` VALUES (42, 5, 'deleted_at', 'text', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 20);
INSERT INTO `data_rows` VALUES (43, 5, 'created_at', 'text', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 21);
INSERT INTO `data_rows` VALUES (44, 5, 'updated_at', 'text', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 22);
INSERT INTO `data_rows` VALUES (46, 5, 'product_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attributes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4);
INSERT INTO `data_rows` VALUES (47, 5, 'color_id', 'text', 'Color Id', 0, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (48, 5, 'a_old_price', 'text', 'A) Price', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 9);
INSERT INTO `data_rows` VALUES (49, 5, 'b_old_price', 'text', 'B) Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 11);
INSERT INTO `data_rows` VALUES (50, 5, 'c_old_price', 'text', 'C) Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 13);
INSERT INTO `data_rows` VALUES (51, 5, 'a_new_price', 'text', 'A)  New Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 10);
INSERT INTO `data_rows` VALUES (52, 5, 'b_new_price', 'text', 'B)  New Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 12);
INSERT INTO `data_rows` VALUES (53, 5, 'c_new_price', 'text', 'C)  New Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 14);
INSERT INTO `data_rows` VALUES (54, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (55, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (56, 6, 'color', 'color', 'Color', 0, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (57, 6, 'created_at', 'text', 'Created At', 0, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (58, 6, 'updated_at', 'text', 'Updated At', 0, 1, 1, 1, 1, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (59, 5, 'product_belongsto_color_relationship', 'relationship', 'colors', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"3\"},\"model\":\"App\\\\Models\\\\Color\",\"table\":\"colors\",\"type\":\"belongsTo\",\"column\":\"color_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attributes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15);
INSERT INTO `data_rows` VALUES (60, 5, 'images', 'multiple_images', 'Images', 0, 0, 0, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"100%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 19);
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
INSERT INTO `data_rows` VALUES (78, 5, 'condition', 'select_dropdown', 'Condition', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"3\"},\"default\":\"new\",\"options\":{\"new\":\"New\",\"owned\":\"Owned\"}}', 18);
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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO `data_types` VALUES (1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2025-11-02 23:32:50', '2025-11-02 23:32:50');
INSERT INTO `data_types` VALUES (2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2025-11-02 23:32:50', '2025-11-02 23:32:50');
INSERT INTO `data_types` VALUES (3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2025-11-02 23:32:50', '2025-11-02 23:32:50');
INSERT INTO `data_types` VALUES (4, 'categories', 'categories', 'Category', 'Categories', NULL, 'App\\Models\\Category', NULL, 'App\\Http\\Controllers\\Nboard\\CategoryController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2025-11-25 14:40:27', '2025-11-29 16:23:02');
INSERT INTO `data_types` VALUES (5, 'products', 'products', 'Product', 'Products', NULL, 'App\\Models\\Product', NULL, 'App\\Http\\Controllers\\Nboard\\ProductController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-27 21:34:24', '2025-12-02 22:24:33');
INSERT INTO `data_types` VALUES (6, 'colors', 'colors', 'Color', 'Colors', NULL, 'App\\Models\\Color', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2025-11-27 22:10:32', '2025-11-27 22:10:32');
INSERT INTO `data_types` VALUES (7, 'attributes', 'attributes', 'Attribute', 'Attributes', NULL, 'App\\Models\\Attribute', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-27 22:50:17', '2025-11-28 04:27:57');
INSERT INTO `data_types` VALUES (9, 'attribute_values', 'attribute-values', 'Attribute Value', 'Attribute Values', NULL, 'App\\Models\\AttributeValue', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-27 23:44:01', '2025-11-27 23:51:30');
INSERT INTO `data_types` VALUES (10, 'pages', 'pages', 'Static Pages', 'Pages', NULL, 'App\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-28 16:47:10', '2025-11-28 16:49:50');
INSERT INTO `data_types` VALUES (11, 'category_banners', 'category-banners', 'Category Banner', 'Category Banners', NULL, 'App\\Models\\CategoryBanner', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-28 17:57:22', '2025-11-28 18:13:37');
INSERT INTO `data_types` VALUES (12, 'banner_groups', 'banner-groups', 'Banner Groups', 'Banner Groups', NULL, 'App\\Models\\BannerGroup', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-29 15:12:09', '2025-11-29 15:23:01');
INSERT INTO `data_types` VALUES (13, 'banners', 'banners', 'Banner', 'Banners', NULL, 'App\\Models\\Banner', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-29 15:14:09', '2025-11-29 15:25:56');
INSERT INTO `data_types` VALUES (14, 'carousels', 'carousels', 'Carousel', 'Carousels', NULL, 'App\\Models\\Carousel', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-29 22:49:27', '2025-11-29 22:54:44');
INSERT INTO `data_types` VALUES (15, 'contacts', 'contacts', 'Contact', 'Contacts', NULL, 'App\\Models\\Contact', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2025-12-06 01:20:54', '2025-12-06 01:20:54');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of installment_order_items
-- ----------------------------
INSERT INTO `installment_order_items` VALUES (11, 6, 13, 1, 150.00, 150.00, '2025-12-05 09:23:26', '2025-12-05 09:23:26');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of installments
-- ----------------------------
INSERT INTO `installments` VALUES (6, 'Clayton Cooke', 'Joel Wells', '+1 (879) 968-4645', '1', 'Aliquam reiciendis q', NULL, NULL, 'bog', '212.58.103.194', 'pending', 150.00, NULL, NULL, '2025-12-05 09:23:26', '2025-12-05 09:23:28');

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES (1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2025-11-02 23:32:51', '2025-11-28 06:13:26', 'voyager.dashboard', NULL);
INSERT INTO `menu_items` VALUES (2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 12, '2025-11-02 23:32:51', '2025-12-06 01:21:06', 'voyager.media.index', NULL);
INSERT INTO `menu_items` VALUES (3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 11, '2025-11-02 23:32:51', '2025-12-06 01:21:06', 'voyager.users.index', NULL);
INSERT INTO `menu_items` VALUES (4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 10, '2025-11-02 23:32:51', '2025-12-06 01:21:06', 'voyager.roles.index', NULL);
INSERT INTO `menu_items` VALUES (5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 13, '2025-11-02 23:32:51', '2025-12-06 01:21:06', NULL, NULL);
INSERT INTO `menu_items` VALUES (6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.menus.index', NULL);
INSERT INTO `menu_items` VALUES (7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.database.index', NULL);
INSERT INTO `menu_items` VALUES (8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.compass.index', NULL);
INSERT INTO `menu_items` VALUES (9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.bread.index', NULL);
INSERT INTO `menu_items` VALUES (10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2025-11-02 23:32:51', '2025-12-06 01:21:06', 'voyager.settings.index', NULL);
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
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES (1, 'header-page', 'header page', 'Lorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.', 'header', NULL, '2025-11-29 22:41:58');
INSERT INTO `pages` VALUES (2, 'footer-page', 'footer page', 'Lorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.\r\nLorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.\r\nLorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.\r\nLorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.', 'footer', NULL, '2025-11-29 22:41:43');
INSERT INTO `pages` VALUES (3, 'page-in-footer-and-header', 'page in footer and header', 'Lorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.Lorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.Lorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.Lorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.Lorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.Lorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.Lorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.', 'everywhere', NULL, NULL);

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
INSERT INTO `permission_role` VALUES (17, 1);
INSERT INTO `permission_role` VALUES (18, 1);
INSERT INTO `permission_role` VALUES (19, 1);
INSERT INTO `permission_role` VALUES (20, 1);
INSERT INTO `permission_role` VALUES (21, 1);
INSERT INTO `permission_role` VALUES (22, 1);
INSERT INTO `permission_role` VALUES (23, 1);
INSERT INTO `permission_role` VALUES (24, 1);
INSERT INTO `permission_role` VALUES (25, 1);
INSERT INTO `permission_role` VALUES (26, 1);
INSERT INTO `permission_role` VALUES (27, 1);
INSERT INTO `permission_role` VALUES (28, 1);
INSERT INTO `permission_role` VALUES (29, 1);
INSERT INTO `permission_role` VALUES (30, 1);
INSERT INTO `permission_role` VALUES (31, 1);
INSERT INTO `permission_role` VALUES (32, 1);
INSERT INTO `permission_role` VALUES (33, 1);
INSERT INTO `permission_role` VALUES (34, 1);
INSERT INTO `permission_role` VALUES (35, 1);
INSERT INTO `permission_role` VALUES (36, 1);
INSERT INTO `permission_role` VALUES (37, 1);
INSERT INTO `permission_role` VALUES (38, 1);
INSERT INTO `permission_role` VALUES (39, 1);
INSERT INTO `permission_role` VALUES (40, 1);
INSERT INTO `permission_role` VALUES (41, 1);
INSERT INTO `permission_role` VALUES (42, 1);
INSERT INTO `permission_role` VALUES (43, 1);
INSERT INTO `permission_role` VALUES (44, 1);
INSERT INTO `permission_role` VALUES (45, 1);
INSERT INTO `permission_role` VALUES (46, 1);
INSERT INTO `permission_role` VALUES (47, 1);
INSERT INTO `permission_role` VALUES (48, 1);
INSERT INTO `permission_role` VALUES (49, 1);
INSERT INTO `permission_role` VALUES (50, 1);
INSERT INTO `permission_role` VALUES (51, 1);
INSERT INTO `permission_role` VALUES (52, 1);
INSERT INTO `permission_role` VALUES (53, 1);
INSERT INTO `permission_role` VALUES (54, 1);
INSERT INTO `permission_role` VALUES (55, 1);
INSERT INTO `permission_role` VALUES (56, 1);
INSERT INTO `permission_role` VALUES (57, 1);
INSERT INTO `permission_role` VALUES (58, 1);
INSERT INTO `permission_role` VALUES (59, 1);
INSERT INTO `permission_role` VALUES (60, 1);
INSERT INTO `permission_role` VALUES (61, 1);
INSERT INTO `permission_role` VALUES (62, 1);
INSERT INTO `permission_role` VALUES (63, 1);
INSERT INTO `permission_role` VALUES (64, 1);
INSERT INTO `permission_role` VALUES (65, 1);
INSERT INTO `permission_role` VALUES (66, 1);
INSERT INTO `permission_role` VALUES (67, 1);
INSERT INTO `permission_role` VALUES (68, 1);
INSERT INTO `permission_role` VALUES (69, 1);
INSERT INTO `permission_role` VALUES (70, 1);
INSERT INTO `permission_role` VALUES (71, 1);
INSERT INTO `permission_role` VALUES (72, 1);
INSERT INTO `permission_role` VALUES (73, 1);
INSERT INTO `permission_role` VALUES (74, 1);
INSERT INTO `permission_role` VALUES (75, 1);
INSERT INTO `permission_role` VALUES (76, 1);
INSERT INTO `permission_role` VALUES (77, 1);
INSERT INTO `permission_role` VALUES (78, 1);
INSERT INTO `permission_role` VALUES (79, 1);
INSERT INTO `permission_role` VALUES (80, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_attribute_values
-- ----------------------------
INSERT INTO `product_attribute_values` VALUES (34, 9, 6, NULL, NULL, 14, NULL, NULL, '2025-11-28 05:47:44', '2025-11-28 06:04:29');
INSERT INTO `product_attribute_values` VALUES (42, 9, 7, NULL, NULL, 15, NULL, NULL, '2025-11-28 06:03:32', '2025-11-28 06:03:58');
INSERT INTO `product_attribute_values` VALUES (43, 9, 8, NULL, NULL, 18, NULL, NULL, '2025-11-28 06:04:55', '2025-11-28 06:04:55');
INSERT INTO `product_attribute_values` VALUES (44, 10, 6, NULL, NULL, 13, NULL, NULL, '2025-11-28 06:08:54', '2025-11-28 06:09:25');
INSERT INTO `product_attribute_values` VALUES (45, 10, 7, NULL, NULL, 15, NULL, NULL, '2025-11-28 06:08:54', '2025-11-28 06:08:54');
INSERT INTO `product_attribute_values` VALUES (46, 10, 8, NULL, NULL, 17, NULL, NULL, '2025-11-28 06:08:54', '2025-11-28 06:08:54');
INSERT INTO `product_attribute_values` VALUES (47, 10, 9, NULL, NULL, 19, NULL, NULL, '2025-11-28 06:08:54', '2025-11-28 06:08:54');
INSERT INTO `product_attribute_values` VALUES (48, 10, 10, NULL, NULL, 21, NULL, NULL, '2025-11-28 06:08:54', '2025-11-28 06:08:54');
INSERT INTO `product_attribute_values` VALUES (49, 10, 11, NULL, NULL, 24, NULL, NULL, '2025-11-28 06:08:54', '2025-11-28 06:08:54');
INSERT INTO `product_attribute_values` VALUES (50, 10, 12, NULL, NULL, 25, NULL, NULL, '2025-11-28 06:08:54', '2025-11-28 06:08:54');
INSERT INTO `product_attribute_values` VALUES (51, 10, 13, NULL, NULL, 27, NULL, NULL, '2025-11-28 06:08:54', '2025-11-28 06:08:54');
INSERT INTO `product_attribute_values` VALUES (52, 11, 6, NULL, NULL, 13, NULL, NULL, '2025-11-28 06:11:10', '2025-11-28 06:11:10');
INSERT INTO `product_attribute_values` VALUES (53, 11, 7, NULL, NULL, 16, NULL, NULL, '2025-11-28 06:11:10', '2025-11-28 06:11:10');
INSERT INTO `product_attribute_values` VALUES (54, 11, 8, NULL, NULL, 17, NULL, NULL, '2025-11-28 06:11:10', '2025-11-28 06:11:10');
INSERT INTO `product_attribute_values` VALUES (56, 11, 9, NULL, NULL, 20, NULL, NULL, '2025-11-28 09:17:24', '2025-11-28 09:17:24');
INSERT INTO `product_attribute_values` VALUES (57, 11, 10, NULL, NULL, 21, NULL, NULL, '2025-11-28 09:53:01', '2025-11-28 09:53:01');
INSERT INTO `product_attribute_values` VALUES (59, 12, 7, NULL, NULL, 16, NULL, NULL, '2025-11-30 00:13:20', '2025-11-30 00:13:20');
INSERT INTO `product_attribute_values` VALUES (60, 12, 6, NULL, NULL, 14, NULL, NULL, '2025-11-30 14:20:28', '2025-11-30 14:20:28');
INSERT INTO `product_attribute_values` VALUES (61, 13, 6, NULL, NULL, 13, NULL, NULL, '2025-12-01 18:33:46', '2025-12-01 18:33:46');
INSERT INTO `product_attribute_values` VALUES (62, 13, 7, NULL, NULL, 15, NULL, NULL, '2025-12-01 18:33:46', '2025-12-01 18:33:46');
INSERT INTO `product_attribute_values` VALUES (63, 13, 8, NULL, NULL, 18, NULL, NULL, '2025-12-01 18:33:46', '2025-12-01 18:33:46');
INSERT INTO `product_attribute_values` VALUES (64, 14, 6, NULL, NULL, 13, NULL, NULL, '2025-12-02 15:12:35', '2025-12-02 15:12:35');
INSERT INTO `product_attribute_values` VALUES (65, 14, 7, NULL, NULL, 16, NULL, NULL, '2025-12-02 15:12:35', '2025-12-02 15:12:35');
INSERT INTO `product_attribute_values` VALUES (66, 14, 8, NULL, NULL, 17, NULL, NULL, '2025-12-02 15:12:35', '2025-12-02 15:12:35');
INSERT INTO `product_attribute_values` VALUES (67, 14, 9, NULL, NULL, 19, NULL, NULL, '2025-12-02 15:12:35', '2025-12-02 15:12:35');
INSERT INTO `product_attribute_values` VALUES (68, 14, 10, NULL, NULL, 21, NULL, NULL, '2025-12-02 15:12:35', '2025-12-02 15:12:35');
INSERT INTO `product_attribute_values` VALUES (69, 14, 11, NULL, NULL, 23, NULL, NULL, '2025-12-02 15:12:35', '2025-12-02 15:12:35');
INSERT INTO `product_attribute_values` VALUES (70, 14, 12, NULL, NULL, 25, NULL, NULL, '2025-12-02 15:12:35', '2025-12-02 15:12:35');
INSERT INTO `product_attribute_values` VALUES (71, 14, 13, NULL, NULL, 28, NULL, NULL, '2025-12-02 15:12:35', '2025-12-02 15:12:35');
INSERT INTO `product_attribute_values` VALUES (72, 15, 14, NULL, NULL, 31, NULL, NULL, '2025-12-02 22:08:55', '2025-12-02 22:08:55');
INSERT INTO `product_attribute_values` VALUES (73, 15, 6, NULL, NULL, 13, NULL, NULL, '2025-12-02 22:08:55', '2025-12-02 22:08:55');
INSERT INTO `product_attribute_values` VALUES (74, 15, 12, NULL, NULL, 25, NULL, NULL, '2025-12-02 22:08:55', '2025-12-02 22:08:55');

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (9, 6, 3, 'Samsung SM-X210 Galaxy Tab A9+ 4GB RAM 64GB Wi-Fi Navy', 'samsung-sm-x210-galaxy-tab-a9-4gb-ram-64gb-wi-fi-navy', '<p>საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი &mdash; Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.</p>', 419.00, 350.00, 250.00, NULL, 250.00, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\\\November2025\\\\5VLKOolY2xkFwm8EorMv.jpeg\",\"products\\\\November2025\\\\Lg79eDxwWUUjcXBA7GBg.jpeg\"]', NULL, '2025-11-28 05:47:44', '2025-12-02 14:38:46');
INSERT INTO `products` VALUES (10, 6, 2, 'Samsung Galaxy A17 A175F/DS LTE 4/128GB Light Blue', 'samsung-galaxy-a17-a175fds-lte-4128gb-light-blue', '<p>საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი &mdash; Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.</p>', 399.00, 200.00, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'new', '[\"products\\\\November2025\\\\RMtCJOX27Lmn929VgVCw.jpeg\",\"products\\\\November2025\\\\MKGEx2AX4iUwCDJND4ex.jpeg\",\"products\\\\November2025\\\\OSoz9kTNnw1xUbac4JHi.jpeg\"]', NULL, '2025-11-28 06:08:54', '2025-11-28 06:08:54');
INSERT INTO `products` VALUES (11, 7, 3, 'Apple iPhone 17 Pro Max e-SIM Only | 256GB Cosmic Orange', 'apple-iphone-17-pro-max-e-sim-only-256gb-cosmic-orange', '<p>საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი &mdash; Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.</p>', 4099.00, 3500.00, NULL, NULL, 10.00, NULL, 'LARI', 1, 'active', 'new', '[\"products\\\\November2025\\\\FIxzcL1GKKKPT3KEHdNu.jpeg\",\"products\\\\November2025\\\\uREpaPLhswVneOAjqMri.jpeg\",\"products\\\\November2025\\\\C78g6Ryb7fn318EWCaqW.jpeg\",\"products\\\\November2025\\\\70SQtMajxjigdrFQDHx9.jpeg\"]', NULL, '2025-11-28 06:11:10', '2025-12-02 01:17:58');
INSERT INTO `products` VALUES (12, 8, NULL, 'asus 1', 'asus-1', '<p>desc something for asus laptop</p>', 4200.00, 300.00, NULL, 3500.00, NULL, NULL, 'LARI', 1, 'active', 'new', '[\"products\\\\November2025\\\\MrecoK8TRBmDyAWzWUw1.jpeg\",\"products\\\\November2025\\\\3Cvjg1ZgiohiIGzqo4Rr.jpeg\",\"products\\\\November2025\\\\z0St1V5duEHjM9FzfZDy.jpeg\"]', NULL, '2025-11-30 00:13:19', '2025-12-02 14:29:04');
INSERT INTO `products` VALUES (13, 10, 2, 'Commodo consequatur', 'commodo-consequatur', '<p>sfsafsdf</p>', 500.00, 270.00, 350.00, 450.00, 150.00, 300.00, 'LARI', 1, 'active', 'new', '[\"products\\\\December2025\\\\lhaXS8UqEBPLCn8jAQxK.jpeg\",\"products\\\\December2025\\\\5i7S3BRV9Wf9hpoaSV5M.jpeg\",\"products\\\\December2025\\\\MUQIqZbJTXMdSsVfDTbj.jpeg\",\"products\\\\December2025\\\\p44Z15t2IAXFce5rhnLL.jpeg\",\"products\\\\December2025\\\\zYe9RQ75BmbmCpuW84qC.jpeg\",\"products\\\\December2025\\\\CF6iWZB22AkLmkozl1Lx.jpeg\",\"products\\\\December2025\\\\UdjEeINy1X2ZNuC09GxL.jpeg\",\"products\\\\December2025\\\\AyePpN0EJxMKpkAtfYQ7.jpeg\",\"products\\\\December2025\\\\GEJoK1iT7NxxWJqLExFj.jpeg\",\"products\\\\December2025\\\\3rlIubkSp67yj5F9aw7Q.jpeg\"]', NULL, '2025-12-01 18:33:46', '2025-12-02 14:55:56');
INSERT INTO `products` VALUES (14, 5, 2, 'Est id necessitatib', 'est-id-necessitatib', '<p>dwasdad</p>', 500.00, 350.00, 200.00, 450.00, 300.00, 150.00, 'LARI', 1, 'active', 'owned', '[\"products\\\\December2025\\\\PWhf6P9RaCHla0GMLsNx.jpeg\",\"products\\\\December2025\\\\sDD84UgtUhPV3zhh1PGA.jpeg\",\"products\\\\December2025\\\\bsbBiCRsfBr1KcEBu3GK.jpeg\"]', NULL, '2025-12-02 15:12:35', '2025-12-02 15:15:37');
INSERT INTO `products` VALUES (15, 4, 5, 'მიშო', 'misho', '<p>მიშოს დესქრიბშენი</p>', 200.00, 50.00, NULL, 150.00, NULL, NULL, 'LARI', 1, 'active', 'new', '[\"products\\\\December2025\\\\R6JcCA3KXa8hJWdV4udP.jpeg\",\"products\\\\December2025\\\\PLCA6s1sBCRdeFk5B0tp.jpeg\"]', NULL, '2025-12-02 22:08:55', '2025-12-02 22:10:04');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'Administrator', '2025-11-02 23:32:51', '2025-11-02 23:32:51');
INSERT INTO `roles` VALUES (2, 'user', 'Normal User', '2025-11-02 23:32:51', '2025-11-02 23:32:51');

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
INSERT INTO `sessions` VALUES ('CC3iwgWuJLXY897Wb89HiH7vyiYs7Ew32MEkg1MD', NULL, '212.58.103.194', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_8 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/125.0.6422.80 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFRLUjhZRXZTbjFtNExGTVI3bTJxTkJGeHFOamVWSjVHUWRXQXJnVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vbW9iaWxlY29ybmVyLmFsZXJ0bWUudG9wL3BhZ2VzL2NoZWNrb3V0IjtzOjU6InJvdXRlIjtzOjE0OiJwYWdlcy5jaGVja291dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764965734);
INSERT INTO `sessions` VALUES ('oCE4no9yaqtngEl0RCE5koe7xIJ8AZZftMWchjmf', NULL, '212.58.103.194', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTl5ZHp0bjh5TVo2NHBKbnJaUktiNThvNDBhWE1CR0FKOHdtcXRqVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODk6Imh0dHBzOi8vbW9iaWxlY29ybmVyLmFsZXJ0bWUudG9wL3Byb2R1Y3Qvc2Ftc3VuZy1nYWxheHktYTE3LWExNzVmZHMtbHRlLTQxMjhnYi1saWdodC1ibHVlIjtzOjU6InJvdXRlIjtzOjE1OiJwYWdlcy5mdWxsLXBhZ2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1764965660);
INSERT INTO `sessions` VALUES ('ozG2UShmWkTDWSEDYdB3ex4aDu8AiIC5rNRWGmAr', 2, '212.58.103.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUW1HbnU4VTd0VVdXUEx1N1FLVG1PcXNGOG1sVGlZQlJxdXlwWWZWSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vbW9iaWxlY29ybmVyLmFsZXJ0bWUudG9wL25ib2FyZC9jb250YWN0cyI7czo1OiJyb3V0ZSI7czoyMjoidm95YWdlci5jb250YWN0cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1764970080);

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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 1, 'Super Admin', 'nikakharadze82@gmail.com', 'users\\November2025\\jhVjRCjEACqHauNvq9EE.png', NULL, '$2y$12$TYoccilpFM8RqOzdCgNDGuzJisjLazBD2bcjGcdJO.TmrGUM7Ex5i', NULL, '{\"locale\":\"en\"}', '2025-11-02 23:38:58', '2025-11-28 09:55:09');

SET FOREIGN_KEY_CHECKS = 1;
