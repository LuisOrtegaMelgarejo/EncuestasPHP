/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : encuesta

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-07-03 18:26:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin@gmail.com', 'admin');

-- ----------------------------
-- Table structure for tb_encuesta
-- ----------------------------
DROP TABLE IF EXISTS `tb_encuesta`;
CREATE TABLE `tb_encuesta` (
  `id_encuesta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c_nombre_encuesta` varchar(150) DEFAULT NULL,
  `d_borrado` datetime DEFAULT NULL,
  PRIMARY KEY (`id_encuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_encuesta
-- ----------------------------

-- ----------------------------
-- Table structure for tb_encuesta_bloque
-- ----------------------------
DROP TABLE IF EXISTS `tb_encuesta_bloque`;
CREATE TABLE `tb_encuesta_bloque` (
  `id_bloque` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) NOT NULL,
  `n_orden_bloque` int(11) DEFAULT NULL,
  `c_nombre_bloque` varchar(150) DEFAULT NULL,
  `d_borrado_bloque` datetime DEFAULT NULL,
  PRIMARY KEY (`id_bloque`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_encuesta_bloque
-- ----------------------------

-- ----------------------------
-- Table structure for tb_encuesta_pregunta
-- ----------------------------
DROP TABLE IF EXISTS `tb_encuesta_pregunta`;
CREATE TABLE `tb_encuesta_pregunta` (
  `id_pregunta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) NOT NULL,
  `id_bloque` int(11) DEFAULT NULL,
  `c_tipo_pregunta` varchar(2) NOT NULL DEFAULT 'SS' COMMENT 'SS: Seleccion Simple',
  `n_orden_pregunta` int(11) DEFAULT NULL,
  `c_titulo_pregunta` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_detalle_pregunta` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `d_borrado_pregunta` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_encuesta_pregunta
-- ----------------------------

-- ----------------------------
-- Table structure for tb_encuesta_pregunta_opcion
-- ----------------------------
DROP TABLE IF EXISTS `tb_encuesta_pregunta_opcion`;
CREATE TABLE `tb_encuesta_pregunta_opcion` (
  `id_opcion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pregunta` int(11) NOT NULL,
  `id_encuesta` int(11) NOT NULL,
  `n_orden_opcion` int(11) DEFAULT NULL,
  `c_detalle_opcion` varchar(250) DEFAULT NULL,
  `c_tipo_opcion` varchar(2) NOT NULL DEFAULT 'OS' COMMENT 'OS: Opcion Simple',
  `n_valor` double(8,2) NOT NULL DEFAULT '0.00',
  `d_borrado_opcion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_encuesta_pregunta_opcion
-- ----------------------------

-- ----------------------------
-- Table structure for tb_encuesta_respuesta
-- ----------------------------
DROP TABLE IF EXISTS `tb_encuesta_respuesta`;
CREATE TABLE `tb_encuesta_respuesta` (
  `id_encuesta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(11) NOT NULL,
  `d_inicio_encuesta` datetime NOT NULL,
  `d_fin_encuesta` datetime NOT NULL,
  `c_estado` char(1) NOT NULL DEFAULT 'A' COMMENT 'Abierto,Cerrado',
  PRIMARY KEY (`id_encuesta`,`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_encuesta_respuesta
-- ----------------------------

-- ----------------------------
-- Table structure for tb_encuesta_respuesta_opcion
-- ----------------------------
DROP TABLE IF EXISTS `tb_encuesta_respuesta_opcion`;
CREATE TABLE `tb_encuesta_respuesta_opcion` (
  `id_respuesta_opcion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_opcion` int(11) NOT NULL,
  `d_registro` datetime NOT NULL,
  PRIMARY KEY (`id_respuesta_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_encuesta_respuesta_opcion
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(100) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user@gmail.com', 'user', 'User', 'User', '123456');
