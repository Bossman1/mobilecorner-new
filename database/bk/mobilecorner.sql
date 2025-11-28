/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 127.0.0.1:3306
 Source Schema         : mobilecorner

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 28/11/2025 10:02:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE `attribute_values`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_values_slug_unique`(`slug`) USING BTREE,
  INDEX `attribute_values_attribute_id_foreign`(`attribute_id`) USING BTREE,
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache
-- ----------------------------
INSERT INTO `cache` VALUES ('mobilecornerge-cache-da4b9237bacccdf19c0760cab7aec4a8359010b0', 'i:1;', 1764309238);
INSERT INTO `cache` VALUES ('mobilecornerge-cache-da4b9237bacccdf19c0760cab7aec4a8359010b0:timer', 'i:1764309238;', 1764309238);
INSERT INTO `cache` VALUES ('mobilecornerge-cache-voyager_menu_admin', 'O:23:\"TCG\\Voyager\\Models\\Menu\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"menus\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:1;s:4:\"name\";s:5:\"admin\";s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-02 23:32:51\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:1;s:4:\"name\";s:5:\"admin\";s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-02 23:32:51\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:12:\"parent_items\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:10:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:1;s:7:\"menu_id\";i:1;s:5:\"title\";s:9:\"Dashboard\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-boat\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-28 06:13:26\";s:5:\"route\";s:17:\"voyager.dashboard\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:1;s:7:\"menu_id\";i:1;s:5:\"title\";s:9:\"Dashboard\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-boat\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-28 06:13:26\";s:5:\"route\";s:17:\"voyager.dashboard\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:2;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Media\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-images\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:8;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:54\";s:5:\"route\";s:19:\"voyager.media.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:2;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Media\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-images\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:8;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:54\";s:5:\"route\";s:19:\"voyager.media.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:2;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:3;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Users\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-person\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:7;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:54\";s:5:\"route\";s:19:\"voyager.users.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:3;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Users\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-person\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:7;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:54\";s:5:\"route\";s:19:\"voyager.users.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:3;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:4;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Roles\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-lock\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:6;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:54\";s:5:\"route\";s:19:\"voyager.roles.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:4;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Roles\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-lock\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:6;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:54\";s:5:\"route\";s:19:\"voyager.roles.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:4;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:5;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Tools\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-tools\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:9;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:54\";s:5:\"route\";N;s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:5;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"Tools\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-tools\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:9;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:54\";s:5:\"route\";N;s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:4:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:6;s:7:\"menu_id\";i:1;s:5:\"title\";s:12:\"Menu Builder\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-list\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.menus.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:6;s:7:\"menu_id\";i:1;s:5:\"title\";s:12:\"Menu Builder\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-list\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.menus.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:7;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Database\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-data\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:22:\"voyager.database.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:7;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Database\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-data\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:22:\"voyager.database.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:2;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:8;s:7:\"menu_id\";i:1;s:5:\"title\";s:7:\"Compass\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:15:\"voyager-compass\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:21:\"voyager.compass.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:8;s:7:\"menu_id\";i:1;s:5:\"title\";s:7:\"Compass\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:15:\"voyager-compass\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:21:\"voyager.compass.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:3;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:9;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"BREAD\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-bread\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.bread.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:9;s:7:\"menu_id\";i:1;s:5:\"title\";s:5:\"BREAD\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:13:\"voyager-bread\";s:5:\"color\";N;s:9:\"parent_id\";i:5;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:30\";s:5:\"route\";s:19:\"voyager.bread.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:5;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:10;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Settings\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:16:\"voyager-settings\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:10;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:54\";s:5:\"route\";s:22:\"voyager.settings.index\";s:10:\"parameters\";N;}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:10;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Settings\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:16:\"voyager-settings\";s:5:\"color\";N;s:9:\"parent_id\";N;s:5:\"order\";i:10;s:10:\"created_at\";s:19:\"2025-11-02 23:32:51\";s:10:\"updated_at\";s:19:\"2025-11-27 23:44:54\";s:5:\"route\";s:22:\"voyager.settings.index\";s:10:\"parameters\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:6;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:11;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Categories\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-25 14:40:28\";s:10:\"updated_at\";s:19:\"2025-11-28 09:24:37\";s:5:\"route\";s:24:\"voyager.categories.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:11;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Categories\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-25 14:40:28\";s:10:\"updated_at\";s:19:\"2025-11-28 09:24:37\";s:5:\"route\";s:24:\"voyager.categories.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:7;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:12;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Products\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-shop\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:5;s:10:\"created_at\";s:19:\"2025-11-27 21:34:24\";s:10:\"updated_at\";s:19:\"2025-11-28 09:24:04\";s:5:\"route\";s:22:\"voyager.products.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:12;s:7:\"menu_id\";i:1;s:5:\"title\";s:8:\"Products\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:12:\"voyager-shop\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:5;s:10:\"created_at\";s:19:\"2025-11-27 21:34:24\";s:10:\"updated_at\";s:19:\"2025-11-28 09:24:04\";s:5:\"route\";s:22:\"voyager.products.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:8;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:13;s:7:\"menu_id\";i:1;s:5:\"title\";s:6:\"Colors\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-27 22:10:32\";s:10:\"updated_at\";s:19:\"2025-11-28 09:23:03\";s:5:\"route\";s:20:\"voyager.colors.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:13;s:7:\"menu_id\";i:1;s:5:\"title\";s:6:\"Colors\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:17:\"voyager-file-text\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:4;s:10:\"created_at\";s:19:\"2025-11-27 22:10:32\";s:10:\"updated_at\";s:19:\"2025-11-28 09:23:03\";s:5:\"route\";s:20:\"voyager.colors.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:9;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:16;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-27 23:44:26\";s:10:\"updated_at\";s:19:\"2025-11-28 09:24:37\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:16;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:14:\"voyager-folder\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";N;s:5:\"order\";i:3;s:10:\"created_at\";s:19:\"2025-11-27 23:44:26\";s:10:\"updated_at\";s:19:\"2025-11-28 09:24:37\";s:5:\"route\";N;s:10:\"parameters\";s:0:\"\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:2:{i:0;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:14;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-27 22:50:17\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:42\";s:5:\"route\";s:24:\"voyager.attributes.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:14;s:7:\"menu_id\";i:1;s:5:\"title\";s:10:\"Attributes\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-11-27 22:50:17\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:42\";s:5:\"route\";s:24:\"voyager.attributes.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}i:1;O:27:\"TCG\\Voyager\\Models\\MenuItem\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"menu_items\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:13:{s:2:\"id\";i:15;s:7:\"menu_id\";i:1;s:5:\"title\";s:16:\"Attribute Values\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-27 23:44:01\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:47\";s:5:\"route\";s:30:\"voyager.attribute-values.index\";s:10:\"parameters\";s:4:\"null\";}s:11:\"\0*\0original\";a:13:{s:2:\"id\";i:15;s:7:\"menu_id\";i:1;s:5:\"title\";s:16:\"Attribute Values\";s:3:\"url\";s:0:\"\";s:6:\"target\";s:5:\"_self\";s:10:\"icon_class\";s:11:\"voyager-dot\";s:5:\"color\";s:7:\"#000000\";s:9:\"parent_id\";i:16;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-11-27 23:44:01\";s:10:\"updated_at\";s:19:\"2025-11-28 09:22:47\";s:5:\"route\";s:30:\"voyager.attribute-values.index\";s:10:\"parameters\";s:4:\"null\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:8:\"children\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:20:\"\0*\0translatorMethods\";a:1:{s:4:\"link\";s:14:\"translatorLink\";}s:15:\"\0*\0translatable\";a:1:{i:0;s:5:\"title\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}', 1766899484);

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug`) USING BTREE,
  INDEX `categories_parent_id_index`(`parent_id`) USING BTREE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (4, NULL, 'სმარტფონები', '[\"categories\\\\November2025\\\\eCbjCZh50dDl2V5EFGEU.jpeg\"]', 'smartfonebi', '<p>აქ რამე&nbsp;</p>', 0, NULL, NULL);
