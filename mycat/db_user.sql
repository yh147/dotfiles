

CREATE DATABASE db_user DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use db_user;

-- ----------------------------
-- Table structure for data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `data_dictionary`;
CREATE TABLE `data_dictionary` (
  `dataDictionaryID` int(11) NOT NULL COMMENT '数据字典ID',
  `displayName` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '显示名称',
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '数据字典取值',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `lastUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`dataDictionaryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `addressID` int(11) NOT NULL COMMENT '地址ID',
  `receiver` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  `addressDetail` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '地址详细',
  `userID` int(11) NOT NULL COMMENT '用户ID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `lastUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`addressID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `phoneNum` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `ddID` int(11) DEFAULT NULL COMMENT '所属会员类型',
  `createTime` datetime DEFAULT NULL COMMENT '注册时间',
  `lastUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
