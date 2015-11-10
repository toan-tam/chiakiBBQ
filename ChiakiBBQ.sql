/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : chiakibbq

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-11-10 08:34:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for datmon
-- ----------------------------
DROP TABLE IF EXISTS `datmon`;
CREATE TABLE `datmon` (
  `IdDatMon` int(11) NOT NULL AUTO_INCREMENT,
  `IdMon` int(11) DEFAULT NULL,
  `TenBan` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoLuong` int(3) DEFAULT NULL,
  `TrangThai` int(1) DEFAULT '0',
  `TGKhachDat` datetime DEFAULT CURRENT_TIMESTAMP,
  `TGKhachNhan` datetime DEFAULT CURRENT_TIMESTAMP,
  `TraBan` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`IdDatMon`),
  KEY `datmon_mon_1` (`IdMon`),
  KEY `datmon_dsban_1` (`TenBan`),
  CONSTRAINT `datmon_dsban_1` FOREIGN KEY (`TenBan`) REFERENCES `dsban` (`TenBan`),
  CONSTRAINT `datmon_mon_1` FOREIGN KEY (`IdMon`) REFERENCES `mon` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of datmon
-- ----------------------------

-- ----------------------------
-- Table structure for dsban
-- ----------------------------
DROP TABLE IF EXISTS `dsban`;
CREATE TABLE `dsban` (
  `TenBan` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `Mau` varchar(7) COLLATE utf8_unicode_ci DEFAULT '#f6f6f6',
  `LamMoi` int(1) DEFAULT '0',
  PRIMARY KEY (`TenBan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dsban
-- ----------------------------
INSERT INTO `dsban` VALUES ('101', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('102', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('103', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('104', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('105', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('106', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('107', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('108', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('109', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('201', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('202', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('203', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('204', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('205', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('206', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('207', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('208', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('209', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('301', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('302', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('303', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('304', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('305', '#f6f6f6', '0');

-- ----------------------------
-- Table structure for loaimon
-- ----------------------------
DROP TABLE IF EXISTS `loaimon`;
CREATE TABLE `loaimon` (
  `IdLoaiMon` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiMon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IdLoaiMon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of loaimon
-- ----------------------------
INSERT INTO `loaimon` VALUES ('1', 'Khác');
INSERT INTO `loaimon` VALUES ('2', 'Nước giải khát');
INSERT INTO `loaimon` VALUES ('3', 'Món luộc');

-- ----------------------------
-- Table structure for mon
-- ----------------------------
DROP TABLE IF EXISTS `mon`;
CREATE TABLE `mon` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TenMon` varchar(100) CHARACTER SET utf8 NOT NULL,
  `IdLoaiMon` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Mon_LoaiMon` (`IdLoaiMon`),
  CONSTRAINT `Mon_LoaiMon` FOREIGN KEY (`IdLoaiMon`) REFERENCES `loaimon` (`IdLoaiMon`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of mon
-- ----------------------------
INSERT INTO `mon` VALUES ('1', 'Ba chỉ luộc', '3');
INSERT INTO `mon` VALUES ('2', 'Rau củ luộc', '3');
INSERT INTO `mon` VALUES ('3', 'Mỳ xào', '1');
INSERT INTO `mon` VALUES ('4', 'Cơm rang', '1');
INSERT INTO `mon` VALUES ('5', 'Coca cola', '2');
INSERT INTO `mon` VALUES ('6', 'Sushi', '1');
INSERT INTO `mon` VALUES ('7', 'Kim chi', '1');
