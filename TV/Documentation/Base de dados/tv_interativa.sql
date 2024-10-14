/*
 Navicat Premium Dump SQL

 Source Server         : bruno
 Source Server Type    : MySQL
 Source Server Version : 80038 (8.0.38)
 Source Host           : localhost:3306
 Source Schema         : tv_interativa

 Target Server Type    : MySQL
 Target Server Version : 80038 (8.0.38)
 File Encoding         : 65001

 Date: 14/10/2024 02:11:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `caminho` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES (4, 'Som do Secreto Vol.3 - Yeshua - (Clipe Oficial) â JosÃ© Jr _ Alessandro Vilas Boa.mp4', '/uploads/1728862727852.mp4', 1, '2024-10-14 00:38:48', '2024-10-14 00:38:48');
INSERT INTO `videos` VALUES (5, 'TRIBL _ Maverick City Worship Compilation.mp4', '/uploads/1728863100379.mp4', 1, '2024-10-14 00:45:01', '2024-10-14 00:45:00');
INSERT INTO `videos` VALUES (6, 'NGROK NA PRATICA _ EXEMPLOS REAIS (1).mp4', '/uploads/1728864964372.mp4', 1, '2024-10-14 01:16:06', '2024-10-14 01:16:05');
INSERT INTO `videos` VALUES (7, 'Nair Nany  - Eu vou orar - Legendado.mp4', '/uploads/1728865074712.mp4', 1, '2024-10-14 01:17:56', '2024-10-14 01:17:55');

SET FOREIGN_KEY_CHECKS = 1;
