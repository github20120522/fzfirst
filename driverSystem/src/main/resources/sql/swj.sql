/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50155
Source Host           : localhost:3306
Source Database       : swj

Target Server Type    : MYSQL
Target Server Version : 50155
File Encoding         : 65001

Date: 2012-03-15 19:03:25
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `driver_bill`
-- ----------------------------
DROP TABLE IF EXISTS `driver_bill`;
CREATE TABLE `driver_bill` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `driverid` varchar(20) NOT NULL,
  `billcode` varchar(20) NOT NULL,
  `userid` int(20) NOT NULL,
  `createtime` varchar(15) NOT NULL,
  `price` double(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_userid2` (`userid`),
  KEY `pk_driverid` (`driverid`),
  CONSTRAINT `pk_driverid` FOREIGN KEY (`driverid`) REFERENCES `driver_info` (`id`),
  CONSTRAINT `pk_userid2` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driver_bill
-- ----------------------------
INSERT INTO `driver_bill` VALUES ('1', '4715', '471520120314205829', '15', '2012-03-14', '11.00');
INSERT INTO `driver_bill` VALUES ('2', '4747', '474720120314205907', '15', '2012-03-14', '44.00');
INSERT INTO `driver_bill` VALUES ('3', '4747', '474720120314210003', '15', '2012-03-14', '5.00');
INSERT INTO `driver_bill` VALUES ('5', '4747', '474720120314210043', '15', '2012-03-14', '44.00');
INSERT INTO `driver_bill` VALUES ('6', '4747', '474720120314210109', '15', '2012-03-14', '5.50');
INSERT INTO `driver_bill` VALUES ('8', 'T121', 'T12120120314210413', '15', '2012-03-08', '67.00');
INSERT INTO `driver_bill` VALUES ('9', '4715', '471520120315154703', '15', '2012-03-15', '11.00');
INSERT INTO `driver_bill` VALUES ('11', '4715', '471520120315155039', '15', '2012-03-15', '11.00');
INSERT INTO `driver_bill` VALUES ('12', 'D136', 'D13620120315155105', '16', '2012-03-15', '30.00');
INSERT INTO `driver_bill` VALUES ('13', '4715', '471520120315170736', '15', '2012-03-15', '11.00');
INSERT INTO `driver_bill` VALUES ('14', '4715', '471520120315170739', '15', '2012-03-15', '11.00');
INSERT INTO `driver_bill` VALUES ('15', '4715', '471520120315170741', '15', '2012-03-15', '11.00');
INSERT INTO `driver_bill` VALUES ('16', '4715', '471520120315170743', '15', '2012-03-15', '11.00');
INSERT INTO `driver_bill` VALUES ('17', '4715', '471520120315170744', '15', '2012-03-15', '11.00');
INSERT INTO `driver_bill` VALUES ('18', '4715', '471520120315170746', '15', '2012-03-15', '11.00');
INSERT INTO `driver_bill` VALUES ('19', '4715', '471520120315170748', '15', '2012-03-15', '11.00');
INSERT INTO `driver_bill` VALUES ('20', '4715', '471520120315170750', '15', '2012-03-15', '11.00');
INSERT INTO `driver_bill` VALUES ('21', '4715', '471520120315170751', '15', '2012-03-15', '11.00');
INSERT INTO `driver_bill` VALUES ('22', 'K185', 'K18520120315174512', '15', '2012-03-15', '175.00');
INSERT INTO `driver_bill` VALUES ('23', '4747', '474720120315184726', '15', '2012-03-15', '44.50');

-- ----------------------------
-- Table structure for `driver_info`
-- ----------------------------
DROP TABLE IF EXISTS `driver_info`;
CREATE TABLE `driver_info` (
  `id` varchar(20) NOT NULL,
  `from_city` varchar(20) NOT NULL,
  `to_city` varchar(20) NOT NULL,
  `from_time` varchar(10) NOT NULL,
  `to_time` varchar(10) NOT NULL,
  `mileage` int(5) NOT NULL,
  `usetime` varchar(10) NOT NULL,
  `price_first` double(5,2) NOT NULL,
  `price_second` double(5,2) NOT NULL,
  `price_note` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driver_info
-- ----------------------------
INSERT INTO `driver_info` VALUES ('4715', '新乡', '郑州', '20:46', '21:58', '80', '1小时12分', '11.00', '65.00', '硬座11/硬卧下65');
INSERT INTO `driver_info` VALUES ('4747', '新乡', '郑州', '20:53', '23:06', '80', '2小时13分', '5.50', '44.50', '硬座5.5/硬卧下44.5');
INSERT INTO `driver_info` VALUES ('D134', '郑州', '新乡', '07:22', '08:02', '80', '40分', '30.00', '25.00', '一等30/二等25');
INSERT INTO `driver_info` VALUES ('D136', '郑州', '新乡', '12:19', '12:58', '80', '39分', '30.00', '25.00', '一等30/二等25');
INSERT INTO `driver_info` VALUES ('K185', '新乡', '郑州', '20:02', '21:00', '80', '9小时12分', '94.00', '175.00', '硬座94/硬卧下175');
INSERT INTO `driver_info` VALUES ('T121', '郑州', '新乡', '11:27', '12:11', '80', '16小时53分', '13.00', '67.00', '硬座13/硬卧下67');

-- ----------------------------
-- Table structure for `driver_useraccount`
-- ----------------------------
DROP TABLE IF EXISTS `driver_useraccount`;
CREATE TABLE `driver_useraccount` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userid` int(20) NOT NULL DEFAULT '0',
  `nowPrice` double(8,2) DEFAULT NULL,
  `historyPrice` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_userid` (`userid`),
  CONSTRAINT `pk_userid` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of driver_useraccount
-- ----------------------------
INSERT INTO `driver_useraccount` VALUES ('2', '14', '16000.00', '0.00');
INSERT INTO `driver_useraccount` VALUES ('3', '15', '1673.50', '285.50');
INSERT INTO `driver_useraccount` VALUES ('4', '16', '970.00', '30.00');
INSERT INTO `driver_useraccount` VALUES ('5', '17', '1000.00', '0.00');
INSERT INTO `driver_useraccount` VALUES ('6', '18', '1000.00', '0.00');

-- ----------------------------
-- Table structure for `sys_authority`
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority`;
CREATE TABLE `sys_authority` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userid` int(20) NOT NULL,
  `roleid` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `roleid` FOREIGN KEY (`roleid`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_authority
-- ----------------------------
INSERT INTO `sys_authority` VALUES ('6', '14', '2');
INSERT INTO `sys_authority` VALUES ('7', '15', '2');
INSERT INTO `sys_authority` VALUES ('8', '16', '2');
INSERT INTO `sys_authority` VALUES ('9', '17', '2');
INSERT INTO `sys_authority` VALUES ('10', '18', '2');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES ('2', 'ROLE_USER');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `enabled` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('14', 'ff', '633de4b0c14ca52ea2432a3c8a5c4c31', '1');
INSERT INTO `sys_user` VALUES ('15', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1');
INSERT INTO `sys_user` VALUES ('16', 'oo', 'e47ca7a09cf6781e29634502345930a7', '1');
INSERT INTO `sys_user` VALUES ('17', 'zq', '5ec46274e89593d9b8498fd035cc32a8', '1');
INSERT INTO `sys_user` VALUES ('18', 'zhoupf', 'e10adc3949ba59abbe56e057f20f883e', '1');

-- ----------------------------
-- Table structure for `tb_user_sample`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_sample`;
CREATE TABLE `tb_user_sample` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_sample
-- ----------------------------
INSERT INTO `tb_user_sample` VALUES ('1', 'fz', '六个八');
