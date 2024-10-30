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

 Date: 30/10/2024 02:19:57
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
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipamento
-- ----------------------------
INSERT INTO `equipamento` VALUES (1, 1, 1, 2, 'Bom', 'sala do tecnico dia', NULL, 1, '2024-10-20 12:02:22', '2024-10-20 12:02:22', NULL);
INSERT INTO `equipamento` VALUES (2, 2, 1, 1, 'Bom', 'Sala do Tecnico Dia', NULL, 1, '2024-10-20 12:02:22', '2024-10-20 12:02:22', NULL);
INSERT INTO `equipamento` VALUES (3, 1, 2, 2, 'Mau', 'Sala Tecnico Dia', NULL, 1, '2024-10-20 12:09:19', '2024-10-20 12:09:19', NULL);
INSERT INTO `equipamento` VALUES (4, 2, 2, 2, 'Bom', 'Sala do Tecnico Dia', NULL, 1, '2024-10-20 12:09:19', '2024-10-20 12:09:19', NULL);
INSERT INTO `equipamento` VALUES (124, 2, 30, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-28 11:24:39', '2024-10-28 11:24:39', NULL);
INSERT INTO `equipamento` VALUES (125, 1, 30, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-28 11:24:39', '2024-10-28 11:24:39', NULL);
INSERT INTO `equipamento` VALUES (126, 2, 31, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-28 12:09:37', '2024-10-28 12:09:37', NULL);
INSERT INTO `equipamento` VALUES (127, 1, 31, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-28 12:09:37', '2024-10-28 12:09:37', NULL);
INSERT INTO `equipamento` VALUES (128, 2, 32, 1, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-28 12:17:30', '2024-10-28 12:17:30', NULL);
INSERT INTO `equipamento` VALUES (129, 2, 33, 1, 'Bom', 'sala oda', NULL, 1, '2024-10-28 12:46:13', '2024-10-28 12:46:13', NULL);
INSERT INTO `equipamento` VALUES (130, 2, 34, 1, 'Bom', 'sala oda', NULL, 1, '2024-10-28 12:47:14', '2024-10-28 12:47:14', NULL);
INSERT INTO `equipamento` VALUES (131, 3, 35, 2, 'Bom', 'Srbac', NULL, 1, '2024-10-28 14:30:36', '2024-10-28 14:30:36', NULL);
INSERT INTO `equipamento` VALUES (132, 2, 36, 2, 'Bom', 'kijhgfddsgf', NULL, 1, '2024-10-28 14:37:41', '2024-10-28 14:37:41', NULL);
INSERT INTO `equipamento` VALUES (133, 2, 37, 2, 'Bom', 'kijhgfddsgf', NULL, 1, '2024-10-28 14:46:05', '2024-10-28 14:46:05', NULL);
INSERT INTO `equipamento` VALUES (134, 1, 40, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-28 16:11:37', '2024-10-28 16:11:37', NULL);
INSERT INTO `equipamento` VALUES (135, 1, 41, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-28 21:27:22', '2024-10-28 21:27:22', NULL);
INSERT INTO `equipamento` VALUES (136, 1, 42, 2, 'Bom', 'Sala Tecnica', NULL, 1, '2024-10-29 09:17:09', '2024-10-29 09:17:09', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of observacao
-- ----------------------------
INSERT INTO `observacao` VALUES (1, 1, 1, 'a Rede GRS se encontra estavel e operacional ', 1, '2024-10-20 12:02:22', '2024-10-20 12:02:22', NULL);
INSERT INTO `observacao` VALUES (2, 2, 1, 'A rede de Telefonia Voip se encontra operacional e nao tem neenhum problema isso significca que a Ms telecom esta funcional e usada da para falar com a parte interna e externa', 1, '2024-10-20 12:02:22', '2024-10-20 12:02:22', NULL);
INSERT INTO `observacao` VALUES (3, 1, 2, 'tudo operacional', 1, '2024-10-20 12:09:19', '2024-10-20 12:09:19', NULL);
INSERT INTO `observacao` VALUES (4, 2, 2, 'tudo operacional', 1, '2024-10-20 12:09:19', '2024-10-20 12:09:19', NULL);
INSERT INTO `observacao` VALUES (132, 2, 30, 'Sistema Voip Normal ', 1, '2024-10-28 11:24:38', '2024-10-28 11:24:38', NULL);
INSERT INTO `observacao` VALUES (133, 1, 30, 'Sistema GRS Normal', 1, '2024-10-28 11:24:39', '2024-10-28 11:24:39', NULL);
INSERT INTO `observacao` VALUES (134, 2, 31, 'Sistema Voip Normal ', 1, '2024-10-28 12:09:37', '2024-10-28 12:09:37', NULL);
INSERT INTO `observacao` VALUES (135, 1, 31, 'Sistema GRS Normal', 1, '2024-10-28 12:09:37', '2024-10-28 12:09:37', NULL);
INSERT INTO `observacao` VALUES (136, 1, 32, 'Bom', 1, '2024-10-28 12:17:30', '2024-10-28 12:17:30', NULL);
INSERT INTO `observacao` VALUES (137, 2, 32, 'Baixa', 1, '2024-10-28 12:17:30', '2024-10-28 12:17:30', NULL);
INSERT INTO `observacao` VALUES (138, 2, 33, 'testre', 1, '2024-10-28 12:46:13', '2024-10-28 12:46:13', NULL);
INSERT INTO `observacao` VALUES (139, 1, 33, 'optimo', 1, '2024-10-28 12:46:13', '2024-10-28 12:46:13', NULL);
INSERT INTO `observacao` VALUES (140, 2, 34, 'testre', 1, '2024-10-28 12:47:14', '2024-10-28 12:47:14', NULL);
INSERT INTO `observacao` VALUES (141, 1, 34, 'optimo', 1, '2024-10-28 12:47:14', '2024-10-28 12:47:14', NULL);
INSERT INTO `observacao` VALUES (142, 1, 35, 'AAAAAAAAAAAAAAAAA', 1, '2024-10-28 14:30:36', '2024-10-28 14:30:36', NULL);
INSERT INTO `observacao` VALUES (143, 1, 36, 'fdsfjlç', 1, '2024-10-28 14:37:41', '2024-10-28 14:37:41', NULL);
INSERT INTO `observacao` VALUES (144, 1, 37, 'fdsfjlç', 1, '2024-10-28 14:46:05', '2024-10-28 14:46:05', NULL);
INSERT INTO `observacao` VALUES (145, 2, 40, 'AAAAAAAAAAAAA', 1, '2024-10-28 16:11:37', '2024-10-28 16:11:37', NULL);
INSERT INTO `observacao` VALUES (146, 1, 41, 'Muito Bom', 1, '2024-10-28 21:27:22', '2024-10-28 21:27:22', NULL);
INSERT INTO `observacao` VALUES (147, 2, 42, 'Muito Bom', 1, '2024-10-29 09:17:09', '2024-10-29 09:17:09', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of relatorios
-- ----------------------------
INSERT INTO `relatorios` VALUES (1, 1, 2, '2024-10-20', 'os sistemas foram todos assegurdos duarante as minhas 24 horas', 1, '2024-10-20 11:59:40', '2024-10-26 23:22:08', NULL);
INSERT INTO `relatorios` VALUES (2, 1, 2, '2024-10-20', 'tudo funcionouu plenamente durante as 24 horas', 1, '2024-10-20 12:07:51', '2024-10-26 23:22:19', NULL);
INSERT INTO `relatorios` VALUES (3, 2, 1, '2024-10-20', 'hjkljkl', 1, '2024-10-20 15:52:11', '2024-10-26 23:22:29', NULL);
INSERT INTO `relatorios` VALUES (30, NULL, NULL, NULL, NULL, 1, '2024-10-28 11:24:38', '2024-10-28 11:24:38', NULL);
INSERT INTO `relatorios` VALUES (31, NULL, 1, '2024-10-28', 'Durante as 24h não se Registrou qualquer ocorrencia', 1, '2024-10-28 12:09:37', '2024-10-28 12:09:37', NULL);
INSERT INTO `relatorios` VALUES (32, NULL, 2, '2024-10-28', 'Sem problemas', 1, '2024-10-28 12:17:30', '2024-10-28 12:17:30', NULL);
INSERT INTO `relatorios` VALUES (33, NULL, NULL, '2024-10-28', 'nada consta', 1, '2024-10-28 12:46:13', '2024-10-28 12:46:13', NULL);
INSERT INTO `relatorios` VALUES (34, NULL, 2, '2024-10-28', 'nada consta', 1, '2024-10-28 12:47:14', '2024-10-28 12:47:14', NULL);
INSERT INTO `relatorios` VALUES (35, NULL, 2, '2024-10-28', 'Sdfrdhtgyjt', 1, '2024-10-28 14:30:36', '2024-10-28 14:30:36', NULL);
INSERT INTO `relatorios` VALUES (36, NULL, 63, '2024-10-28', 'bnhfghchcccgcccg', 1, '2024-10-28 14:37:41', '2024-10-28 14:37:41', NULL);
INSERT INTO `relatorios` VALUES (37, 2, 63, '2024-10-28', 'bnhfghchcccgcccg', 1, '2024-10-28 14:46:05', '2024-10-28 14:46:05', NULL);
INSERT INTO `relatorios` VALUES (38, NULL, 63, '2024-10-28', 'n,nn,', 1, '2024-10-28 15:56:39', '2024-10-28 15:56:39', NULL);
INSERT INTO `relatorios` VALUES (39, 1, 2, '2024-10-28', 'm,mnk,', 1, '2024-10-28 15:59:42', '2024-10-28 15:59:42', NULL);
INSERT INTO `relatorios` VALUES (40, 63, 1, '2024-10-28', 'Nada consta', 1, '2024-10-28 16:11:37', '2024-10-28 16:11:37', NULL);
INSERT INTO `relatorios` VALUES (41, 63, 2, '2024-10-28', 'Tudo Normal', 1, '2024-10-28 21:27:22', '2024-10-28 21:27:22', NULL);
INSERT INTO `relatorios` VALUES (42, 63, 2, '2024-10-29', 'Tudo Normal', 1, '2024-10-29 09:17:09', '2024-10-29 09:17:09', NULL);

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
INSERT INTO `tipousuario` VALUES (2, 'Tecnico', 'pessoa responsavel por reportar', 1, '2024-09-17 09:38:34', NULL, '2024-10-27 19:45:02');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (1, 1, 'dias', '$2a$10$vsPH8QlmVRUe0xj2sQhi1uLa3FnKnf7AqIJuyNUQGxc5MWXFu3FZy', 1, 1, 1, 1, 1, 1, '2024-09-17 09:39:03', NULL, '2024-09-23 20:23:20');
INSERT INTO `usuario` VALUES (2, 2, 'isana', '$2a$10$vsPH8QlmVRUe0xj2sQhi1uLa3FnKnf7AqIJuyNUQGxc5MWXFu3FZy', 2, 0, 1, 1, 0, 0, '2024-09-23 20:26:21', NULL, '2024-10-28 13:01:01');
INSERT INTO `usuario` VALUES (5, 63, 'AJ', '$2a$10$TcHGFCzcBQRU0tFL3fNiDuwZ.SGcSIz.RrpGGbhbv7tJ6LEYjThAy', 2, 1, 1, 1, 1, 1, '2024-10-27 19:49:46', NULL, '2024-10-27 19:49:46');

-- ----------------------------
-- View structure for view_equipamento
-- ----------------------------
DROP VIEW IF EXISTS `view_equipamento`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_equipamento` AS select `equipamento`.`id` AS `id`,`equipamento`.`equipamentos_id` AS `equipamentos_id`,`equipamento`.`relatorios_id` AS `relatorios_id`,`equipamento`.`quantidade` AS `quantidade`,`equipamento`.`status` AS `status`,`equipamento`.`localizacao` AS `localizacao`,`equipamentos`.`nome` AS `nome`,`equipamento`.`estado` AS `estado` from (`equipamento` join `equipamentos` on((`equipamento`.`equipamentos_id` = `equipamentos`.`id`))); ;

-- ----------------------------
-- View structure for view_municipios
-- ----------------------------
DROP VIEW IF EXISTS `view_municipios`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_municipios` AS select `municipio`.`id` AS `id`,`municipio`.`nome` AS `nome`,`municipio`.`provincia_id` AS `provincia_id`,`provincia`.`nome` AS `provincia` from (`municipio` join `provincia` on((`municipio`.`provincia_id` = `provincia`.`id`))); ;

-- ----------------------------
-- View structure for view_observacao
-- ----------------------------
DROP VIEW IF EXISTS `view_observacao`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_observacao` AS select `observacao`.`id` AS `id`,`observacao`.`situacao_id` AS `situacao_id`,`observacao`.`relatorios_id` AS `relatorios_id`,`observacao`.`descricao` AS `descricao`,`situacao`.`nome` AS `nome`,`observacao`.`estado` AS `estado` from (`observacao` join `situacao` on((`observacao`.`situacao_id` = `situacao`.`id`))); ;

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
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_relatorio` AS SELECT
	relatorios.id AS id, 
	relatorios.tecnico_cessante_id AS tecnico_cessante_id, 
	relatorios.tecnico_entrante_id AS tecnico_entrante_id, 
	relatorios.data_criacao AS data_criacao, 
	relatorios.observacoes_finais AS observacoes_finais, 
	relatorios.estado AS estado, 
	pcessante.nome AS cessante, 
	pentrante.nome AS entrante, 
	tp_cessante.Posto AS posto_cessante, 
	tp_entrante.Posto AS posto_entrante
FROM
	(
		(
			(
				(
					(
						(
							relatorios
							join
							pessoa AS pcessante
							ON 
								(
									(
										relatorios.tecnico_cessante_id = pcessante.id
									)
								)
						)
						join
						pessoa AS pentrante
						ON 
							(
								(
									relatorios.tecnico_entrante_id = pentrante.id
								)
							)
					)
					join
					tecnicos AS tentrante
					ON 
						(
							(
								pentrante.id = tentrante.id
							)
						)
				)
				join
				tecnicos AS tcessante
				ON 
					(
						(
							pcessante.id = tcessante.id
						)
					)
			)
			join
			postosmilitares AS tp_cessante
			ON 
				(
					(
						tcessante.posto_id = tp_cessante.Posto_Id
					)
				)
		)
		join
		postosmilitares AS tp_entrante
		ON 
			(
				(
					tentrante.posto_id = tp_entrante.Posto_Id
				)
			)
	)
ORDER BY
	data_criacao DESC ;

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
