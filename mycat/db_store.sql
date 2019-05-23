CREATE DATABASE  db_store DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use db_store;
-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `userName` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `phoneNum` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `storeID` int(11) NOT NULL,
  `storeName` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `storeAddress` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`storeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
