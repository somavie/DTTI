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

 Date: 20/10/2024 23:08:32
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