INSERT INTO `categories` VALUES (5, NULL, 'ლეპტოპები', '[\"categories\\\\November2025\\\\zobwRwhjtwP6JIDAHZRD.jpeg\"]', 'leptopebi', '<p>ლეპტოპების&nbsp; აღწერა</p>', 0, NULL, NULL);
INSERT INTO `categories` VALUES (6, 4, 'სამსუნგი', '[\"categories\\\\November2025\\\\NyYXEYEZSVxANGnYpfw1.jpeg\"]', 'samsungi', '<p>სამსუნგების აღწერა</p>', 0, NULL, NULL);
INSERT INTO `categories` VALUES (7, 4, 'Iphone', '[\"categories\\\\November2025\\\\8bUVHruWNDNin9UE4u0k.jpeg\"]', 'iphone', '<p>აიფონის აღწერა</p>', 0, NULL, NULL);
INSERT INTO `categories` VALUES (8, 5, 'Asus', '[\"categories\\\\November2025\\\\YduIJ7GP5hRwfk87uKme.jpeg\"]', 'asus', NULL, 0, NULL, NULL);
INSERT INTO `categories` VALUES (9, 5, 'Acer', '[\"categories\\\\November2025\\\\Kxf3pLMKoJXnzQaO9IoO.jpeg\"]', 'acer', '<p>acer desc</p>', 0, NULL, NULL);

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES (1, 'მწვანე', '#36fa00', NULL, NULL);
INSERT INTO `colors` VALUES (2, 'ვერცხლისფერი', '#b8b8b8', NULL, NULL);
INSERT INTO `colors` VALUES (3, 'შავი', '#000000', NULL, NULL);
INSERT INTO `colors` VALUES (4, 'ყვითელი', '#fffb80', NULL, NULL);

