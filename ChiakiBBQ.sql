SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for datmon
-- ----------------------------
CREATE database IF NOT EXISTS  chiakibbq;

DROP TABLE IF EXISTS `datmon`;
CREATE TABLE `datmon` (
  `IdDatMon` int(11) NOT NULL AUTO_INCREMENT,
  `IdMon` int(11) DEFAULT NULL,
  `TenBan` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoLuong` int(3) DEFAULT NULL,
  `TrangThai` int(1) DEFAULT '0',
  `TGKhachDat` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `TGKhachNhan` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `TraBan` boolean default false,
  PRIMARY KEY (`IdDatMon`),
  CONSTRAINT `datmon_mon_1` FOREIGN KEY (`IdMon`) REFERENCES `mon` (`Id`),
  CONSTRAINT `datmon_dsban_1` FOREIGN KEY (`TenBan`) REFERENCES `dsban` (`TenBan`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for dsban
-- ----------------------------
DROP TABLE IF EXISTS `dsban`;
CREATE TABLE `dsban` (
  `TenBan` varchar(3) COLLATE utf8_unicode_ci NOT NULL PRIMARY KEY,
  `Mau` varchar(7) DEFAULT '#f6f6f6',
  `LamMoi` int(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for mon
-- ----------------------------
DROP TABLE IF EXISTS `mon`;
CREATE TABLE `mon` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TenMon` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


insert into Mon(Tenmon) values('Ba chỉ luộc');
insert into Mon(Tenmon) values('Rau củ luộc');
insert into Mon(Tenmon) values('Mỳ xào');
insert into Mon(Tenmon) values('Cơm rang');
insert into Mon(Tenmon) values('Coca cola');
insert into Mon(Tenmon) values('Susi');
insert into Mon(Tenmon) values('Kim chi');

insert into dsban(TenBan) values('101');
insert into dsban(TenBan) values('102');
insert into dsban(TenBan) values('103');
insert into dsban(TenBan) values('104');
insert into dsban(TenBan) values('105');
insert into dsban(TenBan) values('106');
insert into dsban(TenBan) values('107');
insert into dsban(TenBan) values('108');
insert into dsban(TenBan) values('109');
insert into dsban(TenBan) values('201');
insert into dsban(TenBan) values('202');
insert into dsban(TenBan) values('203');
insert into dsban(TenBan) values('204');
insert into dsban(TenBan) values('205');
insert into dsban(TenBan) values('206');
insert into dsban(TenBan) values('207');
insert into dsban(TenBan) values('208');
insert into dsban(TenBan) values('209');