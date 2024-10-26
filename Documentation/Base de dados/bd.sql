/*
 Navicat Premium Data Transfer

 Source Server         : MysqlDatabases
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : sgodtti

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 26/10/2024 23:57:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for contato
-- ----------------------------
DROP TABLE IF EXISTS `contato`;
CREATE TABLE `contato`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pessoa_id` int NOT NULL,
  `tipo` enum('Telefone','Email') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `valor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pessoa_id`(`pessoa_id` ASC) USING BTREE,
  CONSTRAINT `contato_ibfk_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contato
-- ----------------------------
INSERT INTO `contato` VALUES (1, 3, 'Telefone', '926547598', 1, '2024-09-17 10:57:36', NULL, '2024-09-17 10:57:36');
INSERT INTO `contato` VALUES (33, 62, 'Telefone', '98766544554', 1, '2024-10-26 23:01:24', NULL, '2024-10-26 23:01:24');
INSERT INTO `contato` VALUES (34, 63, 'Telefone', '987665445', 1, '2024-10-26 23:03:29', NULL, '2024-10-26 23:03:29');

-- ----------------------------
-- Table structure for endereco
-- ----------------------------
DROP TABLE IF EXISTS `endereco`;
CREATE TABLE `endereco`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `municipio_id` int NOT NULL,
  `numero_casa` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bairro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `municipio_id`(`municipio_id` ASC) USING BTREE,
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of endereco
-- ----------------------------
INSERT INTO `endereco` VALUES (1, 9, '2500', 'Sagrada Familia', 1, '2024-09-17 09:35:56', NULL, '2024-09-17 09:35:56');
INSERT INTO `endereco` VALUES (2, 3, '8528', 'Grafanil', 1, '2024-09-17 10:57:36', NULL, '2024-09-17 10:57:36');
INSERT INTO `endereco` VALUES (3, 6, '12', 'Angola', 1, '2024-09-24 02:32:30', NULL, '2024-09-24 02:32:30');
INSERT INTO `endereco` VALUES (4, 6, '92', 'Angola', 1, '2024-09-24 02:47:05', NULL, '2024-09-24 02:47:05');
INSERT INTO `endereco` VALUES (5, 1, '12', 'Angola', 1, '2024-09-24 23:22:22', NULL, '2024-09-24 23:22:22');
INSERT INTO `endereco` VALUES (6, 3, '6651132', 'Mulenvos', 1, '2024-09-26 20:11:22', NULL, '2024-09-26 20:11:22');
INSERT INTO `endereco` VALUES (7, 11, '123', 'golf 2', 1, '2024-09-27 12:18:37', NULL, '2024-09-27 12:18:37');
INSERT INTO `endereco` VALUES (8, 14, '92', 'chipipa', 1, '2024-09-27 12:56:37', NULL, '2024-09-27 12:56:37');
INSERT INTO `endereco` VALUES (9, 14, '12', 'chipipa', 1, '2024-09-27 16:07:54', NULL, '2024-09-27 16:07:54');
INSERT INTO `endereco` VALUES (10, 24, '1234', 'chipipa', 1, '2024-09-27 16:19:20', NULL, '2024-09-27 16:19:20');
INSERT INTO `endereco` VALUES (11, 6, '23', 'camama', 1, '2024-09-27 16:22:30', NULL, '2024-09-27 16:22:30');
INSERT INTO `endereco` VALUES (12, 6, '668799', 'Dangeroux', 1, '2024-09-29 00:47:34', NULL, '2024-09-29 00:47:34');
INSERT INTO `endereco` VALUES (13, 4, '8888', 'Kikuxi', 1, '2024-09-30 01:03:52', NULL, '2024-09-30 01:03:52');
INSERT INTO `endereco` VALUES (14, 5, '122121', 'Dangeroux', 1, '2024-09-30 01:06:27', NULL, '2024-09-30 01:06:27');
INSERT INTO `endereco` VALUES (15, 6, '1111122', 'Dangeroux', 1, '2024-09-30 01:07:28', NULL, '2024-09-30 01:07:28');
INSERT INTO `endereco` VALUES (16, 14, NULL, NULL, 1, '2024-09-30 13:35:03', NULL, '2024-09-30 13:35:03');
INSERT INTO `endereco` VALUES (17, 10, '', 'Boa Vista', 1, '2024-10-01 05:53:04', NULL, '2024-10-01 05:53:04');

-- ----------------------------
-- Table structure for equipamento
-- ----------------------------
DROP TABLE IF EXISTS `equipamento`;
CREATE TABLE `equipamento`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipamentos_id` int NOT NULL,
  `relatorios_id` int NOT NULL,
  `quantidade` int NOT NULL,
  `status` enum('Bom','Mau','Manutenção') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `localizacao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_verificacao` date NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_table1_equipamentos1_idx`(`equipamentos_id` ASC) USING BTREE,
  INDEX `fk_equipamento_relatorios1_idx`(`relatorios_id` ASC) USING BTREE,
  CONSTRAINT `fk_equipamento_relatorios1` FOREIGN KEY (`relatorios_id`) REFERENCES `relatorios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_table1_equipamentos1` FOREIGN KEY (`equipamentos_id`) REFERENCES `equipamentos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `equipamento` VALUES (117, 2, 12, 2, 'Bom', 'Gabinete do Tecnico de Permanencia', NULL, 1, '2024-10-23 09:35:52', '2024-10-23 09:35:52', NULL);
INSERT INTO `equipamento` VALUES (118, 2, 12, 2, 'Bom', 'Gabinete do Tecnico de Permanencia', NULL, 1, '2024-10-23 09:38:17', '2024-10-23 09:38:17', NULL);
INSERT INTO `equipamento` VALUES (119, 2, 12, 2, 'Bom', 'Gabinete do Tecnico de Permanencia', NULL, 1, '2024-10-23 09:39:18', '2024-10-23 09:39:18', NULL);

-- ----------------------------
-- Table structure for equipamentos
-- ----------------------------
DROP TABLE IF EXISTS `equipamentos`;
CREATE TABLE `equipamentos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipamentos
-- ----------------------------
INSERT INTO `equipamentos` VALUES (1, 'TV', 1, '2024-10-20 10:43:56', '2024-10-20 10:43:56', NULL);
INSERT INTO `equipamentos` VALUES (2, 'Telefone', 1, '2024-10-20 10:44:05', '2024-10-20 10:44:05', NULL);
INSERT INTO `equipamentos` VALUES (3, 'Servidor', 1, '2024-10-20 10:44:14', '2024-10-20 10:44:14', NULL);

-- ----------------------------
-- Table structure for municipio
-- ----------------------------
DROP TABLE IF EXISTS `municipio`;
CREATE TABLE `municipio`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `provincia_id` int NOT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `provincia_id`(`provincia_id` ASC) USING BTREE,
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of municipio
-- ----------------------------
INSERT INTO `municipio` VALUES (1, 'Belas', 1, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (2, 'Cacuaco', 1, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (3, 'Cazenga', 1, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (4, 'Ícolo e Bengo', 1, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (5, 'Kilamba Kiaxi', 1, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (6, 'Luanda', 1, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (7, 'Quissama', 1, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (8, 'Talatona', 1, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (9, 'Viana', 1, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (10, 'Bailundo', 9, 1, '2024-09-17 09:35:16', NULL, '2024-09-30 13:56:50');
INSERT INTO `municipio` VALUES (11, 'Caála', 2, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (12, 'Catchiungo', 2, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (13, 'Ecunha', 2, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (14, 'Huambo', 9, 1, '2024-09-17 09:35:16', NULL, '2024-09-30 13:57:01');
INSERT INTO `municipio` VALUES (15, 'Londuimbali', 2, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (16, 'Longonjo', 2, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (17, 'Mungo', 2, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (18, 'Tchicala-Tcholoanga', 2, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (19, 'Ucuma', 2, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (20, 'Caconda', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (21, 'Cacula', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (22, 'Caluquembe', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (23, 'Chibia', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (24, 'Chicomba', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (25, 'Chipindo', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (26, 'Gambos', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (27, 'Humpata', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (28, 'Jamba', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (29, 'Lubango', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (30, 'Matala', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (31, 'Quilengues', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (32, 'Quipungo', 8, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (33, 'Balombo', 4, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (34, 'Benguela', 4, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (35, 'Baía Farta', 4, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (36, 'Bocoio', 4, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (37, 'Caimbambo', 4, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (38, 'Catumbela', 4, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (39, 'Chongoroi', 4, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (40, 'Cubal', 4, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (41, 'Ganda', 4, 1, '2024-09-17 09:35:16', NULL, NULL);
INSERT INTO `municipio` VALUES (42, 'Lobito', 4, 1, '2024-09-17 09:35:16', NULL, NULL);

-- ----------------------------
-- Table structure for observacao
-- ----------------------------
DROP TABLE IF EXISTS `observacao`;
CREATE TABLE `observacao`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `situacao_id` int NOT NULL,
  `relatorios_id` int NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_observacao_situacao1_idx`(`situacao_id` ASC) USING BTREE,
  INDEX `fk_observacao_relatorios1_idx`(`relatorios_id` ASC) USING BTREE,
  CONSTRAINT `fk_observacao_relatorios1` FOREIGN KEY (`relatorios_id`) REFERENCES `relatorios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_observacao_situacao1` FOREIGN KEY (`situacao_id`) REFERENCES `situacao` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `observacao` VALUES (126, 1, 12, 'Alguma Coisa', 1, '2024-10-23 09:35:52', '2024-10-23 09:35:52', NULL);
INSERT INTO `observacao` VALUES (127, 1, 12, 'Alguma Coisa', 1, '2024-10-23 09:38:17', '2024-10-23 09:38:17', NULL);
INSERT INTO `observacao` VALUES (128, 1, 12, 'Alguma Coisa', 1, '2024-10-23 09:39:18', '2024-10-23 09:39:18', NULL);

-- ----------------------------
-- Table structure for pessoa
-- ----------------------------
DROP TABLE IF EXISTS `pessoa`;
CREATE TABLE `pessoa`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `genero` enum('Masculino','Feminino','Outro') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `imagem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `endereco_id` int NULL DEFAULT NULL,
  `municipio_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_pessoa_endereco1_idx`(`endereco_id` ASC) USING BTREE,
  INDEX `fk_pessoa_municipio1_idx`(`municipio_id` ASC) USING BTREE,
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pessoa_ibfk_2` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pessoa
-- ----------------------------
INSERT INTO `pessoa` VALUES (1, 'Bruno Somavie ACVF', '2020-12-29', 'Masculino', '1726562225334.png', 1, '2024-09-17 09:37:05', NULL, '2024-10-01 09:50:59', 1, 1);
INSERT INTO `pessoa` VALUES (2, 'Paulo Almeida', '1989-02-07', 'Masculino', '1726566254192.png', 1, '2024-09-17 10:44:14', NULL, '2024-09-27 00:04:01', 1, 1);
INSERT INTO `pessoa` VALUES (3, 'Almeida Pereira Torres', '2024-09-03', 'Masculino', '1726567056689.png', 1, '2024-09-17 10:57:36', NULL, '2024-09-27 00:04:01', 2, 1);
INSERT INTO `pessoa` VALUES (4, 'Daniel vaz', '2024-09-19', 'Masculino', NULL, 1, '2024-09-17 11:48:37', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (60, 'Sebastião Augusto Lisboa António', '1998-12-12', 'Masculino', NULL, 1, '2024-10-26 12:30:39', NULL, '2024-10-26 12:30:39', NULL, 6);
INSERT INTO `pessoa` VALUES (61, 'Sebanoide Juninho', '1990-04-12', 'Masculino', NULL, 1, '2024-10-26 22:45:44', NULL, '2024-10-26 22:45:44', NULL, 3);
INSERT INTO `pessoa` VALUES (62, 'Albino Jorge', '1990-02-11', 'Masculino', NULL, 1, '2024-10-26 23:01:24', NULL, '2024-10-26 23:01:24', NULL, 6);
INSERT INTO `pessoa` VALUES (63, 'Albino Jorge 3', '1990-02-11', 'Masculino', NULL, 1, '2024-10-26 23:03:29', NULL, '2024-10-26 23:03:29', NULL, 6);

-- ----------------------------
-- Table structure for posto
-- ----------------------------
DROP TABLE IF EXISTS `posto`;
CREATE TABLE `posto`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sigla` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posto
-- ----------------------------
INSERT INTO `posto` VALUES (1, 'Tenente', 'TNT', 1, '2024-10-20 10:45:13', '2024-10-20 10:45:13', NULL);
INSERT INTO `posto` VALUES (2, 'Civil', 'CV', 1, '2024-10-20 10:45:24', '2024-10-20 10:45:32', NULL);

-- ----------------------------
-- Table structure for postosmilitares
-- ----------------------------
DROP TABLE IF EXISTS `postosmilitares`;
CREATE TABLE `postosmilitares`  (
  `Posto_Id` smallint NOT NULL,
  `Cod_categoria` tinyint NULL DEFAULT NULL,
  `Posto` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PostoAbrev` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Equiv` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`Posto_Id`) USING BTREE,
  INDEX `Cod_categoria`(`Cod_categoria` ASC) USING BTREE,
  CONSTRAINT `postosmilitares_ibfk_1` FOREIGN KEY (`Cod_categoria`) REFERENCES `tbcategoriapatente` (`CodCategoriaPatente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of postosmilitares
-- ----------------------------
INSERT INTO `postosmilitares` VALUES (100, 1, 'GENERAL CEMG', 'GCEM', 1);
INSERT INTO `postosmilitares` VALUES (101, 1, 'GENERAL  (CEM/GA/R)', 'GCEA', 2);
INSERT INTO `postosmilitares` VALUES (102, 1, 'GENERAL-DE-EXERCITO', 'GENEX', 3);
INSERT INTO `postosmilitares` VALUES (103, 1, 'ALMIRANTE DE ARMADA', 'ALMA', 3);
INSERT INTO `postosmilitares` VALUES (104, 1, 'GENERAL DE AVIAÇAO', 'GENA', 3);
INSERT INTO `postosmilitares` VALUES (105, 1, 'GENERAL', 'GEN', 4);
INSERT INTO `postosmilitares` VALUES (106, 1, 'ALMIRANTE', 'ALM', 4);
INSERT INTO `postosmilitares` VALUES (107, 1, 'T. GENERAL', 'TGEN', 5);
INSERT INTO `postosmilitares` VALUES (108, 1, 'VICE-ALMIRANTE', 'VALM', 5);
INSERT INTO `postosmilitares` VALUES (109, 1, 'BRIGADEIRO', 'BRIG', 6);
INSERT INTO `postosmilitares` VALUES (110, 1, 'CONTRA-ALMIRANTE', 'CALM', 6);
INSERT INTO `postosmilitares` VALUES (111, 1, 'CORONEL', 'COR', 7);
INSERT INTO `postosmilitares` VALUES (112, 1, 'CAP. DE-MAR-E-GUERRA', 'CMG', 7);
INSERT INTO `postosmilitares` VALUES (113, 1, 'T. CORONEL', 'TCOR', 8);
INSERT INTO `postosmilitares` VALUES (114, 1, 'CAP. DE FRAGATA', 'CFR', 8);
INSERT INTO `postosmilitares` VALUES (115, 1, 'MAJOR', 'MAJ', 9);
INSERT INTO `postosmilitares` VALUES (116, 1, 'CAP. DE CORVETA', 'CCV', 9);
INSERT INTO `postosmilitares` VALUES (117, 1, 'CAPITAO', 'CAP', 10);
INSERT INTO `postosmilitares` VALUES (118, 1, 'TTE DE NAVIO', 'TTN', 10);
INSERT INTO `postosmilitares` VALUES (119, 1, 'TTE DE FRAGATA', 'TTF', 11);
INSERT INTO `postosmilitares` VALUES (120, 1, 'TENENTE', 'TTE', 11);
INSERT INTO `postosmilitares` VALUES (121, 1, 'SUB-TENENTE', 'STT', 12);
INSERT INTO `postosmilitares` VALUES (122, 1, 'TTE DE CORVETA', 'TTC', 12);
INSERT INTO `postosmilitares` VALUES (123, 1, 'ASPIRANTE', 'ASP', 13);
INSERT INTO `postosmilitares` VALUES (125, 2, 'SARGENTO MAIOR', 'SGTM', 14);
INSERT INTO `postosmilitares` VALUES (126, 2, 'SARGENTO-CHEFE', 'SGTC', 15);
INSERT INTO `postosmilitares` VALUES (127, 2, 'SARGENTO-AJUDANTE', 'SGTA', 16);
INSERT INTO `postosmilitares` VALUES (128, 2, '1º SARGENTO', '1SGT', 17);
INSERT INTO `postosmilitares` VALUES (129, 2, '2º SARGENTO', '2SGT', 18);
INSERT INTO `postosmilitares` VALUES (130, 2, 'SUB-SARGENTO', 'SSGT', 19);
INSERT INTO `postosmilitares` VALUES (131, 3, '1º CABO', '1CB', 20);
INSERT INTO `postosmilitares` VALUES (132, 3, 'CABO', 'CB', 20);
INSERT INTO `postosmilitares` VALUES (133, 3, '2º CABO', '2CB', 22);
INSERT INTO `postosmilitares` VALUES (134, 3, 'MARINHEIRO', 'MR', 22);
INSERT INTO `postosmilitares` VALUES (135, 3, 'GRUMETE', 'GR', 23);
INSERT INTO `postosmilitares` VALUES (136, 3, 'SOLDADO', 'SOL', 23);
INSERT INTO `postosmilitares` VALUES (137, 3, 'RECRUTA', 'RECR', 24);
INSERT INTO `postosmilitares` VALUES (138, 4, 'CIVIL', 'CVL', 60);

-- ----------------------------
-- Table structure for provincia
-- ----------------------------
DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of provincia
-- ----------------------------
INSERT INTO `provincia` VALUES (1, 'Bengo', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (2, 'Benguela', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (3, 'Bié', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (4, 'Cabinda', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (5, 'Cuando Cubango', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (6, 'Cuanza Norte', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (7, 'Cuanza Sul', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (8, 'Cunene', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (9, 'Huambo', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (10, 'Huíla', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (11, 'Luanda', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (12, 'Lunda Norte', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (13, 'Lunda Sul', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (14, 'Malanje', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (15, 'Moxico', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (16, 'Namibe', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (17, 'Uíge', 1, '2024-09-17 09:12:58', NULL, NULL);
INSERT INTO `provincia` VALUES (18, 'Zaire', 1, '2024-09-17 09:12:58', NULL, NULL);

-- ----------------------------
-- Table structure for relatorios
-- ----------------------------
DROP TABLE IF EXISTS `relatorios`;
CREATE TABLE `relatorios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tecnico_cessante_id` int NOT NULL,
  `tecnico_entrante_id` int NOT NULL,
  `data_criacao` date NULL DEFAULT NULL,
  `observacoes_finais` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao_registro` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_relatorios_pessoa1_idx`(`tecnico_cessante_id` ASC) USING BTREE,
  INDEX `fk_relatorios_pessoa2_idx`(`tecnico_entrante_id` ASC) USING BTREE,
  CONSTRAINT `fk_relatorios_pessoa1` FOREIGN KEY (`tecnico_cessante_id`) REFERENCES `pessoa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_relatorios_pessoa2` FOREIGN KEY (`tecnico_entrante_id`) REFERENCES `pessoa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of relatorios
-- ----------------------------
INSERT INTO `relatorios` VALUES (1, 1, 2, '2024-10-20', 'os sistemas foram todos assegurdos duarante as minhas 24 horas', 1, '2024-10-20 11:59:40', '2024-10-26 23:22:08', NULL);
INSERT INTO `relatorios` VALUES (2, 1, 2, '2024-10-20', 'tudo funcionouu plenamente durante as 24 horas', 1, '2024-10-20 12:07:51', '2024-10-26 23:22:19', NULL);
INSERT INTO `relatorios` VALUES (3, 2, 1, '2024-10-20', 'hjkljkl', 1, '2024-10-20 15:52:11', '2024-10-26 23:22:29', NULL);
INSERT INTO `relatorios` VALUES (4, 2, 1, NULL, NULL, 1, '2024-10-20 17:34:42', '2024-10-26 23:22:46', NULL);
INSERT INTO `relatorios` VALUES (5, 63, 2, '2024-10-20', 'tudo se ebcontra em pleno funcionamento', 1, '2024-10-20 17:34:43', '2024-10-26 23:22:58', NULL);
INSERT INTO `relatorios` VALUES (6, 1, 2, '2024-10-20', 'Tudo esta bem', 1, '2024-10-20 18:13:05', '2024-10-26 23:23:21', NULL);
INSERT INTO `relatorios` VALUES (7, 0, 0, '2024-10-20', 'Tudo correu bem sem nada acreser', 1, '2024-10-20 18:22:46', '2024-10-20 21:11:19', NULL);
INSERT INTO `relatorios` VALUES (8, 0, 0, '2024-10-20', 'Tudo funcionando', 1, '2024-10-20 21:18:15', '2024-10-20 22:23:18', NULL);
INSERT INTO `relatorios` VALUES (9, 0, 0, NULL, NULL, 1, '2024-10-20 22:46:55', '2024-10-20 22:46:55', NULL);
INSERT INTO `relatorios` VALUES (10, 0, 0, NULL, NULL, 1, '2024-10-20 23:05:45', '2024-10-20 23:05:45', NULL);
INSERT INTO `relatorios` VALUES (11, 0, 0, '2024-10-20', 'dsfdsf', 1, '2024-10-20 23:06:38', '2024-10-20 23:07:36', NULL);
INSERT INTO `relatorios` VALUES (12, 0, 0, '2024-10-23', 'Durante as 24h não se verificou nada ', 1, '2024-10-23 09:33:43', '2024-10-23 09:39:18', NULL);
INSERT INTO `relatorios` VALUES (13, 0, 0, NULL, NULL, 1, '2024-10-23 19:51:08', '2024-10-23 19:51:08', NULL);

-- ----------------------------
-- Table structure for situacao
-- ----------------------------
DROP TABLE IF EXISTS `situacao`;
CREATE TABLE `situacao`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int NOT NULL,
  `posto_id` smallint NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  INDEX `fk_tecnicos_posto1_idx`(`posto_id` ASC) USING BTREE,
  INDEX `fk_tecnicos_pessoa1_idx`(`id` ASC) USING BTREE,
  CONSTRAINT `fk_tecnicos_pessoa1` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tecnicos_ibfk_1` FOREIGN KEY (`posto_id`) REFERENCES `postosmilitares` (`Posto_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tecnicos
-- ----------------------------
INSERT INTO `tecnicos` VALUES (2, 117, 1, '2024-10-20 10:45:54', '2024-10-26 23:30:33', NULL);
INSERT INTO `tecnicos` VALUES (1, 120, 1, '2024-10-20 10:46:17', '2024-10-26 16:08:39', NULL);
INSERT INTO `tecnicos` VALUES (63, 120, 1, '2024-10-26 23:03:29', '2024-10-26 23:03:29', NULL);

-- ----------------------------
-- Table structure for tipousuario
-- ----------------------------
DROP TABLE IF EXISTS `tipousuario`;
CREATE TABLE `tipousuario`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tipousuario
-- ----------------------------
INSERT INTO `tipousuario` VALUES (1, 'Admin', 'pessoa que faz a manutençãoi e configuração do sistema', 1, '2024-09-17 09:37:56', NULL, '2024-09-17 09:37:56');
INSERT INTO `tipousuario` VALUES (2, 'Professor', 'pessoa responsavel por avaliar alunos e dar aulas', 1, '2024-09-17 09:38:34', NULL, '2024-09-17 09:38:34');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pessoa_id` int NOT NULL,
  `nomeUsuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `senha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipo_usuario_id` int NOT NULL,
  `delete_permissao` tinyint(1) NULL DEFAULT 0,
  `update_permissao` tinyint(1) NULL DEFAULT 0,
  `view_permissao` tinyint(1) NULL DEFAULT 1,
  `create_permissao` tinyint(1) NULL DEFAULT 0,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pessoa_id`(`pessoa_id` ASC) USING BTREE,
  INDEX `tipo_usuario_id`(`tipo_usuario_id` ASC) USING BTREE,
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipousuario` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (1, 1, 'dias', '$2a$10$vsPH8QlmVRUe0xj2sQhi1uLa3FnKnf7AqIJuyNUQGxc5MWXFu3FZy', 1, 1, 1, 1, 1, 1, '2024-09-17 09:39:03', NULL, '2024-09-23 20:23:20');
INSERT INTO `usuario` VALUES (2, 2, 'isana', '$2a$10$4uKMLmfCPJd94plHQI8fYuPZMH9M4r4pzgKfIZ.bpzXcHlqjwIOMa', 2, 0, 1, 1, 0, 0, '2024-09-23 20:26:21', NULL, '2024-10-23 08:50:45');

-- ----------------------------
-- View structure for view_equipamento
-- ----------------------------
DROP VIEW IF EXISTS `view_equipamento`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_equipamento` AS select `equipamento`.`id` AS `id`,`equipamento`.`equipamentos_id` AS `equipamentos_id`,`equipamento`.`relatorios_id` AS `relatorios_id`,`equipamento`.`quantidade` AS `quantidade`,`equipamento`.`status` AS `status`,`equipamento`.`localizacao` AS `localizacao`,`equipamentos`.`nome` AS `nome`,`equipamento`.`estado` AS `estado` from (`equipamento` join `equipamentos` on((`equipamento`.`equipamentos_id` = `equipamentos`.`id`))); ;

-- ----------------------------
-- View structure for view_municipios
-- ----------------------------
DROP VIEW IF EXISTS `view_municipios`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_municipios` AS select `municipio`.`id` AS `id`,`municipio`.`nome` AS `nome`,`municipio`.`provincia_id` AS `provincia_id`,`provincia`.`nome` AS `provincia` from (`municipio` join `provincia` on((`municipio`.`provincia_id` = `provincia`.`id`))) ;

-- ----------------------------
-- View structure for view_observacao
-- ----------------------------
DROP VIEW IF EXISTS `view_observacao`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_observacao` AS select `observacao`.`id` AS `id`,`observacao`.`situacao_id` AS `situacao_id`,`observacao`.`relatorios_id` AS `relatorios_id`,`observacao`.`descricao` AS `descricao`,`situacao`.`nome` AS `nome`,`observacao`.`estado` AS `estado` from (`observacao` join `situacao` on((`observacao`.`situacao_id` = `situacao`.`id`))); ;

-- ----------------------------
-- View structure for view_pessoas
-- ----------------------------
DROP VIEW IF EXISTS `view_pessoas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_pessoas` AS select `pessoa`.`id` AS `id`,`pessoa`.`nome` AS `nome`,concat(`provincia`.`nome`,', ',`municipio`.`nome`,', ',`endereco`.`bairro`,', ',`endereco`.`numero_casa`) AS `endereco_completo`,`pessoa`.`genero` AS `genero`,`pessoa`.`data_nascimento` AS `data_nascimento`,`pessoa`.`endereco_id` AS `endereco_id`,`pessoa`.`imagem` AS `imagem`,`naturalidade`.`nome` AS `naturalidade` from ((((`pessoa` join `endereco` on((`pessoa`.`endereco_id` = `endereco`.`id`))) join `municipio` on((`endereco`.`municipio_id` = `municipio`.`id`))) join `provincia` on((`municipio`.`provincia_id` = `provincia`.`id`))) join `municipio` `naturalidade` on((`pessoa`.`municipio_id` = `naturalidade`.`id`))); ;

-- ----------------------------
-- View structure for view_postos
-- ----------------------------
DROP VIEW IF EXISTS `view_postos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_postos` AS SELECT
	postosmilitares.Posto_Id AS id, 
	postosmilitares.Posto AS posto, 
	postosmilitares.PostoAbrev AS postoAbrev
FROM
	postosmilitares ;

-- ----------------------------
-- View structure for view_relatorio
-- ----------------------------
DROP VIEW IF EXISTS `view_relatorio`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_relatorio` AS SELECT
	relatorios.id, 
	relatorios.tecnico_cessante_id, 
	relatorios.tecnico_entrante_id, 
	relatorios.data_criacao, 
	relatorios.observacoes_finais, 
	relatorios.estado, 
	pcessante.nome AS cessante, 
	pentrante.nome AS entrante, 
	tp_cessante.Posto AS posto_cessante, 
	tp_entrante.Posto AS posto_entrante
FROM
	relatorios
	INNER JOIN
	pessoa AS pcessante
	ON 
		relatorios.tecnico_cessante_id = pcessante.id
	INNER JOIN
	pessoa AS pentrante
	ON 
		relatorios.tecnico_entrante_id = pentrante.id
	INNER JOIN
	tecnicos AS tentrante
	ON 
		pentrante.id = tentrante.id
	INNER JOIN
	tecnicos AS tcessante
	ON 
		pcessante.id = tcessante.id
	INNER JOIN
	postosmilitares AS tp_cessante
	ON 
		tcessante.posto_id = tp_cessante.Posto_Id
	INNER JOIN
	postosmilitares AS tp_entrante
	ON 
		tentrante.posto_id = tp_entrante.Posto_Id ;

-- ----------------------------
-- View structure for view_relatorio_all
-- ----------------------------
DROP VIEW IF EXISTS `view_relatorio_all`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_relatorio_all` AS SELECT
    r.id AS id, 
    r.data_criacao AS data_criacao, 
    s.nome AS Situacao, 
    GROUP_CONCAT(DISTINCT o.descricao SEPARATOR '; ') AS descricao, 
    GROUP_CONCAT(DISTINCT e.nome SEPARATOR '; ') AS Meio, 
    SUM(eq.quantidade) AS quantidade, 
    GROUP_CONCAT(DISTINCT eq.status SEPARATOR '; ') AS status, 
    GROUP_CONCAT(DISTINCT eq.localizacao SEPARATOR '; ') AS localizacao, 
    pcessante.nome AS cessante, 
    pentrante.nome AS entrante, 
    tp_cessante.Posto AS posto_cessante, 
    tp_entrante.Posto AS posto_entrante,
    r.estado AS estado
FROM
    relatorios AS r
    JOIN equipamento AS eq ON r.id = eq.relatorios_id
    JOIN observacao AS o ON r.id = o.relatorios_id
    JOIN situacao AS s ON o.situacao_id = s.id
    JOIN equipamentos AS e ON eq.equipamentos_id = e.id
    INNER JOIN pessoa AS pcessante ON r.tecnico_cessante_id = pcessante.id
    INNER JOIN pessoa AS pentrante ON r.tecnico_entrante_id = pentrante.id
    INNER JOIN tecnicos AS tcessante ON pcessante.id = tcessante.id
    INNER JOIN tecnicos AS tentrante ON pentrante.id = tentrante.id
    INNER JOIN postosmilitares AS tp_cessante ON tcessante.posto_id = tp_cessante.Posto_Id
    INNER JOIN postosmilitares AS tp_entrante ON tentrante.posto_id = tp_entrante.Posto_Id
GROUP BY
    r.id, 
    r.data_criacao, 
    s.nome, 
    pcessante.nome, 
    pentrante.nome, 
    tp_cessante.Posto, 
    tp_entrante.Posto, 
    r.estado ;

-- ----------------------------
-- View structure for view_relatorio_grupo
-- ----------------------------
DROP VIEW IF EXISTS `view_relatorio_grupo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_relatorio_grupo` AS SELECT
    relatorios.id AS id, 
    relatorios.data_criacao AS data_criacao, 
    situacao.nome AS Situacao, 
    GROUP_CONCAT(DISTINCT observacao.descricao SEPARATOR ', ') AS Observacoes, 
    GROUP_CONCAT(DISTINCT equipamentos.nome SEPARATOR ', ') AS Meios, 
    GROUP_CONCAT(DISTINCT equipamento.quantidade SEPARATOR ', ') AS Quantidades, 
    GROUP_CONCAT(DISTINCT equipamento.status SEPARATOR ', ') AS Status, 
    GROUP_CONCAT(DISTINCT equipamento.localizacao SEPARATOR ', ') AS Localizacoes, 
    pcessante.nome AS cessante, 
    pentrante.nome AS entrante, 
    tp_cessante.Posto AS posto_cessante, 
    tp_entrante.Posto AS posto_entrante
FROM
    relatorios
JOIN equipamento ON relatorios.id = equipamento.relatorios_id
JOIN observacao ON relatorios.id = observacao.relatorios_id
JOIN situacao ON observacao.situacao_id = situacao.id
JOIN equipamentos ON equipamento.equipamentos_id = equipamentos.id
INNER JOIN pessoa AS pcessante ON relatorios.tecnico_cessante_id = pcessante.id
INNER JOIN pessoa AS pentrante ON relatorios.tecnico_entrante_id = pentrante.id
INNER JOIN tecnicos AS tcessante ON pcessante.id = tcessante.id
INNER JOIN tecnicos AS tentrante ON pentrante.id = tentrante.id
INNER JOIN postosmilitares AS tp_cessante ON tcessante.posto_id = tp_cessante.Posto_Id
INNER JOIN postosmilitares AS tp_entrante ON tentrante.posto_id = tp_entrante.Posto_Id
GROUP BY
    relatorios.id, 
    relatorios.data_criacao, 
    situacao.nome, 
    pcessante.nome, 
    pentrante.nome, 
    tp_cessante.Posto, 
    tp_entrante.Posto ;

-- ----------------------------
-- View structure for view_tecnicos
-- ----------------------------
DROP VIEW IF EXISTS `view_tecnicos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_tecnicos` AS SELECT
	pessoa.imagem, 
	tecnicos.id, 
	pessoa.nome, 
	tecnicos.posto_id, 
	tecnicos.estado, 
	postosmilitares.Posto, 
	postosmilitares.PostoAbrev
FROM
	tecnicos
	INNER JOIN
	pessoa
	ON 
		tecnicos.id = pessoa.id
	INNER JOIN
	postosmilitares
	ON 
		tecnicos.posto_id = postosmilitares.Posto_Id ;

-- ----------------------------
-- View structure for view_user
-- ----------------------------
DROP VIEW IF EXISTS `view_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_user` AS select `usuario`.`id` AS `id`,`usuario`.`pessoa_id` AS `pessoa_id`,`usuario`.`nomeUsuario` AS `nomeUsuario`,`usuario`.`senha` AS `senha`,`usuario`.`tipo_usuario_id` AS `tipo_usuario_id`,`usuario`.`delete_permissao` AS `delete_permissao`,`usuario`.`update_permissao` AS `update_permissao`,`usuario`.`view_permissao` AS `view_permissao`,`usuario`.`create_permissao` AS `create_permissao`,`usuario`.`estado` AS `estado`,`usuario`.`data_criacao` AS `data_criacao`,`usuario`.`data_remocao` AS `data_remocao`,`usuario`.`data_alteracao` AS `data_alteracao`,`pessoa`.`nome` AS `pessoa`,`pessoa`.`imagem` AS `imagem`,`tipousuario`.`nome` AS `tipousuario`,`tipousuario`.`descricao` AS `descricao` from ((`usuario` join `pessoa` on((`usuario`.`pessoa_id` = `pessoa`.`id`))) join `tipousuario` on((`usuario`.`tipo_usuario_id` = `tipousuario`.`id`))) where (`usuario`.`estado` = 1) ;

SET FOREIGN_KEY_CHECKS = 1;
