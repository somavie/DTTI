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

 Date: 19/02/2025 11:42:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for causas
-- ----------------------------
DROP TABLE IF EXISTS `causas`;
CREATE TABLE `causas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of causas
-- ----------------------------
INSERT INTO `causas` VALUES (1, 'Queda de energia', 1, '2024-11-18 11:55:22', '2024-11-18 11:55:22', NULL);
INSERT INTO `causas` VALUES (2, 'Queda do Sinal de Internet', 1, '2024-11-18 11:55:55', '2024-11-18 11:55:55', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contato
-- ----------------------------
INSERT INTO `contato` VALUES (1, 3, 'Telefone', '926547598', 1, '2024-09-17 10:57:36', NULL, '2024-09-17 10:57:36');
INSERT INTO `contato` VALUES (33, 62, 'Telefone', '98766544554', 1, '2024-10-26 23:01:24', NULL, '2024-10-26 23:01:24');
INSERT INTO `contato` VALUES (34, 63, 'Telefone', '987665445', 1, '2024-10-26 23:03:29', NULL, '2024-10-26 23:03:29');
INSERT INTO `contato` VALUES (35, 64, 'Telefone', '947702465', 1, '2024-10-30 12:55:33', NULL, '2024-10-30 12:55:33');

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
-- Table structure for entidade_grupo
-- ----------------------------
DROP TABLE IF EXISTS `entidade_grupo`;
CREATE TABLE `entidade_grupo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entidade_id` int NOT NULL,
  `grupo_id` int NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `entidade_id`(`entidade_id` ASC) USING BTREE,
  INDEX `grupo_id`(`grupo_id` ASC) USING BTREE,
  CONSTRAINT `entidade_grupo_ibfk_1` FOREIGN KEY (`entidade_id`) REFERENCES `entidades` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `entidade_grupo_ibfk_2` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of entidade_grupo
-- ----------------------------
INSERT INTO `entidade_grupo` VALUES (1, 2, 1, 1, '2024-12-20 10:40:55', '2024-12-20 10:40:55', NULL);
INSERT INTO `entidade_grupo` VALUES (2, 4, 1, 1, '2024-12-20 10:41:01', '2024-12-20 10:41:01', NULL);
INSERT INTO `entidade_grupo` VALUES (3, 3, 1, 1, '2024-12-20 10:41:10', '2024-12-20 10:41:10', NULL);
INSERT INTO `entidade_grupo` VALUES (4, 5, 1, 1, '2024-12-20 10:41:21', '2024-12-20 10:41:21', NULL);
INSERT INTO `entidade_grupo` VALUES (5, 6, 1, 1, '2024-12-20 10:41:35', '2024-12-20 10:41:35', NULL);
INSERT INTO `entidade_grupo` VALUES (6, 53, 2, 1, '2024-12-23 15:05:22', '2024-12-23 15:05:22', NULL);
INSERT INTO `entidade_grupo` VALUES (7, 56, 2, 1, '2024-12-23 15:05:27', '2024-12-23 15:05:27', NULL);
INSERT INTO `entidade_grupo` VALUES (8, 57, 2, 1, '2024-12-23 15:05:32', '2024-12-23 15:05:32', NULL);
INSERT INTO `entidade_grupo` VALUES (9, 59, 2, 0, '2024-12-26 12:13:57', '2024-12-26 12:14:07', '2024-12-26 12:14:07');
INSERT INTO `entidade_grupo` VALUES (10, 42, 1, 0, '2025-01-06 13:56:56', '2025-01-06 13:57:03', '2025-01-06 13:57:03');

-- ----------------------------
-- Table structure for entidade_radio
-- ----------------------------
DROP TABLE IF EXISTS `entidade_radio`;
CREATE TABLE `entidade_radio`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entidade_id` int NOT NULL,
  `radio_id` int NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `entidade_id`(`entidade_id` ASC) USING BTREE,
  INDEX `radio_id`(`radio_id` ASC) USING BTREE,
  CONSTRAINT `entidade_radio_ibfk_1` FOREIGN KEY (`entidade_id`) REFERENCES `entidades` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `entidade_radio_ibfk_2` FOREIGN KEY (`radio_id`) REFERENCES `radios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of entidade_radio
-- ----------------------------
INSERT INTO `entidade_radio` VALUES (1, 2, 13, 0, '2024-12-20 11:07:03', '2025-01-21 08:42:41', '2025-01-21 08:42:41');
INSERT INTO `entidade_radio` VALUES (2, 2, 13, 0, '2024-12-20 11:38:27', '2025-01-21 08:42:41', '2025-01-21 08:42:41');
INSERT INTO `entidade_radio` VALUES (3, 2, 13, 0, '2024-12-20 11:50:53', '2025-01-21 08:42:41', '2025-01-21 08:42:41');
INSERT INTO `entidade_radio` VALUES (4, 2, 13, 0, '2024-12-20 11:57:37', '2025-01-21 08:42:41', '2025-01-21 08:42:41');
INSERT INTO `entidade_radio` VALUES (5, 4, 25, 1, '2024-12-20 11:57:59', '2024-12-20 11:57:59', NULL);
INSERT INTO `entidade_radio` VALUES (6, 3, 56, 1, '2024-12-20 12:04:00', '2024-12-20 12:04:00', NULL);
INSERT INTO `entidade_radio` VALUES (7, 5, 61, 1, '2024-12-20 12:15:26', '2024-12-20 12:15:26', NULL);
INSERT INTO `entidade_radio` VALUES (8, 6, 65, 1, '2024-12-20 12:15:33', '2024-12-20 12:15:33', NULL);
INSERT INTO `entidade_radio` VALUES (9, 53, 74, 1, '2024-12-23 15:04:40', '2024-12-23 15:04:40', NULL);
INSERT INTO `entidade_radio` VALUES (10, 56, 93, 1, '2024-12-23 15:04:54', '2024-12-23 15:04:54', NULL);
INSERT INTO `entidade_radio` VALUES (11, 57, 15, 1, '2024-12-23 15:05:04', '2024-12-23 15:05:04', NULL);
INSERT INTO `entidade_radio` VALUES (12, 1, 66, 1, '2024-12-26 12:13:08', '2024-12-26 12:13:08', NULL);
INSERT INTO `entidade_radio` VALUES (13, 2, 13, 0, '2025-01-20 09:26:30', '2025-01-21 08:42:41', '2025-01-21 08:42:41');
INSERT INTO `entidade_radio` VALUES (14, 2, 13, 0, '2025-01-21 08:42:23', '2025-01-21 08:42:41', '2025-01-21 08:42:41');
INSERT INTO `entidade_radio` VALUES (15, 2, 13, 1, '2025-01-21 08:42:41', '2025-01-21 08:42:41', NULL);

-- ----------------------------
-- Table structure for entidades
-- ----------------------------
DROP TABLE IF EXISTS `entidades`;
CREATE TABLE `entidades`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grupo_id` int NULL DEFAULT NULL,
  `codname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `indicativo` int NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `grupo_id`(`grupo_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of entidades
