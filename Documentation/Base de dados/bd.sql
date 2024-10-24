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

 Date: 24/10/2024 23:28:02
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
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pessoa_id`(`pessoa_id` ASC) USING BTREE,
  CONSTRAINT `contato_ibfk_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contato
-- ----------------------------
INSERT INTO `contato` VALUES (1, 3, 'Telefone', '926547598', 1, '2024-09-17 10:57:36', NULL, '2024-09-17 10:57:36');
INSERT INTO `contato` VALUES (2, 4, 'Telefone', '926545852', 1, '2024-09-17 11:48:37', NULL, '2024-09-17 11:48:37');
INSERT INTO `contato` VALUES (3, 6, 'Telefone', '95326354', 1, '2024-09-17 11:50:30', NULL, '2024-09-17 11:50:30');
INSERT INTO `contato` VALUES (4, 7, 'Telefone', '983884455', 1, '2024-09-24 02:32:31', NULL, '2024-09-24 02:32:31');
INSERT INTO `contato` VALUES (5, 8, 'Telefone', '983884455', 1, '2024-09-24 02:47:06', NULL, '2024-09-24 02:47:06');
INSERT INTO `contato` VALUES (6, 8, 'Telefone', '933445566', 1, '2024-09-24 02:47:06', NULL, '2024-09-24 02:47:06');
INSERT INTO `contato` VALUES (7, 9, 'Telefone', '983884455', 1, '2024-09-24 23:22:22', NULL, '2024-09-24 23:22:22');
INSERT INTO `contato` VALUES (8, 9, 'Email', 'aaaaa@gmail.com', 1, '2024-09-24 23:22:23', NULL, '2024-09-24 23:22:23');
INSERT INTO `contato` VALUES (9, 11, 'Telefone', '92658458', 1, '2024-09-25 22:38:17', NULL, '2024-09-25 22:38:17');
INSERT INTO `contato` VALUES (10, 13, 'Telefone', '96855522', 1, '2024-09-25 22:39:22', NULL, '2024-09-25 22:39:22');
INSERT INTO `contato` VALUES (11, 15, 'Telefone', '926547853', 1, '2024-09-25 22:40:11', NULL, '2024-09-25 22:40:11');
INSERT INTO `contato` VALUES (12, 17, 'Telefone', '926547598', 1, '2024-09-25 22:40:55', NULL, '2024-09-25 22:40:55');
INSERT INTO `contato` VALUES (13, 19, 'Telefone', '9568556544', 1, '2024-09-25 22:42:06', NULL, '2024-09-25 22:42:06');
INSERT INTO `contato` VALUES (14, 21, 'Telefone', '95645855', 1, '2024-09-25 22:43:26', NULL, '2024-09-25 22:43:26');
INSERT INTO `contato` VALUES (15, 23, 'Telefone', '95645855', 1, '2024-09-25 22:43:40', NULL, '2024-09-25 22:43:40');
INSERT INTO `contato` VALUES (16, 25, 'Telefone', '95654522', 1, '2024-09-25 22:44:46', NULL, '2024-09-25 22:44:46');
INSERT INTO `contato` VALUES (17, 27, 'Telefone', '9564585', 1, '2024-09-25 22:45:30', NULL, '2024-09-25 22:45:30');
INSERT INTO `contato` VALUES (18, 29, 'Telefone', '92654878', 1, '2024-09-25 22:47:14', NULL, '2024-09-25 22:47:14');
INSERT INTO `contato` VALUES (19, 31, 'Telefone', '5646541656', 1, '2024-09-25 22:48:01', NULL, '2024-09-25 22:48:01');
INSERT INTO `contato` VALUES (20, 33, 'Telefone', '96485498', 1, '2024-09-25 22:49:01', NULL, '2024-09-25 22:49:01');
INSERT INTO `contato` VALUES (21, 35, 'Telefone', '58489798', 1, '2024-09-25 22:50:24', NULL, '2024-09-25 22:50:24');
INSERT INTO `contato` VALUES (22, 37, 'Telefone', '456635445', 1, '2024-09-25 22:51:17', NULL, '2024-09-25 22:51:17');
INSERT INTO `contato` VALUES (23, 39, 'Telefone', '51654168418486', 1, '2024-09-25 22:52:14', NULL, '2024-09-25 22:52:14');
INSERT INTO `contato` VALUES (24, 41, 'Telefone', '9265487888', 1, '2024-09-26 19:43:22', NULL, '2024-09-26 19:43:22');
INSERT INTO `contato` VALUES (25, 43, 'Telefone', '954626415641', 1, '2024-09-26 19:44:54', NULL, '2024-09-26 19:44:54');
INSERT INTO `contato` VALUES (26, 45, 'Telefone', '956545545', 1, '2024-09-26 19:46:01', NULL, '2024-09-26 19:46:01');
INSERT INTO `contato` VALUES (27, 48, 'Telefone', '92654759867', 1, '2024-09-27 12:56:38', NULL, '2024-09-27 12:56:38');
INSERT INTO `contato` VALUES (28, 49, 'Telefone', '983884455', 1, '2024-09-27 16:07:55', NULL, '2024-09-27 16:07:55');
INSERT INTO `contato` VALUES (29, 50, 'Telefone', '983884455', 1, '2024-09-27 16:19:20', NULL, '2024-09-27 16:19:20');
INSERT INTO `contato` VALUES (30, 51, 'Telefone', '983884455', 1, '2024-09-27 16:22:31', NULL, '2024-09-27 16:22:31');
INSERT INTO `contato` VALUES (31, 52, 'Telefone', '56456353', 1, '2024-09-29 00:47:34', NULL, '2024-09-29 00:47:34');
INSERT INTO `contato` VALUES (32, 55, 'Telefone', '1111111', 1, '2024-09-30 01:07:28', NULL, '2024-09-30 01:07:28');

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
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endereco_id` int NULL DEFAULT NULL,
  `municipio_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_pessoa_endereco1_idx`(`endereco_id` ASC) USING BTREE,
  INDEX `fk_pessoa_municipio1_idx`(`municipio_id` ASC) USING BTREE,
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pessoa_ibfk_2` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pessoa
-- ----------------------------
INSERT INTO `pessoa` VALUES (1, 'Bruno Somavie ACVF', '2020-12-29', 'Masculino', '1726562225334.png', 1, '2024-09-17 09:37:05', NULL, '2024-10-01 09:50:59', 1, 1);
INSERT INTO `pessoa` VALUES (2, 'Paulo Almeida', '1989-02-07', 'Masculino', '1726566254192.png', 1, '2024-09-17 10:44:14', NULL, '2024-09-27 00:04:01', 1, 1);
INSERT INTO `pessoa` VALUES (3, 'Almeida Pereira Torres', '2024-09-03', 'Masculino', '1726567056689.png', 1, '2024-09-17 10:57:36', NULL, '2024-09-27 00:04:01', 2, 1);
INSERT INTO `pessoa` VALUES (4, 'Daniel vaz', '2024-09-19', 'Masculino', NULL, 1, '2024-09-17 11:48:37', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (5, 'Filipe Mbassi', '1997-01-06', 'Masculino', '1726570230408.png', 1, '2024-09-17 11:50:30', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (6, 'Pedro VAZ', '2009-12-29', 'Masculino', NULL, 1, '2024-09-17 11:50:30', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (7, 'Ivone Calelesa Antonio', '1998-05-21', 'Masculino', '1727141550875.png', 1, '2024-09-24 02:32:30', NULL, '2024-09-27 00:04:01', 3, 1);
INSERT INTO `pessoa` VALUES (8, 'Sebastião Lisboa', '1997-04-19', 'Masculino', '1727142425750.png', 1, '2024-09-24 02:47:05', NULL, '2024-09-27 00:04:01', 4, 1);
INSERT INTO `pessoa` VALUES (9, 'Ivone Lisboa', '1989-09-22', 'Feminino', '1727216542801.png', 1, '2024-09-24 23:22:22', NULL, '2024-09-27 00:04:01', 5, 1);
INSERT INTO `pessoa` VALUES (10, 'Pedro Filipe Mukenga', '2024-09-19', 'Masculino', '1727300297769.jpg', 1, '2024-09-25 22:38:17', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (11, 'Filipe Mukenga', '2024-09-23', 'Masculino', NULL, 1, '2024-09-25 22:38:17', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (12, 'Osvaldo Japao', '2024-09-18', 'Masculino', '1727300362200.png', 1, '2024-09-25 22:39:22', NULL, '2024-10-09 22:46:26', 2, 1);
INSERT INTO `pessoa` VALUES (13, 'Spriano Japão', '2024-09-26', 'Masculino', NULL, 1, '2024-09-25 22:39:22', NULL, '2024-10-09 22:44:46', 2, 1);
INSERT INTO `pessoa` VALUES (14, 'Carlos Felix Milagre', '2024-09-18', 'Masculino', '1727300411330.png', 1, '2024-09-25 22:40:11', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (15, 'Frliciano Milagre', '2024-09-20', 'Masculino', NULL, 1, '2024-09-25 22:40:11', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (16, 'Marlene Darlynd', '2024-09-20', 'Masculino', '1727300454904.png', 1, '2024-09-25 22:40:54', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (17, 'Marlene Sara Darling', '2024-10-11', 'Masculino', NULL, 1, '2024-09-25 22:40:55', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (18, 'Kamate Mateus', '2024-10-05', 'Masculino', '1727300526464.png', 1, '2024-09-25 22:42:06', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (19, 'OSvaldo Mateus', '2024-09-26', 'Masculino', NULL, 1, '2024-09-25 22:42:06', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (20, 'Serafim Mendes', '2024-09-21', 'Masculino', NULL, 1, '2024-09-25 22:43:26', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (21, 'Sá Mendes', '2024-09-04', 'Feminino', NULL, 1, '2024-09-25 22:43:26', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (22, 'Serafim Mendes', '2024-09-21', 'Masculino', NULL, 1, '2024-09-25 22:43:40', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (23, 'Sá Mendes', '2024-09-04', 'Feminino', NULL, 1, '2024-09-25 22:43:40', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (24, 'Simão Afonso', '2024-09-10', 'Masculino', '1727300686242.jpg', 1, '2024-09-25 22:44:46', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (25, 'Afonso Afonso', '2024-09-21', 'Masculino', NULL, 1, '2024-09-25 22:44:46', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (26, 'Famer Gamba', '2024-09-14', 'Masculino', '1727300730662.jpg', 1, '2024-09-25 22:45:30', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (27, 'Mateus Gamba', '2024-09-30', 'Masculino', NULL, 1, '2024-09-25 22:45:30', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (28, 'Simão Catembo', '2024-09-27', 'Masculino', '1727300834155.png', 1, '2024-09-25 22:47:14', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (29, 'Simao Catembo', '2024-09-26', 'Masculino', NULL, 1, '2024-09-25 22:47:14', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (30, 'Oseias André', '2024-09-08', 'Masculino', '1727300881280.png', 1, '2024-09-25 22:48:01', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (31, 'Pedro André', '2024-09-28', 'Masculino', NULL, 1, '2024-09-25 22:48:01', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (32, 'Jonas Dos Santos', '2024-09-19', 'Masculino', '1727300941337.png', 1, '2024-09-25 22:49:01', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (33, 'Diana dos Santos', '2024-09-25', 'Feminino', NULL, 1, '2024-09-25 22:49:01', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (34, 'José Alvaro', '2024-09-20', 'Masculino', '1727301024477.png', 1, '2024-09-25 22:50:24', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (35, 'Pdro Alvaro', '2024-09-24', 'Masculino', NULL, 1, '2024-09-25 22:50:24', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (36, 'Orvanda Neto', '2024-09-04', 'Feminino', '1727301077071.png', 1, '2024-09-25 22:51:17', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (37, 'Famer Neto', '2024-09-07', 'Masculino', NULL, 1, '2024-09-25 22:51:17', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (38, 'Omar André', '2024-09-03', 'Masculino', '1727301134457.png', 1, '2024-09-25 22:52:14', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (39, 'Catembo André', '2024-09-22', 'Masculino', NULL, 1, '2024-09-25 22:52:14', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (40, 'Tiago Arão', '2024-09-19', 'Masculino', '1727376202832.png', 1, '2024-09-26 19:43:22', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (41, 'Simao Arão', '2024-09-16', 'Masculino', NULL, 1, '2024-09-26 19:43:22', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (42, 'Arieth Ndonfula', '2024-09-26', 'Feminino', '1727376294332.png', 1, '2024-09-26 19:44:54', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (43, 'Vania Ndofula', '1999-02-22', 'Masculino', NULL, 1, '2024-09-26 19:44:54', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (44, 'Sofia Pedro', '1980-02-24', 'Feminino', '1727376361333.png', 1, '2024-09-26 19:46:01', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (45, 'Amadeu Pedro', '1989-02-02', 'Masculino', NULL, 1, '2024-09-26 19:46:01', NULL, '2024-09-27 00:04:01', NULL, 1);
INSERT INTO `pessoa` VALUES (46, 'Orvanda', '2024-09-19', 'Feminino', '1727392217670.png', 1, '2024-09-27 00:10:17', NULL, '2024-09-27 00:35:06', 1, 2);
INSERT INTO `pessoa` VALUES (47, 'Sousa Neto', '2024-09-26', 'Masculino', '1727392581646.png', 1, '2024-09-27 00:16:21', NULL, '2024-09-27 00:34:02', 2, 7);
INSERT INTO `pessoa` VALUES (48, 'Maria Lisboa', '1995-05-05', 'Feminino', '1727438197934.jpg', 1, '2024-09-27 12:56:37', NULL, '2024-09-27 12:56:37', 8, 7);
INSERT INTO `pessoa` VALUES (49, 'Sebas Anto Dias', '2020-12-12', 'Masculino', '1727449675116.jpg', 1, '2024-09-27 16:07:55', NULL, '2024-09-27 16:07:55', 9, 1);
INSERT INTO `pessoa` VALUES (50, 'Elisio Jorge Claudio Neto', '1990-12-12', 'Masculino', '1727450360383.jpg', 1, '2024-09-27 16:19:20', NULL, '2024-09-27 16:19:20', 10, 1);
INSERT INTO `pessoa` VALUES (51, 'Sebastião Lisboa', '2024-08-28', 'Masculino', '1727450551154.jpg', 1, '2024-09-27 16:22:31', NULL, '2024-09-27 16:22:31', 11, 1);
INSERT INTO `pessoa` VALUES (52, 'Ricardo Lopes', '2024-09-24', 'Masculino', '1727567254398.png', 1, '2024-09-29 00:47:34', NULL, '2024-09-29 00:47:34', 12, 1);
INSERT INTO `pessoa` VALUES (53, 'Mufema Inês', '1221-02-22', 'Feminino', '1727654099196.png', 1, '2024-09-30 00:54:59', NULL, '2024-09-30 00:58:37', 2, 2);
INSERT INTO `pessoa` VALUES (54, 'gfhfgyjh', '2024-09-14', 'Masculino', '1727654127681.png', 1, '2024-09-30 00:55:27', NULL, '2024-09-30 00:55:27', 3, 4);
INSERT INTO `pessoa` VALUES (55, 'MArilha Mendonça', '1111-02-11', 'Feminino', '1727654848632.png', 1, '2024-09-30 01:07:28', NULL, '2024-09-30 01:07:28', 15, 1);
INSERT INTO `pessoa` VALUES (56, 'ASfgjkn skfnkldnsl', '1998-06-10', 'Masculino', '1727690138448.jpg', 1, '2024-09-30 10:55:38', NULL, '2024-09-30 10:55:38', 6, 2);
INSERT INTO `pessoa` VALUES (57, 'Maria Lisboa Filha', '2003-09-12', 'Feminino', '1727757279588.jpg', 1, '2024-10-01 05:34:39', NULL, '2024-10-01 05:34:39', 16, 10);
INSERT INTO `pessoa` VALUES (58, 'Maria Lisboa Filha', '2012-05-15', 'Feminino', '1727757705276.jpg', 1, '2024-10-01 05:41:45', NULL, '2024-10-01 05:41:45', 16, 10);
INSERT INTO `pessoa` VALUES (59, 'Jerusa Siladas', '2017-04-04', 'Feminino', '1727758384541.webp', 1, '2024-10-01 05:53:04', NULL, '2024-10-01 05:53:04', 17, 14);

-- ----------------------------
-- Table structure for posto
-- ----------------------------
DROP TABLE IF EXISTS `posto`;
CREATE TABLE `posto`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sigla` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posto
-- ----------------------------
INSERT INTO `posto` VALUES (1, 'Tenente', 'TNT', 1, '2024-10-20 10:45:13', '2024-10-20 10:45:13', NULL);
INSERT INTO `posto` VALUES (2, 'Civil', 'CV', 1, '2024-10-20 10:45:24', '2024-10-20 10:45:32', NULL);

-- ----------------------------
-- Table structure for provincia
-- ----------------------------
DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `data_criacao_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_relatorios_pessoa1_idx`(`tecnico_cessante_id` ASC) USING BTREE,
  INDEX `fk_relatorios_pessoa2_idx`(`tecnico_entrante_id` ASC) USING BTREE,
  CONSTRAINT `fk_relatorios_pessoa1` FOREIGN KEY (`tecnico_cessante_id`) REFERENCES `pessoa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_relatorios_pessoa2` FOREIGN KEY (`tecnico_entrante_id`) REFERENCES `pessoa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of relatorios
-- ----------------------------
INSERT INTO `relatorios` VALUES (1, 0, 0, '2024-10-20', 'os sistemas foram todos assegurdos duarante as minhas 24 horas', 1, '2024-10-20 11:59:40', '2024-10-20 12:02:23', NULL);
INSERT INTO `relatorios` VALUES (2, 0, 0, '2024-10-20', 'tudo funcionouu plenamente durante as 24 horas', 1, '2024-10-20 12:07:51', '2024-10-20 12:15:10', NULL);
INSERT INTO `relatorios` VALUES (3, 0, 0, '2024-10-20', 'hjkljkl', 1, '2024-10-20 15:52:11', '2024-10-20 17:34:14', NULL);
INSERT INTO `relatorios` VALUES (4, 0, 0, NULL, NULL, 1, '2024-10-20 17:34:42', '2024-10-20 17:34:42', NULL);
INSERT INTO `relatorios` VALUES (5, 0, 0, '2024-10-20', 'tudo se ebcontra em pleno funcionamento', 1, '2024-10-20 17:34:43', '2024-10-20 18:12:48', NULL);
INSERT INTO `relatorios` VALUES (6, 0, 0, '2024-10-20', 'Tudo esta bem', 1, '2024-10-20 18:13:05', '2024-10-20 18:22:25', NULL);
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
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `posto_id` int NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  INDEX `fk_tecnicos_posto1_idx`(`posto_id` ASC) USING BTREE,
  INDEX `fk_tecnicos_pessoa1_idx`(`id` ASC) USING BTREE,
  CONSTRAINT `fk_tecnicos_pessoa1` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tecnicos_posto1` FOREIGN KEY (`posto_id`) REFERENCES `posto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tecnicos
-- ----------------------------
INSERT INTO `tecnicos` VALUES (0, 1, 1, '2024-10-20 10:45:54', '2024-10-20 10:45:54', NULL);
INSERT INTO `tecnicos` VALUES (0, 2, 1, '2024-10-20 10:46:17', '2024-10-20 10:46:17', NULL);

-- ----------------------------
-- Table structure for tipousuario
-- ----------------------------
DROP TABLE IF EXISTS `tipousuario`;
CREATE TABLE `tipousuario`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
INSERT INTO `usuario` VALUES (3, 3, 'APT', '$2a$10$x9GbJzEc.mDCrU8mTuwCB.CFt76bWVooEJkCOHEbREBwdmMP52G0O', 2, 1, 1, 1, 1, 1, '2024-10-03 20:17:31', NULL, '2024-10-03 20:17:31');
INSERT INTO `usuario` VALUES (4, 53, 'ines', '$2a$10$O5cMAqt6WNIIOnXMvUiph.MAokVefN5VQZRU7nXjtJmp3XmuSuoZS', 3, 1, 1, 1, 1, 1, '2024-10-09 07:06:22', NULL, '2024-10-09 07:06:22');

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
-- View structure for view_pessoas
-- ----------------------------
DROP VIEW IF EXISTS `view_pessoas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_pessoas` AS select `pessoa`.`id` AS `id`,`pessoa`.`nome` AS `nome`,concat(`provincia`.`nome`,', ',`municipio`.`nome`,', ',`endereco`.`bairro`,', ',`endereco`.`numero_casa`) AS `endereco_completo`,`pessoa`.`genero` AS `genero`,`pessoa`.`data_nascimento` AS `data_nascimento`,`pessoa`.`endereco_id` AS `endereco_id`,`pessoa`.`imagem` AS `imagem`,`naturalidade`.`nome` AS `naturalidade` from ((((`pessoa` join `endereco` on((`pessoa`.`endereco_id` = `endereco`.`id`))) join `municipio` on((`endereco`.`municipio_id` = `municipio`.`id`))) join `provincia` on((`municipio`.`provincia_id` = `provincia`.`id`))) join `municipio` `naturalidade` on((`pessoa`.`municipio_id` = `naturalidade`.`id`)));

-- ----------------------------
-- View structure for view_relatorio
-- ----------------------------
DROP VIEW IF EXISTS `view_relatorio`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_relatorio` AS select `entrante`.`nome` AS `entrante`,`cessante`.`nome` AS `cessante`,`relatorios`.`id` AS `id`,`relatorios`.`tecnico_cessante_id` AS `tecnico_cessante_id`,`relatorios`.`tecnico_entrante_id` AS `tecnico_entrante_id`,`relatorios`.`data_criacao` AS `data_criacao`,`relatorios`.`observacoes_finais` AS `observacoes_finais`,`relatorios`.`estado` AS `estado` from ((`relatorios` join `tecnicos` `entrante` on((`relatorios`.`tecnico_cessante_id` = `entrante`.`id`))) join `tecnicos` `cessante` on((`relatorios`.`tecnico_entrante_id` = `cessante`.`id`))) order by `relatorios`.`id` desc;

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

-- ----------------------------
-- View structure for view_user
-- ----------------------------
DROP VIEW IF EXISTS `view_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_user` AS select `usuario`.`id` AS `id`,`usuario`.`pessoa_id` AS `pessoa_id`,`usuario`.`nomeUsuario` AS `nomeUsuario`,`usuario`.`senha` AS `senha`,`usuario`.`tipo_usuario_id` AS `tipo_usuario_id`,`usuario`.`delete_permissao` AS `delete_permissao`,`usuario`.`update_permissao` AS `update_permissao`,`usuario`.`view_permissao` AS `view_permissao`,`usuario`.`create_permissao` AS `create_permissao`,`usuario`.`estado` AS `estado`,`usuario`.`data_criacao` AS `data_criacao`,`usuario`.`data_remocao` AS `data_remocao`,`usuario`.`data_alteracao` AS `data_alteracao`,`pessoa`.`nome` AS `pessoa`,`pessoa`.`imagem` AS `imagem`,`tipousuario`.`nome` AS `tipousuario`,`tipousuario`.`descricao` AS `descricao` from ((`usuario` join `pessoa` on((`usuario`.`pessoa_id` = `pessoa`.`id`))) join `tipousuario` on((`usuario`.`tipo_usuario_id` = `tipousuario`.`id`))) where (`usuario`.`estado` = 1);

SET FOREIGN_KEY_CHECKS = 1;