-- ----------------------------
-- Table structure for data_rows
-- ----------------------------
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
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
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data_rows_data_type_id_foreign`(`data_type_id`) USING BTREE,
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `data_rows` VALUES (28, 4, 'created_at', 'text', 'Created At', 0, 0, 0, 0, 1, 1, '{}', 9);
INSERT INTO `data_rows` VALUES (29, 4, 'updated_at', 'text', 'Updated At', 0, 0, 0, 0, 1, 1, '{}', 10);
INSERT INTO `data_rows` VALUES (30, 4, 'category_hasone_category_relationship', 'relationship', 'Parent category', 0, 1, 1, 1, 1, 1, '{\"default\":\"Default text\",\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attributes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3);
INSERT INTO `data_rows` VALUES (31, 4, 'images', 'multiple_images', 'Images', 0, 0, 1, 1, 1, 1, '{\"quality\":\"100%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 8);
INSERT INTO `data_rows` VALUES (32, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
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
INSERT INTO `data_rows` VALUES (48, 5, 'a_old_price', 'text', 'A) Price', 1, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 9);
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

-- ----------------------------
-- Table structure for data_types
-- ----------------------------
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `data_types_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `data_types_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO `data_types` VALUES (1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2025-11-02 23:32:50', '2025-11-02 23:32:50');
INSERT INTO `data_types` VALUES (2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2025-11-02 23:32:50', '2025-11-02 23:32:50');
INSERT INTO `data_types` VALUES (3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2025-11-02 23:32:50', '2025-11-02 23:32:50');
INSERT INTO `data_types` VALUES (4, 'categories', 'categories', 'Category', 'Categories', NULL, 'App\\Models\\Category', NULL, 'App\\Http\\Controllers\\Nboard\\CategoryController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2025-11-25 14:40:27', '2025-11-28 09:37:01');
INSERT INTO `data_types` VALUES (5, 'products', 'products', 'Product', 'Products', NULL, 'App\\Models\\Product', NULL, 'App\\Http\\Controllers\\Nboard\\ProductController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-27 21:34:24', '2025-11-28 09:51:52');
INSERT INTO `data_types` VALUES (6, 'colors', 'colors', 'Color', 'Colors', NULL, 'App\\Models\\Color', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2025-11-27 22:10:32', '2025-11-27 22:10:32');
INSERT INTO `data_types` VALUES (7, 'attributes', 'attributes', 'Attribute', 'Attributes', NULL, 'App\\Models\\Attribute', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-27 22:50:17', '2025-11-28 04:27:57');
INSERT INTO `data_types` VALUES (9, 'attribute_values', 'attribute-values', 'Attribute Value', 'Attribute Values', NULL, 'App\\Models\\AttributeValue', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-11-27 23:44:01', '2025-11-27 23:51:30');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `paths` json NOT NULL,
  `imageable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `images_imageable_type_imageable_id_index`(`imageable_type`, `imageable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images
-- ----------------------------

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int(11) NULL DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_items_menu_id_foreign`(`menu_id`) USING BTREE,
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES (1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2025-11-02 23:32:51', '2025-11-28 06:13:26', 'voyager.dashboard', NULL);
INSERT INTO `menu_items` VALUES (2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 8, '2025-11-02 23:32:51', '2025-11-27 23:44:54', 'voyager.media.index', NULL);
INSERT INTO `menu_items` VALUES (3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 7, '2025-11-02 23:32:51', '2025-11-27 23:44:54', 'voyager.users.index', NULL);
INSERT INTO `menu_items` VALUES (4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 6, '2025-11-02 23:32:51', '2025-11-27 23:44:54', 'voyager.roles.index', NULL);
INSERT INTO `menu_items` VALUES (5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2025-11-02 23:32:51', '2025-11-27 23:44:54', NULL, NULL);
INSERT INTO `menu_items` VALUES (6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.menus.index', NULL);
INSERT INTO `menu_items` VALUES (7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.database.index', NULL);
INSERT INTO `menu_items` VALUES (8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.compass.index', NULL);
INSERT INTO `menu_items` VALUES (9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2025-11-02 23:32:51', '2025-11-27 23:44:30', 'voyager.bread.index', NULL);
INSERT INTO `menu_items` VALUES (10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2025-11-02 23:32:51', '2025-11-27 23:44:54', 'voyager.settings.index', NULL);
INSERT INTO `menu_items` VALUES (11, 1, 'Categories', '', '_self', 'voyager-file-text', '#000000', NULL, 2, '2025-11-25 14:40:28', '2025-11-28 09:24:37', 'voyager.categories.index', 'null');
INSERT INTO `menu_items` VALUES (12, 1, 'Products', '', '_self', 'voyager-shop', '#000000', NULL, 5, '2025-11-27 21:34:24', '2025-11-28 09:24:04', 'voyager.products.index', 'null');
INSERT INTO `menu_items` VALUES (13, 1, 'Colors', '', '_self', 'voyager-file-text', '#000000', NULL, 4, '2025-11-27 22:10:32', '2025-11-28 09:23:03', 'voyager.colors.index', 'null');
INSERT INTO `menu_items` VALUES (14, 1, 'Attributes', '', '_self', 'voyager-dot', '#000000', 16, 1, '2025-11-27 22:50:17', '2025-11-28 09:22:42', 'voyager.attributes.index', 'null');
INSERT INTO `menu_items` VALUES (15, 1, 'Attribute Values', '', '_self', 'voyager-dot', '#000000', 16, 2, '2025-11-27 23:44:01', '2025-11-28 09:22:47', 'voyager.attribute-values.index', 'null');
INSERT INTO `menu_items` VALUES (16, 1, 'Attributes', '', '_self', 'voyager-folder', '#000000', NULL, 3, '2025-11-27 23:44:26', '2025-11-28 09:24:37', NULL, '');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menus_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'admin', '2025-11-02 23:32:51', '2025-11-02 23:32:51');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_permission_id_index`(`permission_id`) USING BTREE,
  INDEX `permission_role_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permissions_key_index`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for product_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute_values`;
CREATE TABLE `product_attribute_values`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value_id` bigint(20) NULL DEFAULT NULL,
  `value_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value_id` bigint(255) UNSIGNED NULL DEFAULT NULL,
  `value_number` bigint(20) NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `color_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
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
  `stock` int(11) NOT NULL DEFAULT 1,
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (9, 6, 3, 'Samsung SM-X210 Galaxy Tab A9+ 4GB RAM 64GB Wi-Fi Navy', 'samsung-sm-x210-galaxy-tab-a9-4gb-ram-64gb-wi-fi-navy', '<p>საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი &mdash; Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.</p>', 419.00, 350.00, 250.00, NULL, NULL, NULL, 'LARI', 1, 'active', 'new', '[\"products\\\\November2025\\\\5VLKOolY2xkFwm8EorMv.jpeg\",\"products\\\\November2025\\\\Lg79eDxwWUUjcXBA7GBg.jpeg\"]', NULL, '2025-11-28 05:47:44', '2025-11-28 05:47:44');
INSERT INTO `products` VALUES (10, 6, 2, 'Samsung Galaxy A17 A175F/DS LTE 4/128GB Light Blue', 'samsung-galaxy-a17-a175fds-lte-4128gb-light-blue', '<p>საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი &mdash; Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.</p>', 399.00, 200.00, NULL, NULL, NULL, NULL, 'LARI', 1, 'active', 'new', '[\"products\\\\November2025\\\\RMtCJOX27Lmn929VgVCw.jpeg\",\"products\\\\November2025\\\\MKGEx2AX4iUwCDJND4ex.jpeg\",\"products\\\\November2025\\\\OSoz9kTNnw1xUbac4JHi.jpeg\"]', NULL, '2025-11-28 06:08:54', '2025-11-28 06:08:54');
INSERT INTO `products` VALUES (11, 7, 3, 'Apple iPhone 17 Pro Max e-SIM Only | 256GB Cosmic Orange', 'apple-iphone-17-pro-max-e-sim-only-256gb-cosmic-orange', '<p>საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი &mdash; Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.</p>', 4099.00, 3500.00, 2500.00, NULL, NULL, NULL, 'LARI', 1, 'active', 'owned', '[\"products\\\\November2025\\\\FIxzcL1GKKKPT3KEHdNu.jpeg\",\"products\\\\November2025\\\\uREpaPLhswVneOAjqMri.jpeg\",\"products\\\\November2025\\\\C78g6Ryb7fn318EWCaqW.jpeg\",\"products\\\\November2025\\\\70SQtMajxjigdrFQDHx9.jpeg\"]', NULL, '2025-11-28 06:11:10', '2025-11-28 09:52:41');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('8GZYDdLbTdqzjxnaAoCO7MJGhJlD7V28tIy0dcVQ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiU3dHbzlwWElscEU1RUI4Mmw5MlM3NFFRZHBxNGNqOTFmQ2NTbDRpbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9tb2JpbGVjb3JuZXIubGMvcGFnZXMvY2hlY2tvdXQiO3M6NToicm91dGUiO3M6MTQ6InBhZ2VzLmNoZWNrb3V0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9fQ==', 1764309667);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_key_unique`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `translations_table_name_column_name_foreign_key_locale_unique`(`table_name`, `column_name`, `foreign_key`, `locale`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `user_roles_user_id_index`(`user_id`) USING BTREE,
  INDEX `user_roles_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 1, 'Super Admin', 'nikakharadze82@gmail.com', 'users\\November2025\\jhVjRCjEACqHauNvq9EE.png', NULL, '$2y$12$TYoccilpFM8RqOzdCgNDGuzJisjLazBD2bcjGcdJO.TmrGUM7Ex5i', NULL, '{\"locale\":\"en\"}', '2025-11-02 23:38:58', '2025-11-28 09:55:09');

SET FOREIGN_KEY_CHECKS = 1;