-- ----------------------------
INSERT INTO `entidades` VALUES (1, 'Chefe do SISM', NULL, NULL, 0, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (2, 'Chefe Adj do SISM', NULL, NULL, 0, 1, '2024-12-15 23:07:49', '2024-12-17 10:10:17', NULL);
INSERT INTO `entidades` VALUES (3, 'Inspector do SISM', NULL, NULL, 1, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (4, 'Conselheiro', NULL, NULL, 2, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (5, 'Chefe de Gabinete do Chefe do SISM', NULL, NULL, 3, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (6, 'Chefe Direcção de Coordenação Operacional', NULL, NULL, 4, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (7, 'Chef. Dir. Intel. Militar. Estratégica', NULL, NULL, 5, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (8, 'Chef. Dir. Contra Inteligência Militar', NULL, NULL, 6, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (9, 'Chef. Inteligência Militar', NULL, NULL, 7, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (10, 'Chefe Direção MININT e Polícia Nacional', NULL, NULL, 9, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (11, 'Director do ISUD', NULL, NULL, 10, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (12, 'Cmdte da BATOP', NULL, NULL, 11, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (13, 'Cmdte do RDE', NULL, NULL, 12, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (14, 'Chefe Gabinete Jurídico', NULL, NULL, 13, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (15, 'Chef. Dir. Informação e Análise', NULL, NULL, 14, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (16, 'Chef. Dir. Telec. Tecn. de Informação', NULL, NULL, 15, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (17, 'Chef. Dir. Investigação Operativa', NULL, NULL, 16, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (18, 'Chef. Dir. Segurança Electrônica', NULL, NULL, 17, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (19, 'Chef. Dir. Segurança e Protecção', NULL, NULL, 18, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (20, 'Chefe Gabinete de Comunicação Institucional', NULL, NULL, 19, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (21, 'Chefe Adj. do Gabinete do Chefe do SISM', NULL, NULL, 20, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (22, 'Chefe do GEPE', NULL, NULL, 21, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (23, 'Chef. Dir. Recursos Humanos', NULL, NULL, 22, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (24, 'Chef. Dir. Administração e Finanças', NULL, NULL, 23, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (25, 'Chef. Dir. Apoio Tecnico-Material', NULL, NULL, 24, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (26, 'Chefe Adj. Dir. de Recursos Humanos', NULL, NULL, 25, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (27, 'Chef. do Centro de Formação de Especialistas', NULL, NULL, 26, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (28, 'Chefe de Secretaria Administrativa', NULL, NULL, 27, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (29, 'Oficial de Campo do Chefe do SISM', NULL, NULL, 28, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (30, 'Conselheiro', NULL, NULL, 29, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (31, 'Chefe da DATO', NULL, NULL, 30, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (32, 'TG Tony Catembo', NULL, NULL, 31, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (33, 'Chefe da DIC', NULL, NULL, 32, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (34, 'Chefe Adjunto da DPIME', NULL, NULL, 33, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (35, 'Chefe da DIA da DPIME', NULL, NULL, 34, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (36, 'Chefe Adjunto DIC', NULL, NULL, 35, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (37, 'Chefe Adjunto GEP', NULL, NULL, 36, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (38, 'Chefe Adjunto DATO', NULL, NULL, 37, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (39, 'Chefe Adjunto DAFSG', NULL, NULL, 38, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (40, 'Chefe R.Transportes', NULL, NULL, 39, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (41, 'VICE ALMIRANTE DIMOXI', NULL, NULL, 40, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (42, 'BRIGADEIRO MBUILA', NULL, NULL, 41, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (43, 'BRIGADEIRO HENRIQUES', NULL, NULL, 43, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (44, 'BRIGADEIRO QUINANGA', NULL, NULL, 44, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (45, 'CHEFE DA ESCOLTA DO GENERAL CHEFE', NULL, NULL, 45, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (46, 'MISSÃO MILITAR MOÇAMBIQUE', NULL, NULL, 1, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (47, 'MISSÃO MILITAR MOÇAMBIQUE', NULL, NULL, 2, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (48, 'CHEFE DEPART. PLANEAM. ORG/DTTI', NULL, NULL, 0, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (49, 'CHEFE DEPART. TECNOL. INFORM/DTTI', NULL, NULL, 0, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (50, 'Chefe da Força Tarefa', NULL, NULL, 0, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (51, 'OFICIAL DIA SISM', NULL, NULL, 1, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (52, 'Base Fixa R.Transportes', NULL, NULL, 5, 1, '2024-12-15 23:07:49', '2024-12-15 23:07:49', NULL);
INSERT INTO `entidades` VALUES (53, 'Chef. Adj da DIO', NULL, NULL, 1, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (54, 'Chefe de Departamento', NULL, NULL, 2, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (55, 'Chefe de Departamento', NULL, NULL, 3, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (56, 'Chef. DIO Província de Cabinda', NULL, NULL, 4, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (57, 'Chef. DIO Província de Benguela', NULL, NULL, 5, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (58, 'Chef. DIO Província do Moxico', NULL, NULL, 6, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (59, 'Chef. DIO Província do Huambo', NULL, NULL, 7, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (60, 'Chef. DIO Província da Lunda Norte', NULL, NULL, 8, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (61, 'Chef. DIO Província da Lunda Sul', NULL, NULL, 9, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (62, 'Chef. DIO Província do Bié', NULL, NULL, 10, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (63, 'Chef. DIO Província do Cuanza Norte', NULL, NULL, 11, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (64, 'Chef. DIO Província do Cuanza Sul', NULL, NULL, 12, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (65, 'Chef. DIO Província do Uige', NULL, NULL, 13, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (66, 'Chef. DIO Província de Malange', NULL, NULL, 14, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (67, 'Chef. DIO Província do Bengo', NULL, NULL, 15, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (68, 'Chef. DIO Província do K. Kubango', NULL, NULL, 16, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (69, 'Chef. DIO Província da Huila', NULL, NULL, 17, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (70, 'Chef. DIO Província do Namibe', NULL, NULL, 18, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (71, 'Chef. DIO Província do Cunene', NULL, NULL, 19, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (72, 'Chef. DIO Província de Luanda', NULL, NULL, 20, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (73, 'Chef. DIO Província do Zaire', NULL, NULL, 21, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (74, 'Coordenador Nacional', NULL, NULL, 22, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (75, 'Coordenador Adjunto Nacional', NULL, NULL, 23, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (76, 'Coordenador Provincial de Cabinda', NULL, NULL, 24, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (77, 'Coordenador Provincial de Benguela', NULL, NULL, 25, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (78, 'Coordenador Provincial do Moxico', NULL, NULL, 26, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (79, 'Coordenador Provincial do Huambo', NULL, NULL, 27, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (80, 'Coordenador Provincial Lunda Norte', NULL, NULL, 28, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (81, 'Coordenador Provincial Lunda Sul', NULL, NULL, 29, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (82, 'Coordenador Provincial do Bié', NULL, NULL, 30, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (83, 'Coordenador Provincial Cuanza Norte', NULL, NULL, 31, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (84, 'Coordenador Provincial Cuanza Sul', NULL, NULL, 32, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (85, 'Coordenador Provincial do Uige', NULL, NULL, 33, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (86, 'Coordenador Provincial de Malange', NULL, NULL, 34, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (87, 'Coordenador Provincial do Bengo', NULL, NULL, 35, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (88, 'Coordenador Provincial K. Kubango', NULL, NULL, 36, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (89, 'Coordenador Provincial da Huila', NULL, NULL, 37, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (90, 'Coordenador Provincial do Namibe', NULL, NULL, 38, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (91, 'Coordenador Provincial do Cunene', NULL, NULL, 39, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (92, 'Coordenador Provincial de Luanda', NULL, NULL, 40, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (93, 'Coordenador Provincial do Zaire', NULL, NULL, 41, 1, '2024-12-15 23:11:45', '2024-12-15 23:11:45', NULL);
INSERT INTO `entidades` VALUES (94, '2º Cmdte da BATOP', NULL, NULL, 1, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (95, 'Chef. E. Maior BATOP', NULL, NULL, 2, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (96, 'Cmdtes da URATOP CABINDA', NULL, NULL, 3, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (97, 'Cmdtes da URATOP SAURIMO', NULL, NULL, 4, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (98, 'Cmdtes das URATOPs', NULL, NULL, 5, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (99, 'Cmdtes da URATOP HUAMBO', NULL, NULL, 6, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (100, 'Cmdtes da URATOP HUILA', NULL, NULL, 7, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (101, 'Segundo Comandante do RDE', NULL, NULL, 8, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (102, 'Chefe do Estado Maior RDE', NULL, NULL, 9, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (103, 'Chefe Operações RDE', NULL, NULL, 10, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (104, 'Oficial Guarda Superior BATOP', NULL, NULL, 11, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (105, 'Oficial de Transmissões BATOP', NULL, NULL, 12, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (106, 'Chefe de Operações BATOP', NULL, NULL, 13, 1, '2024-12-15 23:16:24', '2024-12-15 23:16:24', NULL);
INSERT INTO `entidades` VALUES (107, 'URATOP Cabinda', NULL, NULL, 1, 1, '2024-12-15 23:17:11', '2024-12-15 23:17:11', NULL);
INSERT INTO `entidades` VALUES (108, 'URATOP Saurimo', NULL, NULL, 2, 1, '2024-12-15 23:17:11', '2024-12-15 23:17:11', NULL);
INSERT INTO `entidades` VALUES (109, 'URATOP Huambo', NULL, NULL, 3, 1, '2024-12-15 23:17:11', '2024-12-15 23:17:11', NULL);
INSERT INTO `entidades` VALUES (110, 'URATOP Lubango', NULL, NULL, 4, 1, '2024-12-15 23:17:11', '2024-12-15 23:17:11', NULL);
INSERT INTO `entidades` VALUES (111, 'Chef. Adj. DPCIM', NULL, NULL, 1, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (112, 'Chefe da CIM R.M. Luanda', NULL, NULL, 2, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (113, 'Dir. Organização Informação', NULL, NULL, 3, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (114, 'Dir. Operativa', NULL, NULL, 4, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (115, 'Chef. CIM EXE', NULL, NULL, 5, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (116, 'Chef. CIM FAN', NULL, NULL, 6, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (117, 'Chef. CIM MGA', NULL, NULL, 7, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (118, 'Chef. U. APOIO', NULL, NULL, 8, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (119, 'Chef. ESCOLA DE FORÇAS ESPECIAIS', NULL, NULL, 9, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (120, 'Chef. ESG', NULL, NULL, 10, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (121, 'Chef. ISTEM', NULL, NULL, 11, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (122, 'Chef. Campo Militar do Grafanil', NULL, NULL, 12, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (123, 'Chef. BATOP', NULL, NULL, 13, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (124, 'Chef. RDE', NULL, NULL, 14, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (125, 'Chef. BCA 1', NULL, NULL, 15, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (126, 'Chef. BCA 2', NULL, NULL, 16, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (127, 'Chef. CIM BCA 3 NAMIBE', NULL, NULL, 17, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (128, 'Chef. BRIGADA DE FORÇAS ESPECIAIS', NULL, NULL, 18, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (129, 'Chef. DIRECÇÃO PRINCIPAL DE LOISTICA', NULL, NULL, 19, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (130, 'Chef. HOSPITAL MILITAR', NULL, NULL, 20, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (131, 'Chef. DIR SAUDE', NULL, NULL, 21, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (132, 'Chef. CIM do ISUD', NULL, NULL, 22, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);
INSERT INTO `entidades` VALUES (133, 'OFICIAL DIA DCIM', NULL, NULL, 2, 1, '2024-12-15 23:19:16', '2024-12-15 23:19:16', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `equipamento` VALUES (120, 1, 21, 5, 'Mau', 'hbvnbvbjn', NULL, 1, '2024-10-27 22:49:37', '2024-10-27 22:49:37', NULL);
INSERT INTO `equipamento` VALUES (121, 1, 22, 45, 'Manutenção', 'cvnhvgnvbn', NULL, 1, '2024-10-27 22:51:05', '2024-10-27 22:51:05', NULL);
INSERT INTO `equipamento` VALUES (122, 2, 22, 45, 'Bom', 'bhkjkh', NULL, 1, '2024-10-27 22:51:05', '2024-10-27 22:51:05', NULL);
INSERT INTO `equipamento` VALUES (123, 3, 22, 1, 'Mau', ' bnbmkjknllk', NULL, 1, '2024-10-27 22:51:05', '2024-10-27 22:51:05', NULL);
INSERT INTO `equipamento` VALUES (124, 2, 27, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-31 12:23:57', '2024-10-31 12:23:57', NULL);
INSERT INTO `equipamento` VALUES (125, 1, 28, 5, 'Bom', 'Sala Tecnica', NULL, 1, '2024-11-01 09:58:32', '2024-11-01 09:58:32', NULL);
INSERT INTO `equipamento` VALUES (126, 2, 28, 5, 'Bom', 'Sala tecnica', NULL, 1, '2024-11-01 09:58:32', '2024-11-01 09:58:32', NULL);
INSERT INTO `equipamento` VALUES (127, 3, 28, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-11-01 09:58:32', '2024-11-01 09:58:32', NULL);
INSERT INTO `equipamento` VALUES (128, 1, 28, 6, 'Bom', 'Sala Tecnica', NULL, 1, '2024-11-01 09:58:32', '2024-11-01 09:58:32', NULL);
INSERT INTO `equipamento` VALUES (129, 2, 33, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-11-18 15:07:11', '2024-11-18 15:07:11', NULL);
INSERT INTO `equipamento` VALUES (131, 3, 45, 4, 'Bom', 'tecnica', NULL, 1, '2024-11-18 17:40:19', '2024-11-18 17:40:19', NULL);
INSERT INTO `equipamento` VALUES (132, 2, 46, 3, 'Bom', 'Sala Tecnica', NULL, 1, '2024-11-29 10:29:45', '2024-11-29 10:29:45', NULL);
INSERT INTO `equipamento` VALUES (133, 1, 47, 1, 'Bom', 'sala tecnica', NULL, 1, '2024-12-09 15:43:27', '2024-12-09 15:43:27', NULL);
INSERT INTO `equipamento` VALUES (134, 2, 49, 1, 'Bom', 'sala tecnica', NULL, 1, '2025-01-06 14:08:16', '2025-01-06 14:08:16', NULL);
INSERT INTO `equipamento` VALUES (135, 2, 56, 3, 'Bom', 'sala tecnica', NULL, 1, '2025-02-14 11:22:40', '2025-02-14 11:22:40', NULL);
INSERT INTO `equipamento` VALUES (136, 2, 57, 1, 'Bom', 'sala tecnica', NULL, 1, '2025-02-19 11:04:10', '2025-02-19 11:04:10', NULL);
INSERT INTO `equipamento` VALUES (137, 2, 58, 1, 'Bom', 'Sala tecnica', NULL, 1, '2025-02-19 11:21:59', '2025-02-19 11:21:59', NULL);
INSERT INTO `equipamento` VALUES (138, 2, 59, 1, 'Bom', 'Sala tecnica', NULL, 1, '2025-02-19 11:27:06', '2025-02-19 11:27:06', NULL);
INSERT INTO `equipamento` VALUES (139, 2, 60, 1, 'Bom', 'Sala tecnica', NULL, 1, '2025-02-19 11:28:54', '2025-02-19 11:28:54', NULL);

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
-- Table structure for grupo
-- ----------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `qtds` int NOT NULL,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grupo
-- ----------------------------
INSERT INTO `grupo` VALUES (1, 43, 'Chita', 1, '2024-10-30 12:22:15', NULL, '2024-12-13 13:32:28');
INSERT INTO `grupo` VALUES (2, 43, 'Leopardo', 1, '2024-10-30 12:22:35', NULL, '2024-10-30 12:22:35');
INSERT INTO `grupo` VALUES (3, 20, 'Girafa', 1, '2024-10-30 12:22:51', NULL, '2024-10-31 11:42:18');
INSERT INTO `grupo` VALUES (4, 14, 'Cobra', 1, '2024-10-30 12:23:07', NULL, '2024-10-30 12:23:07');
INSERT INTO `grupo` VALUES (5, 15, 'Tigre', 1, '2024-10-31 11:42:01', NULL, '2024-10-31 11:42:01');
INSERT INTO `grupo` VALUES (6, 56, 'cao', 1, '2024-12-13 13:32:44', NULL, '2024-12-13 13:32:44');

-- ----------------------------
-- Table structure for grupos
-- ----------------------------
DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `codname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grupos
-- ----------------------------
INSERT INTO `grupos` VALUES (1, 'SISM', 'CHITA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (2, 'DIO', 'CORUJA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (3, 'BATOP', 'MORCEGO', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (4, 'CIM EMG', 'TIGRE', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (5, 'CIM EXE', 'ZEBRA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (6, 'CIM RM CAB', 'GIRAFRA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (7, 'CIM RM NORTE', 'URSO', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (8, 'CIM RM LESTE', 'GORILA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (9, 'CIM RM CENTRO', 'BUFALO', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (10, 'CIM RM SUL', 'ONÇA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (11, 'CIM COMOP FAR', 'LOBO', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (12, 'CIM RM NORTE', 'JACARÉ', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (13, 'CIM FA SUL', 'CANGURU', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (14, 'CIM CMD MGMA', 'FOCA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (15, 'CIM RM SUL', 'CAVALO', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (16, 'DIMO EXE', 'LEOPARDO', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (17, 'DIMO RM NORTE', 'LEBRE', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (18, 'DIMO RM CABINB', 'FORMIGA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (19, 'DIMO RM NORTE', 'ABELHA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (20, 'DIMO RM LESTE', 'GATO', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (21, 'DIMO FA SUL', 'ELEFANTE', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (22, 'IMO RA NORTE', 'PEIXE', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (23, 'IMO RM CABINB', 'LAGARTO', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (24, 'IMO RM NORTE', 'BALEIA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (25, 'IMO RM LESTE', 'FORMIGA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (26, 'IMO RM SUL', 'ONÇA', 1, '2024-12-15 22:11:18', '2024-12-15 22:11:18', NULL);
INSERT INTO `grupos` VALUES (27, 'ZERO', 'MOCHO', 1, '2024-12-15 22:17:13', '2024-12-15 23:48:17', NULL);

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
-- Table structure for métrica
-- ----------------------------
DROP TABLE IF EXISTS `métrica`;
CREATE TABLE `métrica`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `grupo_id` int NOT NULL,
  `turno_id` int NOT NULL,
  `relatorio_id` int NOT NULL,
  `qtds_online` int NOT NULL,
  `qtds_offline` int NOT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `grupo_id`(`grupo_id` ASC) USING BTREE,
  INDEX `turno_id`(`turno_id` ASC) USING BTREE,
  INDEX `relatorio_id`(`relatorio_id` ASC) USING BTREE,
  CONSTRAINT `métrica_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `métrica_ibfk_2` FOREIGN KEY (`turno_id`) REFERENCES `turno` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `métrica_ibfk_3` FOREIGN KEY (`relatorio_id`) REFERENCES `relatorios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of métrica
-- ----------------------------
INSERT INTO `métrica` VALUES (22, 1, 2, 1, 5, 39, 1, '2024-10-29 19:51:26', NULL, '2024-10-31 23:12:52');
INSERT INTO `métrica` VALUES (23, 2, 2, 1, 5, 38, 1, '2024-10-29 19:51:26', NULL, '2024-10-31 23:13:00');
INSERT INTO `métrica` VALUES (24, 3, 2, 1, 5, 15, 1, '2024-10-29 19:51:26', NULL, '2024-10-31 23:13:08');
INSERT INTO `métrica` VALUES (25, 4, 2, 1, 5, 9, 1, '2024-10-29 19:51:26', NULL, '2024-10-31 23:13:15');
INSERT INTO `métrica` VALUES (26, 5, 2, 1, 5, 10, 1, '2024-10-29 19:51:26', NULL, '2024-10-31 23:13:21');
INSERT INTO `métrica` VALUES (27, 1, 1, 1, 25, 19, 1, '2024-10-29 23:09:42', NULL, '2024-11-01 00:52:51');
INSERT INTO `métrica` VALUES (28, 2, 1, 1, 19, 24, 1, '2024-10-29 23:09:42', NULL, '2024-11-01 00:52:58');
INSERT INTO `métrica` VALUES (29, 3, 1, 1, 6, 14, 1, '2024-10-29 23:09:42', NULL, '2024-11-01 00:53:03');
INSERT INTO `métrica` VALUES (30, 4, 1, 1, 8, 6, 1, '2024-10-29 23:09:42', NULL, '2024-11-01 00:53:10');
INSERT INTO `métrica` VALUES (31, 5, 1, 1, 10, 5, 1, '2024-10-29 23:09:42', NULL, '2024-11-01 00:53:16');
INSERT INTO `métrica` VALUES (32, 1, 3, 1, 21, 23, 1, '2024-10-29 00:51:20', NULL, '2024-11-01 00:53:30');
INSERT INTO `métrica` VALUES (33, 2, 3, 1, 24, 19, 1, '2024-10-29 00:51:20', NULL, '2024-11-01 00:53:44');
INSERT INTO `métrica` VALUES (34, 3, 3, 1, 6, 14, 1, '2024-10-29 00:51:20', NULL, '2024-11-01 00:54:06');
INSERT INTO `métrica` VALUES (35, 5, 3, 1, 9, 6, 1, '2024-10-29 00:51:20', NULL, '2024-11-01 00:54:14');
INSERT INTO `métrica` VALUES (36, 4, 3, 1, 7, 7, 1, '2024-10-29 00:51:20', NULL, '2024-11-01 00:54:21');
INSERT INTO `métrica` VALUES (37, 1, 3, 1, 21, 23, 1, '2024-11-01 00:51:24', NULL, '2024-11-01 00:51:24');
INSERT INTO `métrica` VALUES (38, 2, 3, 1, 24, 19, 1, '2024-11-01 00:51:24', NULL, '2024-11-01 00:51:24');
INSERT INTO `métrica` VALUES (39, 3, 3, 1, 6, 14, 1, '2024-11-01 00:51:24', NULL, '2024-11-01 00:51:24');
INSERT INTO `métrica` VALUES (40, 4, 3, 1, 7, 7, 1, '2024-11-01 00:51:24', NULL, '2024-11-01 00:51:24');
INSERT INTO `métrica` VALUES (41, 5, 3, 1, 9, 6, 1, '2024-11-01 00:51:24', NULL, '2024-11-01 00:51:24');
INSERT INTO `métrica` VALUES (42, 1, 1, 1, 14, 30, 1, '2024-11-01 09:10:13', NULL, '2024-11-01 09:10:13');
INSERT INTO `métrica` VALUES (43, 2, 1, 1, 34, 9, 1, '2024-11-01 09:10:13', NULL, '2024-11-01 09:10:13');
INSERT INTO `métrica` VALUES (44, 3, 1, 1, 15, 5, 1, '2024-11-01 09:10:13', NULL, '2024-11-01 09:10:13');
INSERT INTO `métrica` VALUES (45, 4, 1, 1, 6, 8, 1, '2024-11-01 09:10:13', NULL, '2024-11-01 09:10:13');
INSERT INTO `métrica` VALUES (46, 5, 1, 1, 8, 7, 1, '2024-11-01 09:10:13', NULL, '2024-11-01 09:10:13');
INSERT INTO `métrica` VALUES (47, 1, 1, 1, 12, 32, 1, '2024-11-01 09:23:37', NULL, '2024-11-01 09:23:37');
INSERT INTO `métrica` VALUES (48, 2, 1, 1, 23, 20, 1, '2024-11-01 09:23:37', NULL, '2024-11-01 09:23:37');
INSERT INTO `métrica` VALUES (49, 3, 1, 1, 4, 16, 1, '2024-11-01 09:23:37', NULL, '2024-11-01 09:23:37');
INSERT INTO `métrica` VALUES (50, 4, 1, 1, 8, 6, 1, '2024-11-01 09:23:37', NULL, '2024-11-01 09:23:37');
INSERT INTO `métrica` VALUES (51, 5, 1, 1, 6, 9, 1, '2024-11-01 09:23:37', NULL, '2024-11-01 09:23:37');
INSERT INTO `métrica` VALUES (52, 1, 1, 1, 43, 1, 1, '2024-11-18 10:28:06', NULL, '2024-11-18 10:28:06');
INSERT INTO `métrica` VALUES (53, 2, 1, 1, 5, 38, 1, '2024-11-18 10:28:06', NULL, '2024-11-18 10:28:06');
INSERT INTO `métrica` VALUES (54, 3, 1, 1, 6, 14, 1, '2024-11-18 10:28:06', NULL, '2024-11-18 10:28:06');
INSERT INTO `métrica` VALUES (55, 4, 1, 1, 8, 6, 1, '2024-11-18 10:28:06', NULL, '2024-11-18 10:28:06');
INSERT INTO `métrica` VALUES (56, 5, 1, 1, 7, 8, 1, '2024-11-18 10:28:06', NULL, '2024-11-18 10:28:06');
INSERT INTO `métrica` VALUES (57, 1, 1, 1, 5, 39, 1, '2024-11-29 10:28:37', NULL, '2024-11-29 10:28:37');
INSERT INTO `métrica` VALUES (58, 2, 1, 1, 7, 36, 1, '2024-11-29 10:28:37', NULL, '2024-11-29 10:28:37');
INSERT INTO `métrica` VALUES (59, 3, 1, 1, 5, 15, 1, '2024-11-29 10:28:37', NULL, '2024-11-29 10:28:37');
INSERT INTO `métrica` VALUES (60, 4, 1, 1, 1, 13, 1, '2024-11-29 10:28:37', NULL, '2024-11-29 10:28:37');
INSERT INTO `métrica` VALUES (61, 5, 1, 1, 3, 12, 1, '2024-11-29 10:28:37', NULL, '2024-11-29 10:28:37');
INSERT INTO `métrica` VALUES (62, 2, 1, 1, 7, 36, 1, '2024-12-09 11:45:16', NULL, '2024-12-09 11:45:16');
INSERT INTO `métrica` VALUES (63, 1, 1, 1, 5, 39, 1, '2024-12-09 11:45:16', NULL, '2024-12-09 11:45:16');
INSERT INTO `métrica` VALUES (64, 3, 1, 1, 20, 0, 1, '2024-12-09 11:45:16', NULL, '2024-12-09 11:45:16');
INSERT INTO `métrica` VALUES (65, 4, 1, 1, 11, 3, 1, '2024-12-09 11:45:16', NULL, '2024-12-09 11:45:16');
INSERT INTO `métrica` VALUES (66, 5, 1, 1, 12, 3, 1, '2024-12-09 11:45:16', NULL, '2024-12-09 11:45:16');
INSERT INTO `métrica` VALUES (72, 1, 2, 1, 5, 39, 1, '2024-12-09 12:01:27', NULL, '2024-12-09 14:05:14');
INSERT INTO `métrica` VALUES (73, 2, 2, 1, 5, 38, 1, '2024-12-09 12:01:27', NULL, '2024-12-09 14:05:17');
INSERT INTO `métrica` VALUES (74, 3, 2, 1, 5, 15, 1, '2024-12-09 12:01:27', NULL, '2024-12-09 14:05:21');
INSERT INTO `métrica` VALUES (75, 4, 2, 1, 5, 9, 1, '2024-12-09 12:01:27', NULL, '2024-12-09 14:05:23');
INSERT INTO `métrica` VALUES (76, 5, 2, 1, 5, 10, 1, '2024-12-09 12:01:28', NULL, '2024-12-09 14:05:27');
INSERT INTO `métrica` VALUES (82, 1, 2, 1, 4, 39, 1, '2024-12-13 13:33:34', NULL, '2024-12-13 13:33:34');
INSERT INTO `métrica` VALUES (83, 2, 2, 1, 12, 31, 1, '2024-12-13 13:33:34', NULL, '2024-12-13 13:33:34');
INSERT INTO `métrica` VALUES (84, 3, 2, 1, 12, 8, 1, '2024-12-13 13:33:34', NULL, '2024-12-13 13:33:34');
INSERT INTO `métrica` VALUES (85, 4, 2, 1, 12, 2, 1, '2024-12-13 13:33:34', NULL, '2024-12-13 13:33:34');
INSERT INTO `métrica` VALUES (86, 5, 2, 1, 12, 3, 1, '2024-12-13 13:33:34', NULL, '2024-12-13 13:33:34');
INSERT INTO `métrica` VALUES (87, 6, 2, 1, 12, 44, 1, '2024-12-13 13:33:34', NULL, '2024-12-13 13:33:34');

-- ----------------------------
-- Table structure for observacao
-- ----------------------------
DROP TABLE IF EXISTS `observacao`;
CREATE TABLE `observacao`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `situacao_id` int NOT NULL,
  `causa_id` int NULL DEFAULT NULL,
  `relatorios_id` int NULL DEFAULT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_observacao_situacao1_idx`(`situacao_id` ASC) USING BTREE,
  INDEX `fk_observacao_relatorios1_idx`(`relatorios_id` ASC) USING BTREE,
  INDEX `causa_id`(`causa_id` ASC) USING BTREE,
  CONSTRAINT `fk_observacao_relatorios1` FOREIGN KEY (`relatorios_id`) REFERENCES `relatorios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_observacao_situacao1` FOREIGN KEY (`situacao_id`) REFERENCES `situacao` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `observacao_ibfk_1` FOREIGN KEY (`causa_id`) REFERENCES `causas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 166 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of observacao
-- ----------------------------
INSERT INTO `observacao` VALUES (1, 1, NULL, 1, 'a Rede GRS se encontra estavel e operacional ', 1, '2024-10-20 12:02:22', '2024-10-20 12:02:22', NULL);
INSERT INTO `observacao` VALUES (2, 2, NULL, 1, 'A rede de Telefonia Voip se encontra operacional e nao tem neenhum problema isso significca que a Ms telecom esta funcional e usada da para falar com a parte interna e externa', 1, '2024-10-20 12:02:22', '2024-10-20 12:02:22', NULL);
INSERT INTO `observacao` VALUES (3, 1, NULL, 2, 'tudo operacional', 1, '2024-10-20 12:09:19', '2024-10-20 12:09:19', NULL);
INSERT INTO `observacao` VALUES (4, 2, NULL, 2, 'tudo operacional', 1, '2024-10-20 12:09:19', '2024-10-20 12:09:19', NULL);
INSERT INTO `observacao` VALUES (9, 1, NULL, 3, 'ygjgh', 1, '2024-10-20 15:52:53', '2024-10-20 15:52:53', NULL);
INSERT INTO `observacao` VALUES (10, 2, NULL, 3, 'jfgjghjgyfj', 1, '2024-10-20 15:52:53', '2024-10-20 15:52:53', NULL);
INSERT INTO `observacao` VALUES (12, 1, NULL, 3, 'ygjgh', 1, '2024-10-20 17:33:28', '2024-10-20 17:33:28', NULL);
INSERT INTO `observacao` VALUES (13, 2, NULL, 3, 'jfgjghjgyfj', 1, '2024-10-20 17:33:28', '2024-10-20 17:33:28', NULL);
INSERT INTO `observacao` VALUES (15, 1, NULL, 3, 'ygjgh', 1, '2024-10-20 17:34:14', '2024-10-20 17:34:14', NULL);
INSERT INTO `observacao` VALUES (16, 2, NULL, 3, 'jfgjghjgyfj', 1, '2024-10-20 17:34:14', '2024-10-20 17:34:14', NULL);
INSERT INTO `observacao` VALUES (18, 1, NULL, 5, 'operacional', 1, '2024-10-20 17:35:46', '2024-10-20 17:35:46', NULL);
INSERT INTO `observacao` VALUES (19, 1, NULL, 5, 'operacional', 1, '2024-10-20 17:37:16', '2024-10-20 17:37:16', NULL);
INSERT INTO `observacao` VALUES (20, 1, NULL, 5, 'operacional', 1, '2024-10-20 17:38:31', '2024-10-20 17:38:31', NULL);
INSERT INTO `observacao` VALUES (21, 1, NULL, 5, 'operacional', 1, '2024-10-20 17:48:56', '2024-10-20 17:48:56', NULL);
INSERT INTO `observacao` VALUES (22, 1, NULL, 5, 'operacional', 1, '2024-10-20 17:50:28', '2024-10-20 17:50:28', NULL);
INSERT INTO `observacao` VALUES (23, 1, NULL, 5, 'operacional', 1, '2024-10-20 17:52:05', '2024-10-20 17:52:05', NULL);
INSERT INTO `observacao` VALUES (24, 1, NULL, 5, 'operacional', 1, '2024-10-20 17:57:32', '2024-10-20 17:57:32', NULL);
INSERT INTO `observacao` VALUES (25, 1, NULL, 5, 'operacional', 1, '2024-10-20 18:12:47', '2024-10-20 18:12:47', NULL);
INSERT INTO `observacao` VALUES (26, 1, NULL, 6, 'opreacional sem interrupcoes', 1, '2024-10-20 18:13:47', '2024-10-20 18:13:47', NULL);
INSERT INTO `observacao` VALUES (27, 1, NULL, 6, 'opreacional sem interrupcoes', 1, '2024-10-20 18:22:24', '2024-10-20 18:22:24', NULL);
INSERT INTO `observacao` VALUES (28, 1, NULL, 7, 'operacional', 1, '2024-10-20 18:23:44', '2024-10-20 18:23:44', NULL);
INSERT INTO `observacao` VALUES (29, 2, NULL, 7, 'operacional', 1, '2024-10-20 18:23:44', '2024-10-20 18:23:44', NULL);
INSERT INTO `observacao` VALUES (30, 1, NULL, 7, 'operacional', 1, '2024-10-20 18:27:12', '2024-10-20 18:27:12', NULL);
INSERT INTO `observacao` VALUES (31, 2, NULL, 7, 'operacional', 1, '2024-10-20 18:27:12', '2024-10-20 18:27:12', NULL);
INSERT INTO `observacao` VALUES (32, 1, NULL, 7, 'operacional', 1, '2024-10-20 18:34:44', '2024-10-20 18:34:44', NULL);
INSERT INTO `observacao` VALUES (33, 2, NULL, 7, 'operacional', 1, '2024-10-20 18:34:44', '2024-10-20 18:34:44', NULL);
INSERT INTO `observacao` VALUES (34, 1, NULL, 7, 'operacional', 1, '2024-10-20 18:55:39', '2024-10-20 18:55:39', NULL);
INSERT INTO `observacao` VALUES (35, 2, NULL, 7, 'operacional', 1, '2024-10-20 18:55:39', '2024-10-20 18:55:39', NULL);
INSERT INTO `observacao` VALUES (36, 1, NULL, 7, 'operacional', 1, '2024-10-20 19:01:25', '2024-10-20 19:01:25', NULL);
INSERT INTO `observacao` VALUES (37, 2, NULL, 7, 'operacional', 1, '2024-10-20 19:01:25', '2024-10-20 19:01:25', NULL);
INSERT INTO `observacao` VALUES (38, 1, NULL, 7, 'operacional', 1, '2024-10-20 19:04:58', '2024-10-20 19:04:58', NULL);
INSERT INTO `observacao` VALUES (39, 2, NULL, 7, 'operacional', 1, '2024-10-20 19:04:58', '2024-10-20 19:04:58', NULL);
INSERT INTO `observacao` VALUES (40, 1, NULL, 7, 'operacional', 1, '2024-10-20 19:08:12', '2024-10-20 19:08:12', NULL);
INSERT INTO `observacao` VALUES (41, 2, NULL, 7, 'operacional', 1, '2024-10-20 19:08:12', '2024-10-20 19:08:12', NULL);
INSERT INTO `observacao` VALUES (42, 1, NULL, 7, 'operacional', 1, '2024-10-20 19:13:21', '2024-10-20 19:13:21', NULL);
INSERT INTO `observacao` VALUES (43, 2, NULL, 7, 'operacional', 1, '2024-10-20 19:13:21', '2024-10-20 19:13:21', NULL);
INSERT INTO `observacao` VALUES (44, 1, NULL, 7, 'operacional', 1, '2024-10-20 19:19:12', '2024-10-20 19:19:12', NULL);
INSERT INTO `observacao` VALUES (45, 2, NULL, 7, 'operacional', 1, '2024-10-20 19:19:12', '2024-10-20 19:19:12', NULL);
INSERT INTO `observacao` VALUES (46, 1, NULL, 7, 'operacional', 1, '2024-10-20 19:31:25', '2024-10-20 19:31:25', NULL);
INSERT INTO `observacao` VALUES (47, 2, NULL, 7, 'operacional', 1, '2024-10-20 19:31:25', '2024-10-20 19:31:25', NULL);
INSERT INTO `observacao` VALUES (48, 1, NULL, 7, 'operacional', 1, '2024-10-20 19:33:30', '2024-10-20 19:33:30', NULL);
INSERT INTO `observacao` VALUES (49, 2, NULL, 7, 'operacional', 1, '2024-10-20 19:33:30', '2024-10-20 19:33:30', NULL);
INSERT INTO `observacao` VALUES (50, 1, NULL, 7, 'operacional', 1, '2024-10-20 19:36:28', '2024-10-20 19:36:28', NULL);
INSERT INTO `observacao` VALUES (51, 2, NULL, 7, 'operacional', 1, '2024-10-20 19:36:28', '2024-10-20 19:36:28', NULL);
INSERT INTO `observacao` VALUES (52, 1, NULL, 7, 'operacional', 1, '2024-10-20 19:55:33', '2024-10-20 19:55:33', NULL);
INSERT INTO `observacao` VALUES (53, 2, NULL, 7, 'operacional', 1, '2024-10-20 19:55:33', '2024-10-20 19:55:33', NULL);
INSERT INTO `observacao` VALUES (54, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:17:00', '2024-10-20 20:17:00', NULL);
INSERT INTO `observacao` VALUES (55, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:17:00', '2024-10-20 20:17:00', NULL);
INSERT INTO `observacao` VALUES (56, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:20:19', '2024-10-20 20:20:19', NULL);
INSERT INTO `observacao` VALUES (57, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:20:19', '2024-10-20 20:20:19', NULL);
INSERT INTO `observacao` VALUES (58, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:24:25', '2024-10-20 20:24:25', NULL);
INSERT INTO `observacao` VALUES (59, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:24:25', '2024-10-20 20:24:25', NULL);
INSERT INTO `observacao` VALUES (60, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:28:55', '2024-10-20 20:28:55', NULL);
INSERT INTO `observacao` VALUES (61, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:28:55', '2024-10-20 20:28:55', NULL);
INSERT INTO `observacao` VALUES (62, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:34:43', '2024-10-20 20:34:43', NULL);
INSERT INTO `observacao` VALUES (63, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:34:43', '2024-10-20 20:34:43', NULL);
INSERT INTO `observacao` VALUES (64, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:38:25', '2024-10-20 20:38:25', NULL);
INSERT INTO `observacao` VALUES (65, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:38:25', '2024-10-20 20:38:25', NULL);
INSERT INTO `observacao` VALUES (66, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:39:24', '2024-10-20 20:39:24', NULL);
INSERT INTO `observacao` VALUES (67, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:39:24', '2024-10-20 20:39:24', NULL);
INSERT INTO `observacao` VALUES (68, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:40:03', '2024-10-20 20:40:03', NULL);
INSERT INTO `observacao` VALUES (69, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:40:03', '2024-10-20 20:40:03', NULL);
INSERT INTO `observacao` VALUES (70, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:47:26', '2024-10-20 20:47:26', NULL);
INSERT INTO `observacao` VALUES (71, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:47:26', '2024-10-20 20:47:26', NULL);
INSERT INTO `observacao` VALUES (72, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:51:00', '2024-10-20 20:51:00', NULL);
INSERT INTO `observacao` VALUES (73, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:51:00', '2024-10-20 20:51:00', NULL);
INSERT INTO `observacao` VALUES (74, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:53:22', '2024-10-20 20:53:22', NULL);
INSERT INTO `observacao` VALUES (75, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:53:22', '2024-10-20 20:53:22', NULL);
INSERT INTO `observacao` VALUES (76, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:56:04', '2024-10-20 20:56:04', NULL);
INSERT INTO `observacao` VALUES (77, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:56:04', '2024-10-20 20:56:04', NULL);
INSERT INTO `observacao` VALUES (78, 1, NULL, 7, 'operacional', 1, '2024-10-20 20:59:04', '2024-10-20 20:59:04', NULL);
INSERT INTO `observacao` VALUES (79, 2, NULL, 7, 'operacional', 1, '2024-10-20 20:59:04', '2024-10-20 20:59:04', NULL);
INSERT INTO `observacao` VALUES (80, 1, NULL, 7, 'operacional', 1, '2024-10-20 21:03:00', '2024-10-20 21:03:00', NULL);
INSERT INTO `observacao` VALUES (81, 2, NULL, 7, 'operacional', 1, '2024-10-20 21:03:00', '2024-10-20 21:03:00', NULL);
INSERT INTO `observacao` VALUES (82, 1, NULL, 7, 'operacional', 1, '2024-10-20 21:05:17', '2024-10-20 21:05:17', NULL);
INSERT INTO `observacao` VALUES (83, 2, NULL, 7, 'operacional', 1, '2024-10-20 21:05:17', '2024-10-20 21:05:17', NULL);
INSERT INTO `observacao` VALUES (84, 1, NULL, 7, 'operacional', 1, '2024-10-20 21:06:29', '2024-10-20 21:06:29', NULL);
INSERT INTO `observacao` VALUES (85, 2, NULL, 7, 'operacional', 1, '2024-10-20 21:06:29', '2024-10-20 21:06:29', NULL);
INSERT INTO `observacao` VALUES (86, 1, NULL, 7, 'operacional', 1, '2024-10-20 21:08:55', '2024-10-20 21:08:55', NULL);
INSERT INTO `observacao` VALUES (87, 2, NULL, 7, 'operacional', 1, '2024-10-20 21:08:55', '2024-10-20 21:08:55', NULL);
INSERT INTO `observacao` VALUES (88, 1, NULL, 7, 'operacional', 1, '2024-10-20 21:09:31', '2024-10-20 21:09:31', NULL);
INSERT INTO `observacao` VALUES (89, 2, NULL, 7, 'operacional', 1, '2024-10-20 21:09:31', '2024-10-20 21:09:31', NULL);
INSERT INTO `observacao` VALUES (90, 1, NULL, 7, 'operacional', 1, '2024-10-20 21:11:19', '2024-10-20 21:11:19', NULL);
INSERT INTO `observacao` VALUES (91, 2, NULL, 7, 'operacional', 1, '2024-10-20 21:11:19', '2024-10-20 21:11:19', NULL);
INSERT INTO `observacao` VALUES (92, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:19:17', '2024-10-20 21:19:17', NULL);
INSERT INTO `observacao` VALUES (93, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:19:17', '2024-10-20 21:19:17', NULL);
INSERT INTO `observacao` VALUES (94, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:21:15', '2024-10-20 21:21:15', NULL);
INSERT INTO `observacao` VALUES (95, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:21:15', '2024-10-20 21:21:15', NULL);
INSERT INTO `observacao` VALUES (96, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:24:08', '2024-10-20 21:24:08', NULL);
INSERT INTO `observacao` VALUES (97, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:24:08', '2024-10-20 21:24:08', NULL);
INSERT INTO `observacao` VALUES (98, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:30:26', '2024-10-20 21:30:26', NULL);
INSERT INTO `observacao` VALUES (99, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:30:26', '2024-10-20 21:30:26', NULL);
INSERT INTO `observacao` VALUES (100, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:33:40', '2024-10-20 21:33:40', NULL);
INSERT INTO `observacao` VALUES (101, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:33:40', '2024-10-20 21:33:40', NULL);
INSERT INTO `observacao` VALUES (102, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:37:47', '2024-10-20 21:37:47', NULL);
INSERT INTO `observacao` VALUES (103, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:37:47', '2024-10-20 21:37:47', NULL);
INSERT INTO `observacao` VALUES (104, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:40:40', '2024-10-20 21:40:40', NULL);
INSERT INTO `observacao` VALUES (105, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:40:40', '2024-10-20 21:40:40', NULL);
INSERT INTO `observacao` VALUES (106, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:49:44', '2024-10-20 21:49:44', NULL);
INSERT INTO `observacao` VALUES (107, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:49:44', '2024-10-20 21:49:44', NULL);
INSERT INTO `observacao` VALUES (108, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:50:25', '2024-10-20 21:50:25', NULL);
INSERT INTO `observacao` VALUES (109, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:50:25', '2024-10-20 21:50:25', NULL);
INSERT INTO `observacao` VALUES (110, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:51:39', '2024-10-20 21:51:39', NULL);
INSERT INTO `observacao` VALUES (111, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:51:39', '2024-10-20 21:51:39', NULL);
INSERT INTO `observacao` VALUES (112, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:53:25', '2024-10-20 21:53:25', NULL);
INSERT INTO `observacao` VALUES (113, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:53:25', '2024-10-20 21:53:25', NULL);
INSERT INTO `observacao` VALUES (114, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:56:00', '2024-10-20 21:56:00', NULL);
INSERT INTO `observacao` VALUES (115, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:56:00', '2024-10-20 21:56:00', NULL);
INSERT INTO `observacao` VALUES (116, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:56:35', '2024-10-20 21:56:35', NULL);
INSERT INTO `observacao` VALUES (117, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:56:35', '2024-10-20 21:56:35', NULL);
INSERT INTO `observacao` VALUES (118, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 21:57:08', '2024-10-20 21:57:08', NULL);
INSERT INTO `observacao` VALUES (119, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 21:57:08', '2024-10-20 21:57:08', NULL);
INSERT INTO `observacao` VALUES (120, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 22:03:40', '2024-10-20 22:03:40', NULL);
INSERT INTO `observacao` VALUES (121, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 22:03:40', '2024-10-20 22:03:40', NULL);
INSERT INTO `observacao` VALUES (122, 1, NULL, 8, 'Esta operacional', 1, '2024-10-20 22:23:17', '2024-10-20 22:23:17', NULL);
INSERT INTO `observacao` VALUES (123, 2, NULL, 8, 'esta funcionando plena,me', 1, '2024-10-20 22:23:17', '2024-10-20 22:23:17', NULL);
INSERT INTO `observacao` VALUES (124, 1, NULL, 11, 'fdhgfh', 1, '2024-10-20 23:06:55', '2024-10-20 23:06:55', NULL);
INSERT INTO `observacao` VALUES (125, 1, NULL, 11, 'fdhgfh', 1, '2024-10-20 23:07:35', '2024-10-20 23:07:35', NULL);
INSERT INTO `observacao` VALUES (126, 1, NULL, 12, 'Alguma Coisa', 1, '2024-10-23 09:35:52', '2024-10-23 09:35:52', NULL);
INSERT INTO `observacao` VALUES (127, 1, NULL, 12, 'Alguma Coisa', 1, '2024-10-23 09:38:17', '2024-10-23 09:38:17', NULL);
INSERT INTO `observacao` VALUES (128, 1, NULL, 12, 'Alguma Coisa', 1, '2024-10-23 09:39:18', '2024-10-23 09:39:18', NULL);
INSERT INTO `observacao` VALUES (129, 1, NULL, 21, 'rfdufuyfuyt', 1, '2024-10-27 22:49:37', '2024-10-27 22:49:37', NULL);
INSERT INTO `observacao` VALUES (130, 1, NULL, 22, 'trduyguyt', 1, '2024-10-27 22:51:05', '2024-10-27 22:51:05', NULL);
INSERT INTO `observacao` VALUES (131, 2, NULL, 22, 'dthfgyhgfgdfg', 1, '2024-10-27 22:51:05', '2024-10-27 22:51:05', NULL);
INSERT INTO `observacao` VALUES (132, 2, NULL, 27, 'caiu durante 2h das 10 ate ', 1, '2024-10-31 12:23:56', '2024-10-31 12:23:56', NULL);
INSERT INTO `observacao` VALUES (133, 1, NULL, 28, 'Tudo normal', 1, '2024-11-01 09:58:32', '2024-11-01 09:58:32', NULL);
INSERT INTO `observacao` VALUES (134, 2, NULL, 28, 'Não se registrou nada durante as 24h', 1, '2024-11-01 09:58:32', '2024-11-01 09:58:32', NULL);
INSERT INTO `observacao` VALUES (135, 1, NULL, 28, 'Sjkdchllnfdjlkjfldjlnd', 1, '2024-11-01 09:58:32', '2024-11-01 09:58:32', NULL);
INSERT INTO `observacao` VALUES (136, 2, NULL, 28, 'kjjzsbcflmmmm', 1, '2024-11-01 09:58:32', '2024-11-01 09:58:32', NULL);
INSERT INTO `observacao` VALUES (141, 1, NULL, 45, 'Teste 12/11/2024', 1, '2024-11-12 21:26:20', '2024-11-18 17:40:19', NULL);
INSERT INTO `observacao` VALUES (142, 2, NULL, 45, 'Teste 12/11/2024', 1, '2024-11-12 21:26:20', '2024-11-18 17:40:19', NULL);
INSERT INTO `observacao` VALUES (143, 1, NULL, 45, 'Teste2 12/11/2024', 1, '2024-11-12 21:27:12', '2024-11-18 17:40:19', NULL);
INSERT INTO `observacao` VALUES (144, 1, NULL, 45, 'Toaster 12/11/2024', 1, '2024-11-12 21:28:29', '2024-11-18 17:40:19', NULL);
INSERT INTO `observacao` VALUES (145, 1, NULL, 45, 'Toaster 12/11/2024', 1, '2024-11-12 21:28:43', '2024-11-18 17:40:19', NULL);
INSERT INTO `observacao` VALUES (146, 1, NULL, 29, 'nova ocorrência', 1, '2024-11-18 14:43:13', '2024-11-18 14:43:13', NULL);
INSERT INTO `observacao` VALUES (147, 1, NULL, 31, 'nova ocorrência3', 1, '2024-11-18 15:04:44', '2024-11-18 15:04:44', NULL);
INSERT INTO `observacao` VALUES (148, 2, NULL, 32, 'Nova ocorrencia', 1, '2024-11-18 15:07:04', '2024-11-18 15:07:04', NULL);
INSERT INTO `observacao` VALUES (149, 2, NULL, 33, 'Nova ocorrencia', 1, '2024-11-18 15:07:11', '2024-11-18 15:07:11', NULL);
INSERT INTO `observacao` VALUES (150, 1, NULL, 46, 'Adicionar Observações', 1, '2024-11-28 11:44:53', '2024-11-29 10:29:45', NULL);
INSERT INTO `observacao` VALUES (151, 2, NULL, 46, 'Adicionar Observações', 1, '2024-11-28 11:44:53', '2024-11-29 10:29:45', NULL);
INSERT INTO `observacao` VALUES (152, 2, NULL, 46, 'Falha de energia', 1, '2024-11-29 10:26:15', '2024-11-29 10:29:45', NULL);
INSERT INTO `observacao` VALUES (153, 1, NULL, 47, 'gfdggf', 1, '2024-12-09 15:43:27', '2024-12-09 15:43:27', NULL);
INSERT INTO `observacao` VALUES (154, 1, NULL, 49, 'Gtfghjkj', 1, '2025-01-06 14:08:16', '2025-01-06 14:08:16', NULL);
INSERT INTO `observacao` VALUES (156, 1, NULL, 50, 'Sem rede', 1, '2025-02-14 10:40:20', '2025-02-14 10:40:20', NULL);
INSERT INTO `observacao` VALUES (157, 1, NULL, 56, 'teste 1 hj', 1, '2025-02-14 11:06:51', '2025-02-14 11:22:40', NULL);
INSERT INTO `observacao` VALUES (158, 2, NULL, 56, 'teste 1 hj', 1, '2025-02-14 11:07:01', '2025-02-14 11:22:40', NULL);
INSERT INTO `observacao` VALUES (159, 2, NULL, 57, 'khvjk', 1, '2025-02-19 11:04:10', '2025-02-19 11:04:10', NULL);
INSERT INTO `observacao` VALUES (160, 3, NULL, 58, 'queda de internet por falta de energia', 1, '2025-02-19 11:21:59', '2025-02-19 11:21:59', NULL);
INSERT INTO `observacao` VALUES (161, 2, NULL, 58, 'Telefone do Chefe Adjunto não está a funciona', 1, '2025-02-19 11:21:59', '2025-02-19 11:21:59', NULL);
INSERT INTO `observacao` VALUES (162, 3, NULL, 59, 'queda de internet por falta de energia', 1, '2025-02-19 11:27:06', '2025-02-19 11:27:06', NULL);
INSERT INTO `observacao` VALUES (163, 2, NULL, 59, 'Telefone do Chefe Adjunto não está a funciona', 1, '2025-02-19 11:27:06', '2025-02-19 11:27:06', NULL);
INSERT INTO `observacao` VALUES (164, 3, NULL, 60, 'queda de internet por falta de energia', 1, '2025-02-19 11:28:54', '2025-02-19 11:28:54', NULL);
INSERT INTO `observacao` VALUES (165, 2, NULL, 60, 'Telefone do Chefe Adjunto não está a funciona', 1, '2025-02-19 11:28:54', '2025-02-19 11:28:54', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `pessoa` VALUES (64, 'Elisio Jorge', '1996-05-18', 'Masculino', NULL, 1, '2024-10-30 12:55:33', NULL, '2024-10-30 12:55:33', NULL, 9);

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
-- Table structure for radios
-- ----------------------------
DROP TABLE IF EXISTS `radios`;
CREATE TABLE `radios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_serie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `identificador` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `localizacao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `situacao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of radios
-- ----------------------------
INSERT INTO `radios` VALUES (1, NULL, 'GRS20202', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-18 03:46:27', '2024-12-18 03:46:27');
INSERT INTO `radios` VALUES (2, NULL, 'GRS21037', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (3, NULL, 'GRS20645', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (4, NULL, 'GRS21040', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (5, NULL, 'GRS21042', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (6, NULL, 'GRS21047', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (7, NULL, 'GRS21048', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (8, NULL, 'GRS21049', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (9, NULL, 'GRS21050', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (10, NULL, 'GRS21051', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (11, NULL, 'GRS21052', 1, NULL, NULL, 1, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (12, NULL, 'GRS21053', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (13, '0', 'GRS20293', 1, '', '', 1, '2024-12-15 23:30:34', '2025-01-21 08:42:41', NULL);
INSERT INTO `radios` VALUES (14, NULL, 'GRS21056', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (15, NULL, 'GRS21064', 1, NULL, NULL, 1, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (16, NULL, 'GRS21065', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (17, NULL, 'GRS21095', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (18, NULL, 'GRS20250', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (19, NULL, 'GRS20922', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (20, NULL, 'GRS20878', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (21, NULL, 'GRS20836', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (22, NULL, 'GRS21063', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (23, NULL, 'GRS20245', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (24, NULL, 'GRS21074', 1, NULL, NULL, 1, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (25, NULL, 'GRS20639', 1, NULL, NULL, 1, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (26, NULL, 'GRS21086', 1, NULL, NULL, 1, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (27, NULL, 'GRSM0073', 1, NULL, NULL, 1, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (28, NULL, 'GRSM0076', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (29, NULL, 'GRSM0236', 1, NULL, NULL, 0, '2024-12-15 23:30:34', '2024-12-15 23:30:34', NULL);
INSERT INTO `radios` VALUES (30, NULL, 'GRS20649', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (31, NULL, 'GRS20650', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (32, NULL, 'GRS20651', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (33, NULL, 'GRS20652', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (34, NULL, 'GRS20653', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (35, NULL, 'GRS20654', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (36, NULL, 'GRS20655', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (37, NULL, 'GRS20656', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (38, NULL, 'GRS20657', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (39, NULL, 'GRS20658', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (40, NULL, 'GRS20659', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (41, NULL, 'GRS20660', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (42, NULL, 'GRS20661', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (43, NULL, 'GRS20662', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (44, NULL, 'GRS20663', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (45, NULL, 'GRS20664', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (46, NULL, 'GRS20665', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (47, NULL, 'GRS20666', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (48, NULL, 'GRS20667', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (49, NULL, 'GRS20668', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (50, NULL, 'GRS20669', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (51, NULL, 'GRS20670', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (52, NULL, 'GRS20671', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (53, NULL, 'GRS20672', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (54, NULL, 'GRS20673', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (55, NULL, 'GRS20674', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (56, NULL, 'GRS20675', 1, NULL, NULL, 1, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (57, NULL, 'GRS20676', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (58, NULL, 'GRS20677', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (59, NULL, 'GRS20678', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (60, NULL, 'GRS20679', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (61, NULL, 'GRS20680', 1, NULL, NULL, 1, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (62, NULL, 'GRS20681', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (63, NULL, 'GRS20682', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (64, NULL, 'GRS20683', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (65, NULL, 'GRS20685', 1, NULL, NULL, 1, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (66, NULL, 'GRS20686', 1, NULL, NULL, 1, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (67, NULL, 'GRS20687', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (68, NULL, 'GRS20710', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (69, NULL, 'GRS20711', 1, NULL, NULL, 0, '2024-12-15 23:31:34', '2024-12-15 23:31:34', NULL);
INSERT INTO `radios` VALUES (70, NULL, 'GRS20712', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (71, NULL, 'GRS20713', 1, NULL, NULL, 1, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (72, NULL, 'GRS20714', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (73, NULL, 'GRS20640', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (74, NULL, 'GRS20837', 1, NULL, NULL, 1, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (75, NULL, 'GRS20838', 1, NULL, NULL, 1, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (76, NULL, 'GRS21067', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (77, NULL, 'GRS21068', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (78, NULL, 'GRS21096', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (79, NULL, 'GRS21097', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (80, NULL, 'GRS21098', 1, NULL, NULL, 1, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (81, NULL, 'GRS21099', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (82, NULL, 'GRSM0232', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (83, NULL, 'GRSM0233', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (84, NULL, 'GRSM0234', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (85, NULL, 'GRSM0235', 1, NULL, NULL, 0, '2024-12-15 23:32:53', '2024-12-15 23:32:53', NULL);
INSERT INTO `radios` VALUES (86, NULL, 'GRS20839', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (87, NULL, 'GRS20840', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (88, NULL, 'GRS20841', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (89, NULL, 'GRS20643', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (90, NULL, 'GRS20644', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (91, NULL, 'GRS21038', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (92, NULL, 'GRS20842', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (93, NULL, 'GRS20843', 1, NULL, NULL, 1, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (94, NULL, 'GRS20844', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (95, NULL, 'GRS20845', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (96, NULL, 'GRS20846', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (97, NULL, 'GRS20848', 1, NULL, NULL, 1, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (98, NULL, 'GRS20849', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (99, NULL, 'GRS20850', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (100, NULL, 'GRS20851', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (101, NULL, 'GRS21009', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (102, NULL, 'GRS20853', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (103, NULL, 'GRS20854', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (104, NULL, 'GRS20855', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (105, NULL, 'GRS20647', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);
INSERT INTO `radios` VALUES (106, NULL, 'GRS21010', 1, NULL, NULL, 0, '2024-12-15 23:33:59', '2024-12-15 23:33:59', NULL);

-- ----------------------------
-- Table structure for relatorios
-- ----------------------------
DROP TABLE IF EXISTS `relatorios`;
CREATE TABLE `relatorios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tecnico_cessante_id` int NULL DEFAULT NULL,
  `tecnico_entrante_id` int NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `relatorios` VALUES (15, NULL, NULL, NULL, NULL, 1, '2024-10-27 10:11:43', '2024-10-27 10:11:43', NULL);
INSERT INTO `relatorios` VALUES (16, NULL, NULL, NULL, NULL, 1, '2024-10-27 10:12:17', '2024-10-27 10:12:17', NULL);
INSERT INTO `relatorios` VALUES (17, NULL, NULL, NULL, NULL, 1, '2024-10-27 10:12:48', '2024-10-27 10:12:48', NULL);
INSERT INTO `relatorios` VALUES (18, 1, 2, '2024-10-17', 'rfgf', 1, '2024-10-27 10:14:35', '2024-10-27 10:14:35', NULL);
INSERT INTO `relatorios` VALUES (19, NULL, NULL, NULL, NULL, 1, '2024-10-27 22:37:36', '2024-10-27 22:37:36', NULL);
INSERT INTO `relatorios` VALUES (20, NULL, NULL, NULL, NULL, 1, '2024-10-27 22:39:57', '2024-10-27 22:39:57', NULL);
INSERT INTO `relatorios` VALUES (21, 2, 1, '2024-10-27', 'gfxbvx', 1, '2024-10-27 22:42:28', '2024-10-27 22:49:38', NULL);
INSERT INTO `relatorios` VALUES (22, 2, 1, '2024-10-27', 'mn,mn,', 1, '2024-10-27 22:50:05', '2024-10-27 22:51:06', NULL);
INSERT INTO `relatorios` VALUES (23, NULL, NULL, NULL, NULL, 1, '2024-10-27 23:13:08', '2024-10-27 23:13:08', NULL);
INSERT INTO `relatorios` VALUES (24, NULL, NULL, NULL, NULL, 1, '2024-10-27 23:13:08', '2024-10-27 23:13:08', NULL);
INSERT INTO `relatorios` VALUES (25, NULL, NULL, NULL, NULL, 1, '2024-10-27 23:33:29', '2024-10-27 23:33:29', NULL);
INSERT INTO `relatorios` VALUES (26, NULL, NULL, NULL, NULL, 1, '2024-10-27 23:35:13', '2024-10-27 23:35:13', NULL);
INSERT INTO `relatorios` VALUES (27, 1, 64, '2024-10-31', 'njkbdjavjaj', 1, '2024-10-31 12:23:56', '2024-10-31 12:23:56', NULL);
INSERT INTO `relatorios` VALUES (28, 1, 63, '2024-11-01', 'Nada Registrado', 1, '2024-11-01 09:58:32', '2024-11-01 09:58:32', NULL);
INSERT INTO `relatorios` VALUES (29, 1, 64, '2024-11-18', 'Teste DAs situações', 1, '2024-11-18 14:40:31', '2024-11-18 14:40:31', NULL);
INSERT INTO `relatorios` VALUES (30, 1, 64, '2024-11-18', 'Teste DAs situações', 1, '2024-11-18 14:43:26', '2024-11-18 14:43:26', NULL);
INSERT INTO `relatorios` VALUES (31, 1, 64, '2024-11-18', 'Teste DAs situações', 1, '2024-11-18 15:04:16', '2024-11-18 15:04:16', NULL);
INSERT INTO `relatorios` VALUES (32, 1, 64, '2024-11-18', 'Teste Patch', 1, '2024-11-18 15:06:22', '2024-11-18 15:06:22', NULL);
INSERT INTO `relatorios` VALUES (33, 1, 64, '2024-11-18', 'Teste Patch', 1, '2024-11-18 15:07:10', '2024-11-18 15:07:10', NULL);
INSERT INTO `relatorios` VALUES (34, 1, 2, '2024-11-18', 'teste34', 1, '2024-11-18 15:09:33', '2024-11-18 15:09:33', NULL);
INSERT INTO `relatorios` VALUES (35, 1, NULL, '2024-11-18', NULL, 1, '2024-11-18 16:44:15', '2024-11-18 16:44:15', NULL);
INSERT INTO `relatorios` VALUES (36, 1, NULL, '2024-11-18', NULL, 1, '2024-11-18 17:07:16', '2024-11-18 17:07:16', NULL);
INSERT INTO `relatorios` VALUES (37, 1, NULL, '2024-11-18', NULL, 1, '2024-11-18 17:08:22', '2024-11-18 17:08:22', NULL);
INSERT INTO `relatorios` VALUES (38, 1, NULL, '2024-11-18', NULL, 1, '2024-11-18 17:09:16', '2024-11-18 17:09:16', NULL);
INSERT INTO `relatorios` VALUES (39, 1, 64, '2024-11-18', 'Teste Obse', 1, '2024-11-18 17:12:29', '2024-11-18 17:12:29', NULL);
INSERT INTO `relatorios` VALUES (40, 1, NULL, '2024-11-18', NULL, 1, '2024-11-18 17:24:21', '2024-11-18 17:24:21', NULL);
INSERT INTO `relatorios` VALUES (41, 1, 63, '2024-11-18', NULL, 1, '2024-11-18 17:28:03', '2024-11-18 17:28:03', NULL);
INSERT INTO `relatorios` VALUES (42, 1, 63, '2024-11-18', 'Teste finalllll', 1, '2024-11-18 17:30:52', '2024-11-18 17:30:52', NULL);
INSERT INTO `relatorios` VALUES (43, 1, 63, '2024-11-18', 'Teste finalllll', 1, '2024-11-18 17:34:14', '2024-11-18 17:34:14', NULL);
INSERT INTO `relatorios` VALUES (44, 1, 63, '2024-11-18', 'Teste finalllll', 1, '2024-11-18 17:39:47', '2024-11-18 17:39:47', NULL);
INSERT INTO `relatorios` VALUES (45, 1, 63, '2024-11-18', 'Teste finalllll', 1, '2024-11-18 17:40:18', '2024-11-18 17:40:18', NULL);
INSERT INTO `relatorios` VALUES (46, 1, 64, '2024-11-29', 'jbdhwvdvjvwhg', 1, '2024-11-29 10:29:45', '2024-11-29 10:29:45', NULL);
INSERT INTO `relatorios` VALUES (47, 1, 64, '2024-12-09', 'vhjvhjkjbjbljkbjkljk', 1, '2024-12-09 15:43:27', '2024-12-09 15:43:27', NULL);
INSERT INTO `relatorios` VALUES (48, 64, 2, '2024-12-15', 'njbcvchg', 1, '2024-12-15 14:21:39', '2024-12-15 14:21:39', NULL);
INSERT INTO `relatorios` VALUES (49, 1, 64, '2025-01-06', 'ççoikjk', 1, '2025-01-06 14:08:16', '2025-01-06 14:08:16', NULL);
INSERT INTO `relatorios` VALUES (50, 1, 63, '2025-02-14', 'Durante as 24h não se registrou nada', 1, '2025-02-14 10:40:20', '2025-02-14 10:40:20', NULL);
INSERT INTO `relatorios` VALUES (51, 1, 64, '2025-02-14', 'hjf', 1, '2025-02-14 10:41:28', '2025-02-14 10:41:28', NULL);
INSERT INTO `relatorios` VALUES (52, 1, 64, '2025-02-14', 'hjf', 1, '2025-02-14 10:41:33', '2025-02-14 10:41:33', NULL);
INSERT INTO `relatorios` VALUES (53, 1, 64, '2025-02-14', 'hjf', 1, '2025-02-14 10:52:39', '2025-02-14 10:52:39', NULL);
INSERT INTO `relatorios` VALUES (54, 1, 64, '2025-02-14', 'hjf', 1, '2025-02-14 10:53:40', '2025-02-14 10:53:40', NULL);
INSERT INTO `relatorios` VALUES (55, 1, 63, '2025-02-14', 'teste 1 hj', 1, '2025-02-14 11:07:52', '2025-02-14 11:07:52', NULL);
INSERT INTO `relatorios` VALUES (56, 1, 63, '2025-02-14', 'teste 1 hj', 1, '2025-02-14 11:22:40', '2025-02-14 11:22:40', NULL);
INSERT INTO `relatorios` VALUES (57, 1, 64, '2025-02-19', 'jkghkg', 1, '2025-02-19 11:04:10', '2025-02-19 11:04:10', NULL);
INSERT INTO `relatorios` VALUES (58, 1, 2, '2025-02-19', 'Nada de Mais ', 1, '2025-02-19 11:21:59', '2025-02-19 11:21:59', NULL);
INSERT INTO `relatorios` VALUES (59, 1, 2, '2025-02-19', 'Nada de Mais ', 1, '2025-02-19 11:27:06', '2025-02-19 11:27:06', NULL);
INSERT INTO `relatorios` VALUES (60, 1, 2, '2025-02-19', 'Nada de Mais ', 1, '2025-02-19 11:28:54', '2025-02-19 11:28:54', NULL);

-- ----------------------------
-- Table structure for situacao
-- ----------------------------
DROP TABLE IF EXISTS `situacao`;
CREATE TABLE `situacao`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `operacionabilidade` tinyint(1) NULL DEFAULT 1,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of situacao
-- ----------------------------
INSERT INTO `situacao` VALUES (1, 'GRS', 1, 1, '2024-10-20 10:46:46', '2025-02-19 09:47:52', NULL);
INSERT INTO `situacao` VALUES (2, 'VOIP', 0, 1, '2024-10-20 10:47:03', '2025-02-19 09:56:38', NULL);
INSERT INTO `situacao` VALUES (3, 'Inter', 1, 1, '2025-02-16 22:23:38', '2025-02-19 09:47:54', NULL);
INSERT INTO `situacao` VALUES (4, 'VoIP', 1, 0, '2025-02-18 21:58:50', '2025-02-18 22:03:30', NULL);

-- ----------------------------
-- Table structure for status_radios
-- ----------------------------
DROP TABLE IF EXISTS `status_radios`;
CREATE TABLE `status_radios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `radio_id` int NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT current_timestamp,
  `status` tinyint(1) NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `radio_id`(`radio_id` ASC) USING BTREE,
  CONSTRAINT `status_radios_ibfk_1` FOREIGN KEY (`radio_id`) REFERENCES `radios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status_radios
-- ----------------------------
INSERT INTO `status_radios` VALUES (1, 13, '2024-12-20 12:22:13', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (2, 56, '2024-12-20 12:22:13', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (3, 25, '2024-12-20 12:22:13', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (4, 61, '2024-12-20 12:22:13', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (5, 65, '2024-12-20 12:22:13', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (6, 13, '2024-12-20 12:33:36', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (7, 13, '2024-12-20 12:36:50', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (8, 13, '2024-12-26 12:14:38', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (9, 56, '2024-12-26 12:14:38', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (10, 25, '2024-12-26 12:14:38', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (11, 61, '2024-12-26 12:14:38', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (12, 65, '2024-12-26 12:14:38', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (13, 74, '2024-12-26 12:14:52', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (14, 93, '2024-12-26 12:14:52', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (15, 15, '2024-12-26 12:14:52', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (16, 13, '2025-01-06 13:57:30', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (17, 56, '2025-01-06 13:57:30', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (18, 25, '2025-01-06 13:57:30', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (19, 61, '2025-01-06 13:57:30', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (20, 65, '2025-01-06 13:57:30', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (21, 74, '2025-01-06 13:57:39', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (22, 93, '2025-01-06 13:57:39', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (23, 15, '2025-01-06 13:57:39', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (24, 13, '2025-01-06 13:59:32', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (25, 56, '2025-01-06 13:59:33', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (26, 25, '2025-01-06 13:59:33', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (27, 61, '2025-01-06 13:59:33', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (28, 65, '2025-01-06 13:59:33', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (29, 13, '2025-01-06 13:59:39', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (30, 56, '2025-01-06 13:59:39', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (31, 25, '2025-01-06 13:59:39', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (32, 61, '2025-01-06 13:59:39', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (33, 65, '2025-01-06 13:59:39', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (34, 13, '2025-01-06 13:59:40', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (35, 56, '2025-01-06 13:59:40', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (36, 25, '2025-01-06 13:59:40', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (37, 61, '2025-01-06 13:59:40', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (38, 65, '2025-01-06 13:59:40', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (39, 13, '2025-02-19 11:33:39', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (40, 56, '2025-02-19 11:33:39', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (41, 25, '2025-02-19 11:33:39', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (42, 61, '2025-02-19 11:33:40', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (43, 65, '2025-02-19 11:33:40', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (44, 74, '2025-02-19 11:33:48', 1, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (45, 93, '2025-02-19 11:33:48', 0, 'Usuario Atual');
INSERT INTO `status_radios` VALUES (46, 15, '2025-02-19 11:33:48', 0, 'Usuario Atual');

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
INSERT INTO `tecnicos` VALUES (64, 120, 1, '2024-10-30 12:55:33', '2024-10-30 12:55:33', NULL);

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
INSERT INTO `tipousuario` VALUES (2, 'Tecnico', 'pessoa responsavel por reportar', 1, '2024-09-17 09:38:34', NULL, '2024-10-27 19:45:02');

-- ----------------------------
-- Table structure for turno
-- ----------------------------
DROP TABLE IF EXISTS `turno`;
CREATE TABLE `turno`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp,
  `data_remocao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of turno
-- ----------------------------
INSERT INTO `turno` VALUES (1, '00:00:00', '12:00:00', 'Manhã', 1, '2024-10-30 12:24:28', NULL, '2024-10-30 12:25:37');
INSERT INTO `turno` VALUES (2, '12:00:00', '18:00:00', 'Tarde', 1, '2024-10-30 12:25:11', NULL, '2024-10-30 12:25:11');
INSERT INTO `turno` VALUES (3, '18:00:00', '00:00:00', 'Noite', 1, '2024-10-30 12:25:53', NULL, '2024-10-30 12:26:02');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (1, 1, 'dias', '$2a$10$vsPH8QlmVRUe0xj2sQhi1uLa3FnKnf7AqIJuyNUQGxc5MWXFu3FZy', 1, 1, 1, 1, 1, 1, '2024-09-17 09:39:03', NULL, '2024-09-23 20:23:20');
INSERT INTO `usuario` VALUES (2, 2, 'isana', '$2a$10$4uKMLmfCPJd94plHQI8fYuPZMH9M4r4pzgKfIZ.bpzXcHlqjwIOMa', 2, 0, 1, 1, 0, 0, '2024-09-23 20:26:21', NULL, '2024-10-23 08:50:45');
INSERT INTO `usuario` VALUES (5, 63, 'AJ', '$2a$10$TcHGFCzcBQRU0tFL3fNiDuwZ.SGcSIz.RrpGGbhbv7tJ6LEYjThAy', 2, 1, 1, 1, 1, 1, '2024-10-27 19:49:46', NULL, '2024-10-27 19:49:46');
INSERT INTO `usuario` VALUES (6, 64, 'helisioj', '$2a$10$hDF2nfJyzffNvdYTL.v7rO9C1Cn6UedNji/HqHUlcztE4Vcl8zMsO', 2, 1, 1, 1, 1, 1, '2024-10-30 12:57:17', NULL, '2024-10-30 12:57:17');

-- ----------------------------
-- View structure for view_equipamento
-- ----------------------------
DROP VIEW IF EXISTS `view_equipamento`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_equipamento` AS select `equipamento`.`id` AS `id`,`equipamento`.`equipamentos_id` AS `equipamentos_id`,`equipamento`.`relatorios_id` AS `relatorios_id`,`equipamento`.`quantidade` AS `quantidade`,`equipamento`.`status` AS `status`,`equipamento`.`localizacao` AS `localizacao`,`equipamentos`.`nome` AS `nome`,`equipamento`.`estado` AS `estado` from (`equipamento` join `equipamentos` on((`equipamento`.`equipamentos_id` = `equipamentos`.`id`))); ;

-- ----------------------------
-- View structure for view_metrica_dia
-- ----------------------------
DROP VIEW IF EXISTS `view_metrica_dia`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_metrica_dia` AS SELECT
    g.nome AS grupo_nome, 
    SUM(m.qtds_online) AS total_online, 
    g.qtds AS qtds_fixa, 
    DATE(m.data_criacao) AS data_criacao,  -- Usa apenas a parte da data
    COUNT(DISTINCT m.turno_id) AS entries_count,  -- Conta o número de turnos reportados
    m.estado
FROM
    `métrica` AS m
INNER JOIN
    grupo AS g
ON 
    m.grupo_id = g.id
WHERE
    m.estado = 1
GROUP BY
    g.nome, DATE(m.data_criacao)  -- Agrupa por grupo e data
ORDER BY
    g.nome ASC ;

-- ----------------------------
-- View structure for view_metrica_teste
-- ----------------------------
DROP VIEW IF EXISTS `view_metrica_teste`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_metrica_teste` AS SELECT
    `métrica`.id, 
    `métrica`.grupo_id, 
    `métrica`.turno_id, 
    `métrica`.relatorio_id, 
    `métrica`.qtds_online, 
    `métrica`.qtds_offline, 
    `métrica`.data_criacao
FROM
    `métrica`
WHERE
    DATE(`métrica`.data_criacao) = '2024-12-09' AND turno_id ='1' ;

-- ----------------------------
-- View structure for view_municipios
-- ----------------------------
DROP VIEW IF EXISTS `view_municipios`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_municipios` AS select `municipio`.`id` AS `id`,`municipio`.`nome` AS `nome`,`municipio`.`provincia_id` AS `provincia_id`,`provincia`.`nome` AS `provincia` from (`municipio` join `provincia` on((`municipio`.`provincia_id` = `provincia`.`id`))); ;

-- ----------------------------
-- View structure for view_observacao
-- ----------------------------
DROP VIEW IF EXISTS `view_observacao`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_observacao` AS SELECT
	observacao.id AS id, 
	situacao.nome, 
	observacao.situacao_id AS situacao_id, 
	observacao.relatorios_id AS relatorios_id, 
	observacao.descricao AS descricao, 
	observacao.estado AS estado
FROM
	(
		observacao
		join
		situacao
		ON 
			(
				(
					observacao.situacao_id = situacao.id
				)
			)
	) ;

-- ----------------------------
-- View structure for view_pessoas
-- ----------------------------
DROP VIEW IF EXISTS `view_pessoas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_pessoas` AS select `pessoa`.`id` AS `id`,`pessoa`.`nome` AS `nome`,`pessoa`.`genero` AS `genero`,`pessoa`.`data_nascimento` AS `data_nascimento`,`pessoa`.`imagem` AS `imagem`,`naturalidade`.`nome` AS `naturalidade` from (`pessoa` join `municipio` `naturalidade` on((`pessoa`.`municipio_id` = `naturalidade`.`id`))); ;

-- ----------------------------
-- View structure for view_postos
-- ----------------------------
DROP VIEW IF EXISTS `view_postos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_postos` AS select `postosmilitares`.`Posto_Id` AS `id`,`postosmilitares`.`Posto` AS `posto`,`postosmilitares`.`PostoAbrev` AS `postoAbrev` from `postosmilitares`; ;

-- ----------------------------
-- View structure for view_relatorio
-- ----------------------------
DROP VIEW IF EXISTS `view_relatorio`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_relatorio` AS select `relatorios`.`id` AS `id`,`relatorios`.`tecnico_cessante_id` AS `tecnico_cessante_id`,`relatorios`.`tecnico_entrante_id` AS `tecnico_entrante_id`,`relatorios`.`data_criacao` AS `data_criacao`,`relatorios`.`observacoes_finais` AS `observacoes_finais`,`relatorios`.`estado` AS `estado`,`pcessante`.`nome` AS `cessante`,`pentrante`.`nome` AS `entrante`,`tp_cessante`.`Posto` AS `posto_cessante`,`tp_entrante`.`Posto` AS `posto_entrante` from ((((((`relatorios` join `pessoa` `pcessante` on((`relatorios`.`tecnico_cessante_id` = `pcessante`.`id`))) join `pessoa` `pentrante` on((`relatorios`.`tecnico_entrante_id` = `pentrante`.`id`))) join `tecnicos` `tentrante` on((`pentrante`.`id` = `tentrante`.`id`))) join `tecnicos` `tcessante` on((`pcessante`.`id` = `tcessante`.`id`))) join `postosmilitares` `tp_cessante` on((`tcessante`.`posto_id` = `tp_cessante`.`Posto_Id`))) join `postosmilitares` `tp_entrante` on((`tentrante`.`posto_id` = `tp_entrante`.`Posto_Id`))); ;

-- ----------------------------
-- View structure for view_relatorio_all
-- ----------------------------
DROP VIEW IF EXISTS `view_relatorio_all`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_relatorio_all` AS select `r`.`id` AS `id`,`r`.`data_criacao` AS `data_criacao`,`s`.`nome` AS `Situacao`,group_concat(distinct `o`.`descricao` separator '; ') AS `descricao`,group_concat(distinct `e`.`nome` separator '; ') AS `Meio`,sum(`eq`.`quantidade`) AS `quantidade`,group_concat(distinct `eq`.`status` separator '; ') AS `status`,group_concat(distinct `eq`.`localizacao` separator '; ') AS `localizacao`,`pcessante`.`nome` AS `cessante`,`pentrante`.`nome` AS `entrante`,`tp_cessante`.`Posto` AS `posto_cessante`,`tp_entrante`.`Posto` AS `posto_entrante`,`r`.`estado` AS `estado` from ((((((((((`relatorios` `r` join `equipamento` `eq` on((`r`.`id` = `eq`.`relatorios_id`))) join `observacao` `o` on((`r`.`id` = `o`.`relatorios_id`))) join `situacao` `s` on((`o`.`situacao_id` = `s`.`id`))) join `equipamentos` `e` on((`eq`.`equipamentos_id` = `e`.`id`))) join `pessoa` `pcessante` on((`r`.`tecnico_cessante_id` = `pcessante`.`id`))) join `pessoa` `pentrante` on((`r`.`tecnico_entrante_id` = `pentrante`.`id`))) join `tecnicos` `tcessante` on((`pcessante`.`id` = `tcessante`.`id`))) join `tecnicos` `tentrante` on((`pentrante`.`id` = `tentrante`.`id`))) join `postosmilitares` `tp_cessante` on((`tcessante`.`posto_id` = `tp_cessante`.`Posto_Id`))) join `postosmilitares` `tp_entrante` on((`tentrante`.`posto_id` = `tp_entrante`.`Posto_Id`))) group by `r`.`id`,`r`.`data_criacao`,`s`.`nome`,`pcessante`.`nome`,`pentrante`.`nome`,`tp_cessante`.`Posto`,`tp_entrante`.`Posto`,`r`.`estado`; ;

-- ----------------------------
-- View structure for view_relatorio_grupo
-- ----------------------------
DROP VIEW IF EXISTS `view_relatorio_grupo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_relatorio_grupo` AS select `relatorios`.`id` AS `id`,`relatorios`.`data_criacao` AS `data_criacao`,`situacao`.`nome` AS `Situacao`,group_concat(distinct `observacao`.`descricao` separator ', ') AS `Observacoes`,group_concat(distinct `equipamentos`.`nome` separator ', ') AS `Meios`,group_concat(distinct `equipamento`.`quantidade` separator ', ') AS `Quantidades`,group_concat(distinct `equipamento`.`status` separator ', ') AS `Status`,group_concat(distinct `equipamento`.`localizacao` separator ', ') AS `Localizacoes`,`pcessante`.`nome` AS `cessante`,`pentrante`.`nome` AS `entrante`,`tp_cessante`.`Posto` AS `posto_cessante`,`tp_entrante`.`Posto` AS `posto_entrante` from ((((((((((`relatorios` join `equipamento` on((`relatorios`.`id` = `equipamento`.`relatorios_id`))) join `observacao` on((`relatorios`.`id` = `observacao`.`relatorios_id`))) join `situacao` on((`observacao`.`situacao_id` = `situacao`.`id`))) join `equipamentos` on((`equipamento`.`equipamentos_id` = `equipamentos`.`id`))) join `pessoa` `pcessante` on((`relatorios`.`tecnico_cessante_id` = `pcessante`.`id`))) join `pessoa` `pentrante` on((`relatorios`.`tecnico_entrante_id` = `pentrante`.`id`))) join `tecnicos` `tcessante` on((`pcessante`.`id` = `tcessante`.`id`))) join `tecnicos` `tentrante` on((`pentrante`.`id` = `tentrante`.`id`))) join `postosmilitares` `tp_cessante` on((`tcessante`.`posto_id` = `tp_cessante`.`Posto_Id`))) join `postosmilitares` `tp_entrante` on((`tentrante`.`posto_id` = `tp_entrante`.`Posto_Id`))) group by `relatorios`.`id`,`relatorios`.`data_criacao`,`situacao`.`nome`,`pcessante`.`nome`,`pentrante`.`nome`,`tp_cessante`.`Posto`,`tp_entrante`.`Posto`; ;

-- ----------------------------
-- View structure for view_tecnicos
-- ----------------------------
DROP VIEW IF EXISTS `view_tecnicos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_tecnicos` AS select `pessoa`.`imagem` AS `imagem`,`tecnicos`.`id` AS `id`,`pessoa`.`nome` AS `nome`,`tecnicos`.`posto_id` AS `posto_id`,`tecnicos`.`estado` AS `estado`,`postosmilitares`.`Posto` AS `Posto`,`postosmilitares`.`PostoAbrev` AS `PostoAbrev` from ((`tecnicos` join `pessoa` on((`tecnicos`.`id` = `pessoa`.`id`))) join `postosmilitares` on((`tecnicos`.`posto_id` = `postosmilitares`.`Posto_Id`))); ;

-- ----------------------------
-- View structure for view_user
-- ----------------------------
DROP VIEW IF EXISTS `view_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_user` AS select `usuario`.`id` AS `id`,`usuario`.`pessoa_id` AS `pessoa_id`,`usuario`.`nomeUsuario` AS `nomeUsuario`,`usuario`.`senha` AS `senha`,`usuario`.`tipo_usuario_id` AS `tipo_usuario_id`,`usuario`.`delete_permissao` AS `delete_permissao`,`usuario`.`update_permissao` AS `update_permissao`,`usuario`.`view_permissao` AS `view_permissao`,`usuario`.`create_permissao` AS `create_permissao`,`usuario`.`estado` AS `estado`,`usuario`.`data_criacao` AS `data_criacao`,`usuario`.`data_remocao` AS `data_remocao`,`usuario`.`data_alteracao` AS `data_alteracao`,`pessoa`.`nome` AS `pessoa`,`pessoa`.`imagem` AS `imagem`,`tipousuario`.`nome` AS `tipousuario`,`tipousuario`.`descricao` AS `descricao` from ((`usuario` join `pessoa` on((`usuario`.`pessoa_id` = `pessoa`.`id`))) join `tipousuario` on((`usuario`.`tipo_usuario_id` = `tipousuario`.`id`))) where (`usuario`.`estado` = 1); ;

SET FOREIGN_KEY_CHECKS = 1;
