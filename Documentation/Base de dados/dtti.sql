/*
 Navicat Premium Dump SQL

 Source Server         : bruno
 Source Server Type    : MySQL
 Source Server Version : 80038 (8.0.38)
 Source Host           : localhost:3306
 Source Schema         : dtti

 Target Server Type    : MySQL
 Target Server Version : 80038 (8.0.38)
 File Encoding         : 65001

 Date: 20/10/2024 23:08:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for equipamento
-- ----------------------------
DROP TABLE IF EXISTS `equipamento`;
CREATE TABLE `equipamento`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipamentos_id` int NOT NULL,
  `relatorios_id` int NOT NULL,
  `quantidade` int NOT NULL,
  `status` enum('Bom','Mau','Manutenção') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `localizacao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `data_verificacao` date NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_table1_equipamentos1_idx`(`equipamentos_id` ASC) USING BTREE,
  INDEX `fk_equipamento_relatorios1_idx`(`relatorios_id` ASC) USING BTREE,
  CONSTRAINT `fk_equipamento_relatorios1` FOREIGN KEY (`relatorios_id`) REFERENCES `relatorios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_table1_equipamentos1` FOREIGN KEY (`equipamentos_id`) REFERENCES `equipamentos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipamento
-- ----------------------------
INSERT INTO `equipamento` VALUES (1, 1, 1, 2, 'Bom', 'sala do tecnico dia', NULL, 1, '2024-10-20 12:02:22', '2024-10-20 12:02:22', NULL);
INSERT INTO `equipamento` VALUES (2, 2, 1, 1, 'Bom', 'Sala do Tecnico Dia', NULL, 1, '2024-10-20 12:02:22', '2024-10-20 12:02:22', NULL);
INSERT INTO `equipamento` VALUES (3, 1, 2, 2, 'Mau', 'Sala Tecnico Dia', NULL, 1, '2024-10-20 12:09:19', '2024-10-20 12:09:19', NULL);
INSERT INTO `equipamento` VALUES (4, 2, 2, 2, 'Bom', 'Sala do Tecnico Dia', NULL, 1, '2024-10-20 12:09:19', '2024-10-20 12:09:19', NULL);
INSERT INTO `equipamento` VALUES (9, 1, 5, 0, 'Bom', 'operacionalo', NULL, 1, '2024-10-20 17:35:46', '2024-10-20 17:35:46', NULL);
INSERT INTO `equipamento` VALUES (10, 1, 5, 0, 'Bom', 'operacionalo', NULL, 1, '2024-10-20 17:37:16', '2024-10-20 17:37:16', NULL);
INSERT INTO `equipamento` VALUES (11, 1, 5, 0, 'Bom', 'operacionalo', NULL, 1, '2024-10-20 17:38:31', '2024-10-20 17:38:31', NULL);
INSERT INTO `equipamento` VALUES (12, 1, 5, 0, 'Bom', 'operacionalo', NULL, 1, '2024-10-20 17:48:56', '2024-10-20 17:48:56', NULL);
INSERT INTO `equipamento` VALUES (13, 1, 5, 0, 'Bom', 'operacionalo', NULL, 1, '2024-10-20 17:50:28', '2024-10-20 17:50:28', NULL);
INSERT INTO `equipamento` VALUES (14, 1, 5, 0, 'Bom', 'operacionalo', NULL, 1, '2024-10-20 17:52:05', '2024-10-20 17:52:05', NULL);
INSERT INTO `equipamento` VALUES (15, 1, 5, 0, 'Bom', 'operacionalo', NULL, 1, '2024-10-20 17:57:32', '2024-10-20 17:57:32', NULL);
INSERT INTO `equipamento` VALUES (16, 1, 5, 0, 'Bom', 'operacionalo', NULL, 1, '2024-10-20 18:12:47', '2024-10-20 18:12:47', NULL);
INSERT INTO `equipamento` VALUES (17, 1, 6, 2, 'Bom', 'sala Tecnica', NULL, 1, '2024-10-20 18:13:47', '2024-10-20 18:13:47', NULL);
INSERT INTO `equipamento` VALUES (18, 1, 6, 2, 'Bom', 'sala Tecnica', NULL, 1, '2024-10-20 18:22:24', '2024-10-20 18:22:24', NULL);
INSERT INTO `equipamento` VALUES (19, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 18:23:44', '2024-10-20 18:23:44', NULL);
INSERT INTO `equipamento` VALUES (20, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 18:23:44', '2024-10-20 18:23:44', NULL);
INSERT INTO `equipamento` VALUES (21, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 18:27:12', '2024-10-20 18:27:12', NULL);
INSERT INTO `equipamento` VALUES (22, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 18:27:12', '2024-10-20 18:27:12', NULL);
INSERT INTO `equipamento` VALUES (23, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 18:34:44', '2024-10-20 18:34:44', NULL);
INSERT INTO `equipamento` VALUES (24, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 18:34:44', '2024-10-20 18:34:44', NULL);
INSERT INTO `equipamento` VALUES (25, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 18:55:39', '2024-10-20 18:55:39', NULL);
INSERT INTO `equipamento` VALUES (26, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 18:55:39', '2024-10-20 18:55:39', NULL);
INSERT INTO `equipamento` VALUES (27, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:01:25', '2024-10-20 19:01:25', NULL);
INSERT INTO `equipamento` VALUES (28, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:01:25', '2024-10-20 19:01:25', NULL);
INSERT INTO `equipamento` VALUES (29, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:04:58', '2024-10-20 19:04:58', NULL);
INSERT INTO `equipamento` VALUES (30, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:04:58', '2024-10-20 19:04:58', NULL);
INSERT INTO `equipamento` VALUES (31, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:08:12', '2024-10-20 19:08:12', NULL);
INSERT INTO `equipamento` VALUES (32, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:08:12', '2024-10-20 19:08:12', NULL);
INSERT INTO `equipamento` VALUES (33, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:13:21', '2024-10-20 19:13:21', NULL);
INSERT INTO `equipamento` VALUES (34, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:13:21', '2024-10-20 19:13:21', NULL);
INSERT INTO `equipamento` VALUES (35, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:19:12', '2024-10-20 19:19:12', NULL);
INSERT INTO `equipamento` VALUES (36, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:19:12', '2024-10-20 19:19:12', NULL);
INSERT INTO `equipamento` VALUES (37, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:31:25', '2024-10-20 19:31:25', NULL);
INSERT INTO `equipamento` VALUES (38, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:31:25', '2024-10-20 19:31:25', NULL);
INSERT INTO `equipamento` VALUES (39, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:33:30', '2024-10-20 19:33:30', NULL);
INSERT INTO `equipamento` VALUES (40, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:33:30', '2024-10-20 19:33:30', NULL);
INSERT INTO `equipamento` VALUES (41, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:36:28', '2024-10-20 19:36:28', NULL);
INSERT INTO `equipamento` VALUES (42, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:36:28', '2024-10-20 19:36:28', NULL);
INSERT INTO `equipamento` VALUES (43, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:55:33', '2024-10-20 19:55:33', NULL);
INSERT INTO `equipamento` VALUES (44, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 19:55:33', '2024-10-20 19:55:33', NULL);
INSERT INTO `equipamento` VALUES (45, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:17:00', '2024-10-20 20:17:00', NULL);
INSERT INTO `equipamento` VALUES (46, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:17:00', '2024-10-20 20:17:00', NULL);
INSERT INTO `equipamento` VALUES (47, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:20:19', '2024-10-20 20:20:19', NULL);
INSERT INTO `equipamento` VALUES (48, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:20:19', '2024-10-20 20:20:19', NULL);
INSERT INTO `equipamento` VALUES (49, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:24:25', '2024-10-20 20:24:25', NULL);
INSERT INTO `equipamento` VALUES (50, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:24:25', '2024-10-20 20:24:25', NULL);
INSERT INTO `equipamento` VALUES (51, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:28:55', '2024-10-20 20:28:55', NULL);
INSERT INTO `equipamento` VALUES (52, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:28:55', '2024-10-20 20:28:55', NULL);
INSERT INTO `equipamento` VALUES (53, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:34:43', '2024-10-20 20:34:43', NULL);
INSERT INTO `equipamento` VALUES (54, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:34:43', '2024-10-20 20:34:43', NULL);
INSERT INTO `equipamento` VALUES (55, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:38:25', '2024-10-20 20:38:25', NULL);
INSERT INTO `equipamento` VALUES (56, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:38:25', '2024-10-20 20:38:25', NULL);
INSERT INTO `equipamento` VALUES (57, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:39:24', '2024-10-20 20:39:24', NULL);
INSERT INTO `equipamento` VALUES (58, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:39:24', '2024-10-20 20:39:24', NULL);
INSERT INTO `equipamento` VALUES (59, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:40:03', '2024-10-20 20:40:03', NULL);
INSERT INTO `equipamento` VALUES (60, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:40:03', '2024-10-20 20:40:03', NULL);
INSERT INTO `equipamento` VALUES (61, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:47:26', '2024-10-20 20:47:26', NULL);
INSERT INTO `equipamento` VALUES (62, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:47:26', '2024-10-20 20:47:26', NULL);
INSERT INTO `equipamento` VALUES (63, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:51:00', '2024-10-20 20:51:00', NULL);
INSERT INTO `equipamento` VALUES (64, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:51:00', '2024-10-20 20:51:00', NULL);
INSERT INTO `equipamento` VALUES (65, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:53:22', '2024-10-20 20:53:22', NULL);
INSERT INTO `equipamento` VALUES (66, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:53:22', '2024-10-20 20:53:22', NULL);
INSERT INTO `equipamento` VALUES (67, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:56:04', '2024-10-20 20:56:04', NULL);
INSERT INTO `equipamento` VALUES (68, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:56:04', '2024-10-20 20:56:04', NULL);
INSERT INTO `equipamento` VALUES (69, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:59:04', '2024-10-20 20:59:04', NULL);
INSERT INTO `equipamento` VALUES (70, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 20:59:04', '2024-10-20 20:59:04', NULL);
INSERT INTO `equipamento` VALUES (71, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:03:00', '2024-10-20 21:03:00', NULL);
INSERT INTO `equipamento` VALUES (72, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:03:00', '2024-10-20 21:03:00', NULL);
INSERT INTO `equipamento` VALUES (73, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:05:17', '2024-10-20 21:05:17', NULL);
INSERT INTO `equipamento` VALUES (74, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:05:17', '2024-10-20 21:05:17', NULL);
INSERT INTO `equipamento` VALUES (75, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:06:29', '2024-10-20 21:06:29', NULL);
INSERT INTO `equipamento` VALUES (76, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:06:29', '2024-10-20 21:06:29', NULL);
INSERT INTO `equipamento` VALUES (77, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:08:55', '2024-10-20 21:08:55', NULL);
INSERT INTO `equipamento` VALUES (78, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:08:55', '2024-10-20 21:08:55', NULL);
INSERT INTO `equipamento` VALUES (79, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:09:31', '2024-10-20 21:09:31', NULL);
INSERT INTO `equipamento` VALUES (80, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:09:31', '2024-10-20 21:09:31', NULL);
INSERT INTO `equipamento` VALUES (81, 1, 7, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:11:19', '2024-10-20 21:11:19', NULL);
INSERT INTO `equipamento` VALUES (82, 2, 7, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-20 21:11:19', '2024-10-20 21:11:19', NULL);
INSERT INTO `equipamento` VALUES (83, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:19:17', '2024-10-20 21:19:17', NULL);
INSERT INTO `equipamento` VALUES (84, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:19:17', '2024-10-20 21:19:17', NULL);
INSERT INTO `equipamento` VALUES (85, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:21:15', '2024-10-20 21:21:15', NULL);
INSERT INTO `equipamento` VALUES (86, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:21:15', '2024-10-20 21:21:15', NULL);
INSERT INTO `equipamento` VALUES (87, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:24:08', '2024-10-20 21:24:08', NULL);
INSERT INTO `equipamento` VALUES (88, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:24:08', '2024-10-20 21:24:08', NULL);
INSERT INTO `equipamento` VALUES (89, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:30:26', '2024-10-20 21:30:26', NULL);
INSERT INTO `equipamento` VALUES (90, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:30:26', '2024-10-20 21:30:26', NULL);
INSERT INTO `equipamento` VALUES (91, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:33:40', '2024-10-20 21:33:40', NULL);
INSERT INTO `equipamento` VALUES (92, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:33:40', '2024-10-20 21:33:40', NULL);
INSERT INTO `equipamento` VALUES (93, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:37:47', '2024-10-20 21:37:47', NULL);
INSERT INTO `equipamento` VALUES (94, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:37:47', '2024-10-20 21:37:47', NULL);
INSERT INTO `equipamento` VALUES (95, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:40:40', '2024-10-20 21:40:40', NULL);
INSERT INTO `equipamento` VALUES (96, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:40:40', '2024-10-20 21:40:40', NULL);
INSERT INTO `equipamento` VALUES (97, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:49:44', '2024-10-20 21:49:44', NULL);
INSERT INTO `equipamento` VALUES (98, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:49:44', '2024-10-20 21:49:44', NULL);
INSERT INTO `equipamento` VALUES (99, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:50:25', '2024-10-20 21:50:25', NULL);
INSERT INTO `equipamento` VALUES (100, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:50:25', '2024-10-20 21:50:25', NULL);
INSERT INTO `equipamento` VALUES (101, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:51:39', '2024-10-20 21:51:39', NULL);
INSERT INTO `equipamento` VALUES (102, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:51:39', '2024-10-20 21:51:39', NULL);
INSERT INTO `equipamento` VALUES (103, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:53:25', '2024-10-20 21:53:25', NULL);
INSERT INTO `equipamento` VALUES (104, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:53:25', '2024-10-20 21:53:25', NULL);
INSERT INTO `equipamento` VALUES (105, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:56:00', '2024-10-20 21:56:00', NULL);
INSERT INTO `equipamento` VALUES (106, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:56:00', '2024-10-20 21:56:00', NULL);
INSERT INTO `equipamento` VALUES (107, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:56:35', '2024-10-20 21:56:35', NULL);
INSERT INTO `equipamento` VALUES (108, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:56:35', '2024-10-20 21:56:35', NULL);
INSERT INTO `equipamento` VALUES (109, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 21:57:08', '2024-10-20 21:57:08', NULL);
INSERT INTO `equipamento` VALUES (110, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 21:57:08', '2024-10-20 21:57:08', NULL);
INSERT INTO `equipamento` VALUES (111, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 22:03:40', '2024-10-20 22:03:40', NULL);
INSERT INTO `equipamento` VALUES (112, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 22:03:40', '2024-10-20 22:03:40', NULL);
INSERT INTO `equipamento` VALUES (113, 1, 8, 2, 'Bom', 'Sala tecnica', NULL, 1, '2024-10-20 22:23:17', '2024-10-20 22:23:17', NULL);
INSERT INTO `equipamento` VALUES (114, 2, 8, 2, 'Manutenção', 'Sala Tecnica', NULL, 1, '2024-10-20 22:23:17', '2024-10-20 22:23:17', NULL);
INSERT INTO `equipamento` VALUES (115, 1, 11, 1, 'Bom', 'dfsgfs', NULL, 1, '2024-10-20 23:06:55', '2024-10-20 23:06:55', NULL);
INSERT INTO `equipamento` VALUES (116, 1, 11, 1, 'Bom', 'dfsgfs', NULL, 1, '2024-10-20 23:07:35', '2024-10-20 23:07:35', NULL);

-- ----------------------------
-- Table structure for equipamentos
-- ----------------------------
DROP TABLE IF EXISTS `equipamentos`;
CREATE TABLE `equipamentos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipamentos
-- ----------------------------
INSERT INTO `equipamentos` VALUES (1, 'TV', 1, '2024-10-20 10:43:56', '2024-10-20 10:43:56', NULL);
INSERT INTO `equipamentos` VALUES (2, 'Telefone', 1, '2024-10-20 10:44:05', '2024-10-20 10:44:05', NULL);
INSERT INTO `equipamentos` VALUES (3, 'Servidor', 1, '2024-10-20 10:44:14', '2024-10-20 10:44:14', NULL);

-- ----------------------------
-- Table structure for observacao
-- ----------------------------
DROP TABLE IF EXISTS `observacao`;
CREATE TABLE `observacao`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `situacao_id` int NOT NULL,
  `relatorios_id` int NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_observacao_situacao1_idx`(`situacao_id` ASC) USING BTREE,
  INDEX `fk_observacao_relatorios1_idx`(`relatorios_id` ASC) USING BTREE,
  CONSTRAINT `fk_observacao_relatorios1` FOREIGN KEY (`relatorios_id`) REFERENCES `relatorios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_observacao_situacao1` FOREIGN KEY (`situacao_id`) REFERENCES `situacao` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of observacao
-- ----------------------------
INSERT INTO `observacao` VALUES (1, 1, 1, 'a Rede GRS se encontra estavel e operacional ', 1, '2024-10-20 12:02:22', '2024-10-20 12:02:22', NULL);
INSERT INTO `observacao` VALUES (2, 2, 1, 'A rede de Telefonia Voip se encontra operacional e nao tem neenhum problema isso significca que a Ms telecom esta funcional e usada da para falar com a parte interna e externa', 1, '2024-10-20 12:02:22', '2024-10-20 12:02:22', NULL);
INSERT INTO `observacao` VALUES (3, 1, 2, 'tudo operacional', 1, '2024-10-20 12:09:19', '2024-10-20 12:09:19', NULL);
INSERT INTO `observacao` VALUES (4, 2, 2, 'tudo operacional', 1, '2024-10-20 12:09:19', '2024-10-20 12:09:19', NULL);
INSERT INTO `observacao` VALUES (9, 1, 3, 'ygjgh', 1, '2024-10-20 15:52:53', '2024-10-20 15:52:53', NULL);
INSERT INTO `observacao` VALUES (10, 2, 3, 'jfgjghjgyfj', 1, '2024-10-20 15:52:53', '2024-10-20 15:52:53', NULL);
INSERT INTO `observacao` VALUES (12, 1, 3, 'ygjgh', 1, '2024-10-20 17:33:28', '2024-10-20 17:33:28', NULL);
INSERT INTO `observacao` VALUES (13, 2, 3, 'jfgjghjgyfj', 1, '2024-10-20 17:33:28', '2024-10-20 17:33:28', NULL);
INSERT INTO `observacao` VALUES (15, 1, 3, 'ygjgh', 1, '2024-10-20 17:34:14', '2024-10-20 17:34:14', NULL);
INSERT INTO `observacao` VALUES (16, 2, 3, 'jfgjghjgyfj', 1, '2024-10-20 17:34:14', '2024-10-20 17:34:14', NULL);
INSERT INTO `observacao` VALUES (18, 1, 5, 'operacional', 1, '2024-10-20 17:35:46', '2024-10-20 17:35:46', NULL);
INSERT INTO `observacao` VALUES (19, 1, 5, 'operacional', 1, '2024-10-20 17:37:16', '2024-10-20 17:37:16', NULL);
INSERT INTO `observacao` VALUES (20, 1, 5, 'operacional', 1, '2024-10-20 17:38:31', '2024-10-20 17:38:31', NULL);
INSERT INTO `observacao` VALUES (21, 1, 5, 'operacional', 1, '2024-10-20 17:48:56', '2024-10-20 17:48:56', NULL);
INSERT INTO `observacao` VALUES (22, 1, 5, 'operacional', 1, '2024-10-20 17:50:28', '2024-10-20 17:50:28', NULL);
INSERT INTO `observacao` VALUES (23, 1, 5, 'operacional', 1, '2024-10-20 17:52:05', '2024-10-20 17:52:05', NULL);
INSERT INTO `observacao` VALUES (24, 1, 5, 'operacional', 1, '2024-10-20 17:57:32', '2024-10-20 17:57:32', NULL);
INSERT INTO `observacao` VALUES (25, 1, 5, 'operacional', 1, '2024-10-20 18:12:47', '2024-10-20 18:12:47', NULL);
INSERT INTO `observacao` VALUES (26, 1, 6, 'opreacional sem interrupcoes', 1, '2024-10-20 18:13:47', '2024-10-20 18:13:47', NULL);
INSERT INTO `observacao` VALUES (27, 1, 6, 'opreacional sem interrupcoes', 1, '2024-10-20 18:22:24', '2024-10-20 18:22:24', NULL);
INSERT INTO `observacao` VALUES (28, 1, 7, 'operacional', 1, '2024-10-20 18:23:44', '2024-10-20 18:23:44', NULL);
INSERT INTO `observacao` VALUES (29, 2, 7, 'operacional', 1, '2024-10-20 18:23:44', '2024-10-20 18:23:44', NULL);
INSERT INTO `observacao` VALUES (30, 1, 7, 'operacional', 1, '2024-10-20 18:27:12', '2024-10-20 18:27:12', NULL);
INSERT INTO `observacao` VALUES (31, 2, 7, 'operacional', 1, '2024-10-20 18:27:12', '2024-10-20 18:27:12', NULL);
INSERT INTO `observacao` VALUES (32, 1, 7, 'operacional', 1, '2024-10-20 18:34:44', '2024-10-20 18:34:44', NULL);
INSERT INTO `observacao` VALUES (33, 2, 7, 'operacional', 1, '2024-10-20 18:34:44', '2024-10-20 18:34:44', NULL);
INSERT INTO `observacao` VALUES (34, 1, 7, 'operacional', 1, '2024-10-20 18:55:39', '2024-10-20 18:55:39', NULL);
INSERT INTO `observacao` VALUES (35, 2, 7, 'operacional', 1, '2024-10-20 18:55:39', '2024-10-20 18:55:39', NULL);
INSERT INTO `observacao` VALUES (36, 1, 7, 'operacional', 1, '2024-10-20 19:01:25', '2024-10-20 19:01:25', NULL);
INSERT INTO `observacao` VALUES (37, 2, 7, 'operacional', 1, '2024-10-20 19:01:25', '2024-10-20 19:01:25', NULL);
INSERT INTO `observacao` VALUES (38, 1, 7, 'operacional', 1, '2024-10-20 19:04:58', '2024-10-20 19:04:58', NULL);
INSERT INTO `observacao` VALUES (39, 2, 7, 'operacional', 1, '2024-10-20 19:04:58', '2024-10-20 19:04:58', NULL);
INSERT INTO `observacao` VALUES (40, 1, 7, 'operacional', 1, '2024-10-20 19:08:12', '2024-10-20 19:08:12', NULL);
INSERT INTO `observacao` VALUES (41, 2, 7, 'operacional', 1, '2024-10-20 19:08:12', '2024-10-20 19:08:12', NULL);
INSERT INTO `observacao` VALUES (42, 1, 7, 'operacional', 1, '2024-10-20 19:13:21', '2024-10-20 19:13:21', NULL);
INSERT INTO `observacao` VALUES (43, 2, 7, 'operacional', 1, '2024-10-20 19:13:21', '2024-10-20 19:13:21', NULL);
INSERT INTO `observacao` VALUES (44, 1, 7, 'operacional', 1, '2024-10-20 19:19:12', '2024-10-20 19:19:12', NULL);
INSERT INTO `observacao` VALUES (45, 2, 7, 'operacional', 1, '2024-10-20 19:19:12', '2024-10-20 19:19:12', NULL);
INSERT INTO `observacao` VALUES (46, 1, 7, 'operacional', 1, '2024-10-20 19:31:25', '2024-10-20 19:31:25', NULL);
INSERT INTO `observacao` VALUES (47, 2, 7, 'operacional', 1, '2024-10-20 19:31:25', '2024-10-20 19:31:25', NULL);
INSERT INTO `observacao` VALUES (48, 1, 7, 'operacional', 1, '2024-10-20 19:33:30', '2024-10-20 19:33:30', NULL);
INSERT INTO `observacao` VALUES (49, 2, 7, 'operacional', 1, '2024-10-20 19:33:30', '2024-10-20 19:33:30', NULL);
INSERT INTO `observacao` VALUES (50, 1, 7, 'operacional', 1, '2024-10-20 19:36:28', '2024-10-20 19:36:28', NULL);
INSERT INTO `observacao` VALUES (51, 2, 7, 'operacional', 1, '2024-10-20 19:36:28', '2024-10-20 19:36:28', NULL);
INSERT INTO `observacao` VALUES (52, 1, 7, 'operacional', 1, '2024-10-20 19:55:33', '2024-10-20 19:55:33', NULL);
INSERT INTO `observacao` VALUES (53, 2, 7, 'operacional', 1, '2024-10-20 19:55:33', '2024-10-20 19:55:33', NULL);
INSERT INTO `observacao` VALUES (54, 1, 7, 'operacional', 1, '2024-10-20 20:17:00', '2024-10-20 20:17:00', NULL);
INSERT INTO `observacao` VALUES (55, 2, 7, 'operacional', 1, '2024-10-20 20:17:00', '2024-10-20 20:17:00', NULL);
INSERT INTO `observacao` VALUES (56, 1, 7, 'operacional', 1, '2024-10-20 20:20:19', '2024-10-20 20:20:19', NULL);
INSERT INTO `observacao` VALUES (57, 2, 7, 'operacional', 1, '2024-10-20 20:20:19', '2024-10-20 20:20:19', NULL);
INSERT INTO `observacao` VALUES (58, 1, 7, 'operacional', 1, '2024-10-20 20:24:25', '2024-10-20 20:24:25', NULL);
INSERT INTO `observacao` VALUES (59, 2, 7, 'operacional', 1, '2024-10-20 20:24:25', '2024-10-20 20:24:25', NULL);
INSERT INTO `observacao` VALUES (60, 1, 7, 'operacional', 1, '2024-10-20 20:28:55', '2024-10-20 20:28:55', NULL);
INSERT INTO `observacao` VALUES (61, 2, 7, 'operacional', 1, '2024-10-20 20:28:55', '2024-10-20 20:28:55', NULL);
INSERT INTO `observacao` VALUES (62, 1, 7, 'operacional', 1, '2024-10-20 20:34:43', '2024-10-20 20:34:43', NULL);
INSERT INTO `observacao` VALUES (63, 2, 7, 'operacional', 1, '2024-10-20 20:34:43', '2024-10-20 20:34:43', NULL);
INSERT INTO `observacao` VALUES (64, 1, 7, 'operacional', 1, '2024-10-20 20:38:25', '2024-10-20 20:38:25', NULL);
INSERT INTO `observacao` VALUES (65, 2, 7, 'operacional', 1, '2024-10-20 20:38:25', '2024-10-20 20:38:25', NULL);
INSERT INTO `observacao` VALUES (66, 1, 7, 'operacional', 1, '2024-10-20 20:39:24', '2024-10-20 20:39:24', NULL);
INSERT INTO `observacao` VALUES (67, 2, 7, 'operacional', 1, '2024-10-20 20:39:24', '2024-10-20 20:39:24', NULL);
INSERT INTO `observacao` VALUES (68, 1, 7, 'operacional', 1, '2024-10-20 20:40:03', '2024-10-20 20:40:03', NULL);
INSERT INTO `observacao` VALUES (69, 2, 7, 'operacional', 1, '2024-10-20 20:40:03', '2024-10-20 20:40:03', NULL);
INSERT INTO `observacao` VALUES (70, 1, 7, 'operacional', 1, '2024-10-20 20:47:26', '2024-10-20 20:47:26', NULL);
INSERT INTO `observacao` VALUES (71, 2, 7, 'operacional', 1, '2024-10-20 20:47:26', '2024-10-20 20:47:26', NULL);
INSERT INTO `observacao` VALUES (72, 1, 7, 'operacional', 1, '2024-10-20 20:51:00', '2024-10-20 20:51:00', NULL);
INSERT INTO `observacao` VALUES (73, 2, 7, 'operacional', 1, '2024-10-20 20:51:00', '2024-10-20 20:51:00', NULL);
INSERT INTO `observacao` VALUES (74, 1, 7, 'operacional', 1, '2024-10-20 20:53:22', '2024-10-20 20:53:22', NULL);
INSERT INTO `observacao` VALUES (75, 2, 7, 'operacional', 1, '2024-10-20 20:53:22', '2024-10-20 20:53:22', NULL);
INSERT INTO `observacao` VALUES (76, 1, 7, 'operacional', 1, '2024-10-20 20:56:04', '2024-10-20 20:56:04', NULL);
INSERT INTO `observacao` VALUES (77, 2, 7, 'operacional', 1, '2024-10-20 20:56:04', '2024-10-20 20:56:04', NULL);
INSERT INTO `observacao` VALUES (78, 1, 7, 'operacional', 1, '2024-10-20 20:59:04', '2024-10-20 20:59:04', NULL);
INSERT INTO `observacao` VALUES (79, 2, 7, 'operacional', 1, '2024-10-20 20:59:04', '2024-10-20 20:59:04', NULL);
INSERT INTO `observacao` VALUES (80, 1, 7, 'operacional', 1, '2024-10-20 21:03:00', '2024-10-20 21:03:00', NULL);
INSERT INTO `observacao` VALUES (81, 2, 7, 'operacional', 1, '2024-10-20 21:03:00', '2024-10-20 21:03:00', NULL);
INSERT INTO `observacao` VALUES (82, 1, 7, 'operacional', 1, '2024-10-20 21:05:17', '2024-10-20 21:05:17', NULL);
INSERT INTO `observacao` VALUES (83, 2, 7, 'operacional', 1, '2024-10-20 21:05:17', '2024-10-20 21:05:17', NULL);
INSERT INTO `observacao` VALUES (84, 1, 7, 'operacional', 1, '2024-10-20 21:06:29', '2024-10-20 21:06:29', NULL);
INSERT INTO `observacao` VALUES (85, 2, 7, 'operacional', 1, '2024-10-20 21:06:29', '2024-10-20 21:06:29', NULL);
INSERT INTO `observacao` VALUES (86, 1, 7, 'operacional', 1, '2024-10-20 21:08:55', '2024-10-20 21:08:55', NULL);
INSERT INTO `observacao` VALUES (87, 2, 7, 'operacional', 1, '2024-10-20 21:08:55', '2024-10-20 21:08:55', NULL);
INSERT INTO `observacao` VALUES (88, 1, 7, 'operacional', 1, '2024-10-20 21:09:31', '2024-10-20 21:09:31', NULL);
INSERT INTO `observacao` VALUES (89, 2, 7, 'operacional', 1, '2024-10-20 21:09:31', '2024-10-20 21:09:31', NULL);
INSERT INTO `observacao` VALUES (90, 1, 7, 'operacional', 1, '2024-10-20 21:11:19', '2024-10-20 21:11:19', NULL);
INSERT INTO `observacao` VALUES (91, 2, 7, 'operacional', 1, '2024-10-20 21:11:19', '2024-10-20 21:11:19', NULL);
INSERT INTO `observacao` VALUES (92, 1, 8, 'Esta operacional', 1, '2024-10-20 21:19:17', '2024-10-20 21:19:17', NULL);
INSERT INTO `observacao` VALUES (93, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:19:17', '2024-10-20 21:19:17', NULL);
INSERT INTO `observacao` VALUES (94, 1, 8, 'Esta operacional', 1, '2024-10-20 21:21:15', '2024-10-20 21:21:15', NULL);
INSERT INTO `observacao` VALUES (95, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:21:15', '2024-10-20 21:21:15', NULL);
INSERT INTO `observacao` VALUES (96, 1, 8, 'Esta operacional', 1, '2024-10-20 21:24:08', '2024-10-20 21:24:08', NULL);
INSERT INTO `observacao` VALUES (97, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:24:08', '2024-10-20 21:24:08', NULL);
INSERT INTO `observacao` VALUES (98, 1, 8, 'Esta operacional', 1, '2024-10-20 21:30:26', '2024-10-20 21:30:26', NULL);
INSERT INTO `observacao` VALUES (99, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:30:26', '2024-10-20 21:30:26', NULL);
INSERT INTO `observacao` VALUES (100, 1, 8, 'Esta operacional', 1, '2024-10-20 21:33:40', '2024-10-20 21:33:40', NULL);
INSERT INTO `observacao` VALUES (101, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:33:40', '2024-10-20 21:33:40', NULL);
INSERT INTO `observacao` VALUES (102, 1, 8, 'Esta operacional', 1, '2024-10-20 21:37:47', '2024-10-20 21:37:47', NULL);
INSERT INTO `observacao` VALUES (103, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:37:47', '2024-10-20 21:37:47', NULL);
INSERT INTO `observacao` VALUES (104, 1, 8, 'Esta operacional', 1, '2024-10-20 21:40:40', '2024-10-20 21:40:40', NULL);
INSERT INTO `observacao` VALUES (105, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:40:40', '2024-10-20 21:40:40', NULL);
INSERT INTO `observacao` VALUES (106, 1, 8, 'Esta operacional', 1, '2024-10-20 21:49:44', '2024-10-20 21:49:44', NULL);
INSERT INTO `observacao` VALUES (107, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:49:44', '2024-10-20 21:49:44', NULL);
INSERT INTO `observacao` VALUES (108, 1, 8, 'Esta operacional', 1, '2024-10-20 21:50:25', '2024-10-20 21:50:25', NULL);
INSERT INTO `observacao` VALUES (109, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:50:25', '2024-10-20 21:50:25', NULL);
INSERT INTO `observacao` VALUES (110, 1, 8, 'Esta operacional', 1, '2024-10-20 21:51:39', '2024-10-20 21:51:39', NULL);
INSERT INTO `observacao` VALUES (111, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:51:39', '2024-10-20 21:51:39', NULL);
INSERT INTO `observacao` VALUES (112, 1, 8, 'Esta operacional', 1, '2024-10-20 21:53:25', '2024-10-20 21:53:25', NULL);
INSERT INTO `observacao` VALUES (113, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:53:25', '2024-10-20 21:53:25', NULL);
INSERT INTO `observacao` VALUES (114, 1, 8, 'Esta operacional', 1, '2024-10-20 21:56:00', '2024-10-20 21:56:00', NULL);
INSERT INTO `observacao` VALUES (115, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:56:00', '2024-10-20 21:56:00', NULL);
INSERT INTO `observacao` VALUES (116, 1, 8, 'Esta operacional', 1, '2024-10-20 21:56:35', '2024-10-20 21:56:35', NULL);
INSERT INTO `observacao` VALUES (117, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:56:35', '2024-10-20 21:56:35', NULL);
INSERT INTO `observacao` VALUES (118, 1, 8, 'Esta operacional', 1, '2024-10-20 21:57:08', '2024-10-20 21:57:08', NULL);
INSERT INTO `observacao` VALUES (119, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:57:08', '2024-10-20 21:57:08', NULL);
INSERT INTO `observacao` VALUES (120, 1, 8, 'Esta operacional', 1, '2024-10-20 22:03:40', '2024-10-20 22:03:40', NULL);
INSERT INTO `observacao` VALUES (121, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 22:03:40', '2024-10-20 22:03:40', NULL);
INSERT INTO `observacao` VALUES (122, 1, 8, 'Esta operacional', 1, '2024-10-20 22:23:17', '2024-10-20 22:23:17', NULL);
INSERT INTO `observacao` VALUES (123, 2, 8, 'esta funcionando plena,me', 1, '2024-10-20 22:23:17', '2024-10-20 22:23:17', NULL);
INSERT INTO `observacao` VALUES (124, 1, 11, 'fdhgfh', 1, '2024-10-20 23:06:55', '2024-10-20 23:06:55', NULL);
INSERT INTO `observacao` VALUES (125, 1, 11, 'fdhgfh', 1, '2024-10-20 23:07:35', '2024-10-20 23:07:35', NULL);

-- ----------------------------
-- Table structure for posto
-- ----------------------------
DROP TABLE IF EXISTS `posto`;
CREATE TABLE `posto`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sigla` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posto
-- ----------------------------
INSERT INTO `posto` VALUES (1, 'Tenente', 'TNT', 1, '2024-10-20 10:45:13', '2024-10-20 10:45:13', NULL);
INSERT INTO `posto` VALUES (2, 'Civil', 'CV', 1, '2024-10-20 10:45:24', '2024-10-20 10:45:32', NULL);

-- ----------------------------
-- Table structure for relatorios
-- ----------------------------
DROP TABLE IF EXISTS `relatorios`;
CREATE TABLE `relatorios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tecnico_cessante_id` int NULL DEFAULT NULL,
  `tecnico_entrante_id` int NULL DEFAULT NULL,
  `data_criacao` date NULL DEFAULT NULL,
  `observacoes_finais` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tecnico_cessante_id`(`tecnico_cessante_id` ASC) USING BTREE,
  INDEX `tecnico_entrante_id`(`tecnico_entrante_id` ASC) USING BTREE,
  CONSTRAINT `relatorios_ibfk_1` FOREIGN KEY (`tecnico_cessante_id`) REFERENCES `tecnicos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `relatorios_ibfk_2` FOREIGN KEY (`tecnico_entrante_id`) REFERENCES `tecnicos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of relatorios
-- ----------------------------
INSERT INTO `relatorios` VALUES (1, 1, 2, '2024-10-20', 'os sistemas foram todos assegurdos duarante as minhas 24 horas', 1, '2024-10-20 11:59:40', '2024-10-20 12:02:23', NULL);
INSERT INTO `relatorios` VALUES (2, 1, 2, '2024-10-20', 'tudo funcionouu plenamente durante as 24 horas', 1, '2024-10-20 12:07:51', '2024-10-20 12:15:10', NULL);
INSERT INTO `relatorios` VALUES (3, 1, 2, '2024-10-20', 'hjkljkl', 1, '2024-10-20 15:52:11', '2024-10-20 17:34:14', NULL);
INSERT INTO `relatorios` VALUES (4, NULL, NULL, NULL, NULL, 1, '2024-10-20 17:34:42', '2024-10-20 17:34:42', NULL);
INSERT INTO `relatorios` VALUES (5, 1, 2, '2024-10-20', 'tudo se ebcontra em pleno funcionamento', 1, '2024-10-20 17:34:43', '2024-10-20 18:12:48', NULL);
INSERT INTO `relatorios` VALUES (6, 1, 2, '2024-10-20', 'Tudo esta bem', 1, '2024-10-20 18:13:05', '2024-10-20 18:22:25', NULL);
INSERT INTO `relatorios` VALUES (7, 1, 2, '2024-10-20', 'Tudo correu bem sem nada acreser', 1, '2024-10-20 18:22:46', '2024-10-20 21:11:19', NULL);
INSERT INTO `relatorios` VALUES (8, 1, 1, '2024-10-20', 'Tudo funcionando', 1, '2024-10-20 21:18:15', '2024-10-20 22:23:18', NULL);
INSERT INTO `relatorios` VALUES (9, NULL, NULL, NULL, NULL, 1, '2024-10-20 22:46:55', '2024-10-20 22:46:55', NULL);
INSERT INTO `relatorios` VALUES (10, NULL, NULL, NULL, NULL, 1, '2024-10-20 23:05:45', '2024-10-20 23:05:45', NULL);
INSERT INTO `relatorios` VALUES (11, 1, 2, '2024-10-20', 'dsfdsf', 1, '2024-10-20 23:06:38', '2024-10-20 23:07:36', NULL);

-- ----------------------------
-- Table structure for situacao
-- ----------------------------
DROP TABLE IF EXISTS `situacao`;
CREATE TABLE `situacao`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of situacao
-- ----------------------------
INSERT INTO `situacao` VALUES (1, 'GRS', 1, '2024-10-20 10:46:46', '2024-10-20 10:46:46', NULL);
INSERT INTO `situacao` VALUES (2, 'VOIP', 1, '2024-10-20 10:47:03', '2024-10-20 10:47:03', NULL);

-- ----------------------------
-- Table structure for tecnicos
-- ----------------------------
DROP TABLE IF EXISTS `tecnicos`;
CREATE TABLE `tecnicos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `posto_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tecnicos_posto1_idx`(`posto_id` ASC) USING BTREE,
  CONSTRAINT `fk_tecnicos_posto1` FOREIGN KEY (`posto_id`) REFERENCES `posto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tecnicos
-- ----------------------------
INSERT INTO `tecnicos` VALUES (1, 'Bruno', '24354546', 1, '2024-10-20 10:45:54', '2024-10-20 10:45:54', NULL, 1);
INSERT INTO `tecnicos` VALUES (2, 'Sebastiao', '13123', 1, '2024-10-20 10:46:17', '2024-10-20 10:46:17', NULL, 2);

-- ----------------------------
-- View structure for view_equipamento
-- ----------------------------
DROP VIEW IF EXISTS `view_equipamento`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_equipamento` AS select `equipamento`.`id` AS `id`,`equipamento`.`equipamentos_id` AS `equipamentos_id`,`equipamento`.`relatorios_id` AS `relatorios_id`,`equipamento`.`quantidade` AS `quantidade`,`equipamento`.`status` AS `status`,`equipamento`.`localizacao` AS `localizacao`,`equipamentos`.`nome` AS `nome`,`equipamento`.`estado` AS `estado` from (`equipamento` join `equipamentos` on((`equipamento`.`equipamentos_id` = `equipamentos`.`id`)));

-- ----------------------------
-- View structure for view_observacao
-- ----------------------------
DROP VIEW IF EXISTS `view_observacao`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_observacao` AS select `observacao`.`id` AS `id`,`observacao`.`situacao_id` AS `situacao_id`,`observacao`.`relatorios_id` AS `relatorios_id`,`observacao`.`descricao` AS `descricao`,`situacao`.`nome` AS `nome`,`observacao`.`estado` AS `estado` from (`observacao` join `situacao` on((`observacao`.`situacao_id` = `situacao`.`id`)));

-- ----------------------------
-- View structure for view_relatorio
-- ----------------------------
DROP VIEW IF EXISTS `view_relatorio`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_relatorio` AS select `entrante`.`nome` AS `entrante`,`cessante`.`nome` AS `cessante`,`relatorios`.`id` AS `id`,`relatorios`.`tecnico_cessante_id` AS `tecnico_cessante_id`,`relatorios`.`tecnico_entrante_id` AS `tecnico_entrante_id`,`relatorios`.`data_criacao` AS `data_criacao`,`relatorios`.`observacoes_finais` AS `observacoes_finais`,`relatorios`.`estado` AS `estado` from ((`relatorios` join `tecnicos` `entrante` on((`relatorios`.`tecnico_cessante_id` = `entrante`.`id`))) join `tecnicos` `cessante` on((`relatorios`.`tecnico_entrante_id` = `cessante`.`id`)));

-- ----------------------------
-- View structure for view_relatorio_all
-- ----------------------------
DROP VIEW IF EXISTS `view_relatorio_all`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_relatorio_all` AS select `r`.`id` AS `id`,`r`.`data_criacao` AS `data_criacao`,`s`.`nome` AS `Situacao`,group_concat(distinct `o`.`descricao` separator '; ') AS `descricao`,group_concat(distinct `e`.`nome` separator '; ') AS `Meio`,sum(`eq`.`quantidade`) AS `quantidade`,group_concat(distinct `eq`.`status` separator '; ') AS `status`,group_concat(distinct `eq`.`localizacao` separator '; ') AS `localizacao`,`entrante`.`nome` AS `entrante`,`cessante`.`nome` AS `cessante`,`r`.`estado` AS `estado` from ((((((`relatorios` `r` join `equipamento` `eq` on((`r`.`id` = `eq`.`relatorios_id`))) join `observacao` `o` on((`r`.`id` = `o`.`relatorios_id`))) join `situacao` `s` on((`o`.`situacao_id` = `s`.`id`))) join `equipamentos` `e` on((`eq`.`equipamentos_id` = `e`.`id`))) join `tecnicos` `cessante` on((`r`.`tecnico_cessante_id` = `cessante`.`id`))) join `tecnicos` `entrante` on((`r`.`tecnico_entrante_id` = `entrante`.`id`))) group by `r`.`id`,`s`.`nome`,`entrante`.`nome`,`cessante`.`nome`,`r`.`estado`;

-- ----------------------------
-- View structure for view_relatorio_grupo
-- ----------------------------
DROP VIEW IF EXISTS `view_relatorio_grupo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_relatorio_grupo` AS select `relatorios`.`id` AS `id`,`relatorios`.`data_criacao` AS `data_criacao`,`situacao`.`nome` AS `Situacao`,group_concat(distinct `observacao`.`descricao` separator ', ') AS `Observacoes`,group_concat(distinct `equipamentos`.`nome` separator ', ') AS `Meios`,group_concat(distinct `equipamento`.`quantidade` separator ', ') AS `Quantidades`,group_concat(distinct `equipamento`.`status` separator ', ') AS `Status`,group_concat(distinct `equipamento`.`localizacao` separator ', ') AS `Localizacoes`,`entrante`.`nome` AS `Entrante`,`cessante`.`nome` AS `Cessante` from ((((((`relatorios` join `equipamento` on((`relatorios`.`id` = `equipamento`.`relatorios_id`))) join `observacao` on((`relatorios`.`id` = `observacao`.`relatorios_id`))) join `situacao` on((`observacao`.`situacao_id` = `situacao`.`id`))) join `equipamentos` on((`equipamento`.`equipamentos_id` = `equipamentos`.`id`))) join `tecnicos` `cessante` on((`relatorios`.`tecnico_cessante_id` = `cessante`.`id`))) join `tecnicos` `entrante` on((`relatorios`.`tecnico_entrante_id` = `entrante`.`id`))) group by `relatorios`.`id`,`relatorios`.`data_criacao`,`situacao`.`nome`,`entrante`.`nome`,`cessante`.`nome`;

SET FOREIGN_KEY_CHECKS = 1;
