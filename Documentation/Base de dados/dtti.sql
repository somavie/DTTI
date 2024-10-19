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

 Date: 17/10/2024 23:32:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for equipamento
-- ----------------------------
DROP TABLE IF EXISTS `equipamento`;
CREATE TABLE `equipamento`  (
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
  INDEX `fk_table1_equipamentos1_idx`(`equipamentos_id` ASC) USING BTREE,
  INDEX `fk_equipamento_relatorios1_idx`(`relatorios_id` ASC) USING BTREE,
  CONSTRAINT `fk_equipamento_relatorios1` FOREIGN KEY (`relatorios_id`) REFERENCES `relatorios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_table1_equipamentos1` FOREIGN KEY (`equipamentos_id`) REFERENCES `equipamentos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipamento
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipamentos
-- ----------------------------

-- ----------------------------
-- Table structure for observacao
-- ----------------------------
DROP TABLE IF EXISTS `observacao`;
CREATE TABLE `observacao`  (
  `situacao_id` int NOT NULL,
  `relatorios_id` int NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  INDEX `fk_observacao_situacao1_idx`(`situacao_id` ASC) USING BTREE,
  INDEX `fk_observacao_relatorios1_idx`(`relatorios_id` ASC) USING BTREE,
  CONSTRAINT `fk_observacao_relatorios1` FOREIGN KEY (`relatorios_id`) REFERENCES `relatorios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_observacao_situacao1` FOREIGN KEY (`situacao_id`) REFERENCES `situacao` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of observacao
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posto
-- ----------------------------
INSERT INTO `posto` VALUES (1, 'Soldado', 'SOL', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (2, 'Cabo', 'CAB', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (3, 'Sargento', 'SGT', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (4, 'Segundo-sargento', '2SGT', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (5, 'Primeiro-sargento', '1SGT', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (6, 'Sargento-ajudante', 'SA', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (7, 'Sargento-chefe', 'SC', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (8, 'Aspirante', 'ASP', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (9, 'Alferes', 'ALF', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (10, 'Tenente', 'TEN', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (11, 'Capitão', 'CAP', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (12, 'Major', 'MAJ', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (13, 'Tenente-coronel', 'TC', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (14, 'Coronel', 'COL', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (15, 'General de Brigada', 'GB', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (16, 'General', 'GEN', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (17, 'General do Exército', 'GE', 1, '2024-10-17 06:11:04', '2024-10-17 06:11:04', NULL);
INSERT INTO `posto` VALUES (18, 'Assistente Administrativo', 'ASSADM', 1, '2024-10-17 06:11:11', '2024-10-17 06:11:11', NULL);
INSERT INTO `posto` VALUES (19, 'Técnico Administrativo', 'TECADM', 1, '2024-10-17 06:11:11', '2024-10-17 06:11:11', NULL);
INSERT INTO `posto` VALUES (20, 'Diretor de Departamento', 'DIRDEP', 1, '2024-10-17 06:11:11', '2024-10-17 06:11:11', NULL);
INSERT INTO `posto` VALUES (21, 'Secretário', 'SEC', 1, '2024-10-17 06:11:11', '2024-10-17 06:11:11', NULL);
INSERT INTO `posto` VALUES (22, 'Chefe de Equipa', 'CHEEQU', 1, '2024-10-17 06:11:11', '2024-10-17 06:11:11', NULL);
INSERT INTO `posto` VALUES (23, 'Gerente de Projetos', 'GERPROJ', 1, '2024-10-17 06:11:11', '2024-10-17 06:11:11', NULL);
INSERT INTO `posto` VALUES (24, 'Coordenador', 'COORD', 1, '2024-10-17 06:11:11', '2024-10-17 06:11:11', NULL);
INSERT INTO `posto` VALUES (25, 'Operário', 'OP', 1, '2024-10-17 06:11:11', '2024-10-17 06:11:11', NULL);
INSERT INTO `posto` VALUES (26, 'Engenheiro', 'ENG', 1, '2024-10-17 06:11:11', '2024-10-17 06:11:11', NULL);
INSERT INTO `posto` VALUES (27, 'Arquiteto', 'ARQ', 1, '2024-10-17 06:11:11', '2024-10-17 06:11:11', NULL);

-- ----------------------------
-- Table structure for relatorios
-- ----------------------------
DROP TABLE IF EXISTS `relatorios`;
CREATE TABLE `relatorios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tecnico_cessante_id` int NULL DEFAULT NULL,
  `tecnico_entrante_id` int NULL DEFAULT NULL,
  `data_criacao` date NOT NULL,
  `observacoes_finais` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_remocao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tecnico_cessante_id`(`tecnico_cessante_id` ASC) USING BTREE,
  INDEX `tecnico_entrante_id`(`tecnico_entrante_id` ASC) USING BTREE,
  CONSTRAINT `relatorios_ibfk_1` FOREIGN KEY (`tecnico_cessante_id`) REFERENCES `tecnicos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `relatorios_ibfk_2` FOREIGN KEY (`tecnico_entrante_id`) REFERENCES `tecnicos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of relatorios
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of situacao
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tecnicos
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
