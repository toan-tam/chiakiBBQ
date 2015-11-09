/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : chiakibbq

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-11-09 11:56:30
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of datmon
-- ----------------------------
INSERT INTO `datmon` VALUES ('6', '5', '101', '2', '4', '2015-11-01 08:48:42', '2015-11-02 09:57:34', '1');
INSERT INTO `datmon` VALUES ('7', '4', '101', '2', '4', '2015-11-01 08:58:11', '2015-11-02 09:57:41', '1');
INSERT INTO `datmon` VALUES ('8', '5', '101', '3', '4', '2015-11-02 10:01:05', '2015-11-02 10:10:28', '1');
INSERT INTO `datmon` VALUES ('9', '5', '102', '2', '4', '2015-11-02 10:22:25', '2015-11-02 10:44:38', '1');
INSERT INTO `datmon` VALUES ('10', '5', '101', '4', '4', '2015-11-02 10:48:17', '2015-11-02 10:50:24', '1');
INSERT INTO `datmon` VALUES ('13', '3', '101', '3', '0', '2015-11-02 10:50:29', '2015-11-02 10:50:29', '1');
INSERT INTO `datmon` VALUES ('14', '7', '101', '3', '0', '2015-11-02 10:50:48', '2015-11-02 10:50:48', '1');
INSERT INTO `datmon` VALUES ('15', '5', '101', '3', '0', '2015-11-02 10:51:04', '2015-11-02 10:51:04', '1');
INSERT INTO `datmon` VALUES ('16', '4', '101', '3', '0', '2015-11-02 10:52:54', '2015-11-02 10:52:54', '1');
INSERT INTO `datmon` VALUES ('17', '7', '102', '3', '4', '2015-11-02 10:53:08', '2015-11-02 10:56:03', '1');
INSERT INTO `datmon` VALUES ('18', '7', '102', '3', '4', '2015-11-02 10:53:56', '2015-11-02 10:56:05', '1');
INSERT INTO `datmon` VALUES ('20', '3', '101', '3', '4', '2015-11-02 10:57:06', '2015-11-02 10:57:22', '1');
INSERT INTO `datmon` VALUES ('21', '1', '101', '3', '4', '2015-11-02 10:57:09', '2015-11-02 10:57:21', '1');
INSERT INTO `datmon` VALUES ('23', '4', '101', '3', '4', '2015-11-02 10:58:05', '2015-11-02 10:58:10', '1');
INSERT INTO `datmon` VALUES ('26', '3', '101', '3', '4', '2015-11-02 11:01:33', '2015-11-02 11:01:38', '1');
INSERT INTO `datmon` VALUES ('27', '7', '102', '4', '4', '2015-11-02 11:03:20', '2015-11-02 14:41:55', '1');
INSERT INTO `datmon` VALUES ('28', '5', '101', '1', '4', '2015-11-02 14:42:29', '2015-11-02 14:42:42', '1');
INSERT INTO `datmon` VALUES ('29', '5', '102', '3', '4', '2015-11-02 16:03:56', '2015-11-02 16:35:15', '1');
INSERT INTO `datmon` VALUES ('30', '1', '102', '3', '4', '2015-11-02 16:04:01', '2015-11-02 17:19:54', '1');
INSERT INTO `datmon` VALUES ('38', '1', '102', '4', '4', '2015-11-02 17:15:29', '2015-11-02 17:19:55', '1');
INSERT INTO `datmon` VALUES ('39', '1', '102', '2', '4', '2015-11-02 17:15:32', '2015-11-02 17:19:56', '1');
INSERT INTO `datmon` VALUES ('40', '4', '102', '4', '4', '2015-11-02 17:15:40', '2015-11-02 17:19:56', '1');
INSERT INTO `datmon` VALUES ('41', '3', '102', '2', '4', '2015-11-02 17:15:44', '2015-11-02 17:19:58', '1');
INSERT INTO `datmon` VALUES ('42', '7', '102', '2', '4', '2015-11-02 17:16:39', '2015-11-02 17:19:59', '1');
INSERT INTO `datmon` VALUES ('43', '3', '102', '3', '4', '2015-11-02 17:16:45', '2015-11-02 17:19:53', '1');
INSERT INTO `datmon` VALUES ('44', '6', '102', '3', '4', '2015-11-02 17:18:10', '2015-11-02 17:19:52', '1');
INSERT INTO `datmon` VALUES ('45', '7', '102', '2', '4', '2015-11-02 17:18:24', '2015-11-02 17:19:50', '1');
INSERT INTO `datmon` VALUES ('46', '4', '101', '3', '1', '2015-11-02 17:35:47', '2015-11-02 17:35:47', '0');
INSERT INTO `datmon` VALUES ('47', '5', '101', '2', '2', '2015-11-02 19:02:21', '2015-11-02 19:02:21', '0');
INSERT INTO `datmon` VALUES ('48', '1', '101', '1', '2', '2015-11-02 19:25:10', '2015-11-02 19:25:10', '0');
INSERT INTO `datmon` VALUES ('49', '1', '101', '3', '2', '2015-11-02 19:26:08', '2015-11-02 19:26:08', '0');
INSERT INTO `datmon` VALUES ('50', '5', '102', '2', '2', '2015-11-02 19:35:41', '2015-11-02 19:35:41', '0');
INSERT INTO `datmon` VALUES ('51', '5', '102', '2', '1', '2015-11-02 19:41:26', '2015-11-02 19:41:26', '0');
INSERT INTO `datmon` VALUES ('52', '6', '103', '3', '2', '2015-11-05 17:16:29', '2015-11-05 17:16:29', '0');
INSERT INTO `datmon` VALUES ('53', '3', '103', '2', '2', '2015-11-05 17:16:41', '2015-11-05 17:16:41', '0');
INSERT INTO `datmon` VALUES ('54', '1', '104', '3', '4', '2015-11-05 17:17:17', '2015-11-05 17:17:57', '0');
INSERT INTO `datmon` VALUES ('55', '7', '104', '4', '2', '2015-11-05 17:17:37', '2015-11-05 17:17:37', '0');
INSERT INTO `datmon` VALUES ('57', '2', '105', '34', '4', '2015-11-05 17:33:32', '2015-11-08 23:48:06', '1');
INSERT INTO `datmon` VALUES ('58', '6', '105', '3', '4', '2015-11-05 17:33:37', '2015-11-08 23:48:07', '1');
INSERT INTO `datmon` VALUES ('59', '7', '201', '2', '1', '2015-11-05 17:35:42', '2015-11-05 17:35:42', '0');
INSERT INTO `datmon` VALUES ('60', '1', '202', '3', '4', '2015-11-05 17:38:34', '2015-11-05 17:39:07', '0');
INSERT INTO `datmon` VALUES ('61', '1', '106', '2', '2', '2015-11-05 17:38:40', '2015-11-05 17:38:40', '0');
INSERT INTO `datmon` VALUES ('63', '7', '105', '1', '1', '2015-11-09 00:02:43', '2015-11-09 00:02:43', '0');
INSERT INTO `datmon` VALUES ('64', '1', '103', '1', '0', '2015-11-09 01:04:45', '2015-11-09 01:04:45', '0');
INSERT INTO `datmon` VALUES ('65', '4', '102', '1', '0', '2015-11-09 10:27:46', '2015-11-09 10:27:46', '0');
INSERT INTO `datmon` VALUES ('66', '2', '101', '1', '0', '2015-11-09 10:32:12', '2015-11-09 10:32:12', '0');
INSERT INTO `datmon` VALUES ('67', '7', '102', '1', '0', '2015-11-09 10:32:27', '2015-11-09 10:32:27', '0');
INSERT INTO `datmon` VALUES ('68', '3', '102', '3', '0', '2015-11-09 10:34:05', '2015-11-09 10:34:05', '0');
INSERT INTO `datmon` VALUES ('69', '1', '102', '1', '0', '2015-11-09 10:34:18', '2015-11-09 10:34:18', '0');
INSERT INTO `datmon` VALUES ('70', '1', '104', '1', '0', '2015-11-09 10:42:19', '2015-11-09 10:42:19', '0');
INSERT INTO `datmon` VALUES ('71', '1', '104', '1', '0', '2015-11-09 10:42:38', '2015-11-09 10:42:38', '0');
INSERT INTO `datmon` VALUES ('72', '1', '104', '1', '0', '2015-11-09 10:42:46', '2015-11-09 10:42:46', '0');
INSERT INTO `datmon` VALUES ('73', '2', '101', '1', '0', '2015-11-09 10:43:43', '2015-11-09 10:43:43', '0');
INSERT INTO `datmon` VALUES ('74', '5', '101', '1', '0', '2015-11-09 10:44:03', '2015-11-09 10:44:03', '0');
INSERT INTO `datmon` VALUES ('75', '6', '101', '1', '0', '2015-11-09 10:44:08', '2015-11-09 10:44:08', '0');
INSERT INTO `datmon` VALUES ('76', '1', '101', '1', '0', '2015-11-09 11:14:28', '2015-11-09 11:14:28', '0');
INSERT INTO `datmon` VALUES ('77', '1', '108', '1', '0', '2015-11-09 11:16:42', '2015-11-09 11:16:42', '0');
INSERT INTO `datmon` VALUES ('78', '1', '109', '1', '0', '2015-11-09 11:19:35', '2015-11-09 11:19:35', '0');
INSERT INTO `datmon` VALUES ('79', '1', '107', '1', '0', '2015-11-09 11:35:17', '2015-11-09 11:35:17', '0');
INSERT INTO `datmon` VALUES ('80', '7', '101', '2', '0', '2015-11-09 11:53:47', '2015-11-09 11:53:47', '0');
INSERT INTO `datmon` VALUES ('81', '5', '101', '3', '0', '2015-11-09 11:54:10', '2015-11-09 11:54:10', '0');

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
INSERT INTO `dsban` VALUES ('101', 'red', '1');
INSERT INTO `dsban` VALUES ('102', 'red', '3');
INSERT INTO `dsban` VALUES ('103', 'red', '1');
INSERT INTO `dsban` VALUES ('104', 'red', '3');
INSERT INTO `dsban` VALUES ('105', 'red', '3');
INSERT INTO `dsban` VALUES ('106', 'red', '1');
INSERT INTO `dsban` VALUES ('107', 'red', '1');
INSERT INTO `dsban` VALUES ('108', 'red', '1');
INSERT INTO `dsban` VALUES ('109', 'red', '3');
INSERT INTO `dsban` VALUES ('201', 'red', '3');
INSERT INTO `dsban` VALUES ('202', 'red', '3');
INSERT INTO `dsban` VALUES ('203', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('204', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('205', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('206', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('207', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('208', '#f6f6f6', '0');
INSERT INTO `dsban` VALUES ('209', '#f6f6f6', '0');

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
