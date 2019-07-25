/*
 Navicat MySQL Data Transfer

 Source Server         : MYSQL Database
 Source Server Type    : MySQL
 Source Server Version : 100119
 Source Host           : localhost:3306
 Source Schema         : stock-management

 Target Server Type    : MySQL
 Target Server Version : 100119
 File Encoding         : 65001

 Date: 27/06/2019 18:46:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_control_types
-- ----------------------------
DROP TABLE IF EXISTS `sys_control_types`;
CREATE TABLE `sys_control_types` (
  `control_type_id` varchar(50) NOT NULL,
  `control_html` varchar(1000) NOT NULL,
  PRIMARY KEY (`control_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_control_types
-- ----------------------------
BEGIN;
INSERT INTO `sys_control_types` VALUES ('bit', '<div class=\"row\"><div class=\"col-sm-4\"><div class=\"input-group\"><div class=\"checkbox\"><label><input type=\"checkbox\" class=\"checkbox style-0\"><span> ||caption|| </span></label> </div></div></div></div>');
INSERT INTO `sys_control_types` VALUES ('txt', '<div class=\"col-sm-6\" style=\"margin-top: 10px\"> <div class=\"input-group\"> <div class=\"input-group-btn\" style=\"min-width: 120px;\"> <label class=\"form-control ctl_label\"> ||caption|| : </label> </div> <input class=\"form-control ctl_textbox\" type=\"text\" value=\"\"> </div> </div>');
INSERT INTO `sys_control_types` VALUES ('txtID', '<div class=\"row\"> <div class=\"col-sm-4\" style=\"margin-top: 10px\"> <div class=\"input-group\"> <div class=\"input-group-btn\" style=\"min-width: 120px;\"> <label class=\"form-control ctl_label\"> ||caption|| :</label> </div> <input class=\"form-control ctl_textbox\" type=\"text\" value=\"\"> </div> </div> </div>');
COMMIT;

-- ----------------------------
-- Table structure for sys_cost_methods
-- ----------------------------
DROP TABLE IF EXISTS `sys_cost_methods`;
CREATE TABLE `sys_cost_methods` (
  `cost_method_id` int(1) NOT NULL,
  `cost_method_name` varchar(20) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cost_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_cost_methods
-- ----------------------------
BEGIN;
INSERT INTO `sys_cost_methods` VALUES (1, 'FIFO', NULL);
INSERT INTO `sys_cost_methods` VALUES (2, 'Average', NULL);
INSERT INTO `sys_cost_methods` VALUES (3, 'LIFO', NULL);
INSERT INTO `sys_cost_methods` VALUES (4, 'Specific Unit', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_form_controls
-- ----------------------------
DROP TABLE IF EXISTS `sys_form_controls`;
CREATE TABLE `sys_form_controls` (
  `form_id` varchar(10) NOT NULL,
  `control_id` varchar(10) NOT NULL,
  `control_name` varchar(100) DEFAULT NULL,
  `control_type` varchar(50) DEFAULT NULL,
  `modal_target_id` varchar(50) DEFAULT NULL,
  `ord` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`form_id`,`control_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_form_controls
-- ----------------------------
BEGIN;
INSERT INTO `sys_form_controls` VALUES ('FRM-001', 'CTR-001', 'Category ID', 'txtID', NULL, '1');
INSERT INTO `sys_form_controls` VALUES ('FRM-001', 'CTR-002', 'Category Name', 'txt', NULL, '2');
INSERT INTO `sys_form_controls` VALUES ('FRM-001', 'CTR-003', 'Remark', 'txt', NULL, '3');
INSERT INTO `sys_form_controls` VALUES ('FRM-001', 'CTR-004', 'Inactive', 'bit', NULL, '4');
COMMIT;

-- ----------------------------
-- Table structure for sys_forms
-- ----------------------------
DROP TABLE IF EXISTS `sys_forms`;
CREATE TABLE `sys_forms` (
  `form_id` varchar(10) NOT NULL,
  `form_name` varchar(100) NOT NULL,
  `form_url` varchar(100) NOT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_forms
-- ----------------------------
BEGIN;
INSERT INTO `sys_forms` VALUES ('FRM-001', 'Catagories', '/categories');
INSERT INTO `sys_forms` VALUES ('FRM-002', 'Vendor Types', '/vendor-types');
INSERT INTO `sys_forms` VALUES ('FRM-003', 'Items', '/items');
INSERT INTO `sys_forms` VALUES ('FRM-004', 'Vendors', '/venders');
COMMIT;

-- ----------------------------
-- Table structure for sys_profiles
-- ----------------------------
DROP TABLE IF EXISTS `sys_profiles`;
CREATE TABLE `sys_profiles` (
  `profile_id` varchar(20) NOT NULL,
  `profile_name` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_profiles
-- ----------------------------
BEGIN;
INSERT INTO `sys_profiles` VALUES ('PRF-001', 'Administrator', 'Full Functionality', 0);
INSERT INTO `sys_profiles` VALUES ('PRF-002', 'Cashier', 'Cashier', 0);
INSERT INTO `sys_profiles` VALUES ('PRF-003', 'WareHouse', 'WareHouse', 0);
INSERT INTO `sys_profiles` VALUES ('PRF-004', 'Accountant', 'Accountant', 0);
INSERT INTO `sys_profiles` VALUES ('PRF-005', '111', '11', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_stock_types
-- ----------------------------
DROP TABLE IF EXISTS `sys_stock_types`;
CREATE TABLE `sys_stock_types` (
  `stock_type_id` int(1) NOT NULL,
  `stock_type_name` varchar(20) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stock_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_stock_types
-- ----------------------------
BEGIN;
INSERT INTO `sys_stock_types` VALUES (1, 'Stock Part', NULL);
INSERT INTO `sys_stock_types` VALUES (2, 'Service', NULL);
INSERT INTO `sys_stock_types` VALUES (3, 'Others', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_roles`;
CREATE TABLE `sys_user_roles` (
  `user_id` varchar(20) NOT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `profile_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_roles
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_roles` VALUES ('USR-001', 'admin', 'ROLE_ADMIN');
INSERT INTO `sys_user_roles` VALUES ('USR-002', 'seller', 'PRF-001');
INSERT INTO `sys_user_roles` VALUES ('USR-003', 'Hunridolla', 'PRF-003');
COMMIT;

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `profile_id` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `pwd_expiry` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
BEGIN;
INSERT INTO `sys_users` VALUES ('USR-001', 'Administrator', 'admin', '$2a$10$fpAHx2PJkHWfakOCt9HLFuS8MlOyd.bLuM64XdnJ77/Vlp1ye6M9C', 'PRF-001', '...', 0, 0);
INSERT INTO `sys_users` VALUES ('USR-002', 'Hunridolla', 'Hunridolla', '$2a$10$amBlN9fd/QliJ8HEVnCLh.ZX0U4v3Q4JNysprSg53tNRmy1C5W/oi', 'PRF-002', '', 0, 0);
INSERT INTO `sys_users` VALUES ('USR-003', 'Dara Visal', 'DaraVisal', '$2a$10$9Afjpu2AnmfK2pCRnJv/EeoFEvxK7aA114sNIYpE4miqJZ7ZxLVie', 'PRF-003', '', 0, 0);
INSERT INTO `sys_users` VALUES ('USR-004', 'Youken', 'Youken', '$2a$10$u8vGbVIrv4hZerNUs1Pebe5KVn2k.iN4ih.EqyGUcUrwmBSS6xr12', 'PRF-002', '', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for tbl_categories
-- ----------------------------
DROP TABLE IF EXISTS `tbl_categories`;
CREATE TABLE `tbl_categories` (
  `category_id` varchar(20) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_categories
-- ----------------------------
BEGIN;
INSERT INTO `tbl_categories` VALUES ('CAT-001', 'Phone Accessories', 'Phone Accessories', 0);
INSERT INTO `tbl_categories` VALUES ('CAT-002', 'Laptop Spare Parts', 'Laptop Spare Parts', 0);
INSERT INTO `tbl_categories` VALUES ('CAT-003', 'PC Spare Parts', 'PC Spare Parts', 0);
INSERT INTO `tbl_categories` VALUES ('CAT-004', 'Office Accessories', 'Officer Accessories', 0);
INSERT INTO `tbl_categories` VALUES ('CAT-005', 'Kitchen Accessories', 'Kitchen Accessories', 0);
COMMIT;

-- ----------------------------
-- Table structure for tbl_items
-- ----------------------------
DROP TABLE IF EXISTS `tbl_items`;
CREATE TABLE `tbl_items` (
  `item_id` varchar(10) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `stock_type` varchar(10) NOT NULL,
  `category_id` varchar(10) DEFAULT NULL,
  `um` varchar(10) DEFAULT NULL,
  `cost_method` varchar(10) DEFAULT NULL,
  `cost` double(10,0) DEFAULT NULL,
  `sale_price` double(10,0) DEFAULT NULL,
  `prefered_supplier` varchar(10) DEFAULT NULL,
  `min_balance` int(10) DEFAULT NULL,
  `max_balance` int(10) DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `inactive` binary(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_items
-- ----------------------------
BEGIN;
INSERT INTO `tbl_items` VALUES ('I-001', 'Macbook Pro 13\" 2015', '1', 'CAT-002', 'UM-003', '1', 800, 900, 'V-002', 1, 10, '', '', 0x30);
INSERT INTO `tbl_items` VALUES ('I-002', 'Surface 4 14\"', '2', 'CAT-002', 'UM-003', '2', 850, 1000, 'V-002', 1, 10, '23465783432d', '', 0x30);
INSERT INTO `tbl_items` VALUES ('I-003', 'iPhone X MAX', '2', 'CAT-001', 'UM-003', '2', 650, 700, 'V-003', 1, 5, '23465783432', '', 0x31);
INSERT INTO `tbl_items` VALUES ('I-004', 'OPPO A3s', '3', 'CAT-001', 'UM-003', '1', 230, 250, 'V-003', 1, 5, '23465783432', '', 0x30);
INSERT INTO `tbl_items` VALUES ('I-005', 'iPhone 6s 16GB', '2', 'CAT-001', 'UM-003', '2', 250, 300, 'V-001', 1, 5, '234657834312', 'iPhone 6s Second Hand', 0x31);
COMMIT;

-- ----------------------------
-- Table structure for tbl_unit_measures
-- ----------------------------
DROP TABLE IF EXISTS `tbl_unit_measures`;
CREATE TABLE `tbl_unit_measures` (
  `unit_measure_id` varchar(10) NOT NULL,
  `unit_measure_name` varchar(20) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`unit_measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_unit_measures
-- ----------------------------
BEGIN;
INSERT INTO `tbl_unit_measures` VALUES ('UM-001', 'In Bottom', '', 0);
INSERT INTO `tbl_unit_measures` VALUES ('UM-002', 'In Box', '', 0);
INSERT INTO `tbl_unit_measures` VALUES ('UM-003', 'In Case', '', 0);
INSERT INTO `tbl_unit_measures` VALUES ('UM-004', 'In metre', '', 0);
COMMIT;

-- ----------------------------
-- Table structure for tbl_vendor_types
-- ----------------------------
DROP TABLE IF EXISTS `tbl_vendor_types`;
CREATE TABLE `tbl_vendor_types` (
  `vendor_type_id` varchar(20) NOT NULL,
  `vendor_type_name` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`vendor_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_vendor_types
-- ----------------------------
BEGIN;
INSERT INTO `tbl_vendor_types` VALUES ('T-001', 'Phone Supplier', 'Phone Supplier', 0);
INSERT INTO `tbl_vendor_types` VALUES ('T-002', 'Laptop Supplier', 'Laptop Supplier', 0);
INSERT INTO `tbl_vendor_types` VALUES ('T-003', 'Desktop Suppliers', 'Desktop Supplier', 0);
COMMIT;

-- ----------------------------
-- Table structure for tbl_vendors
-- ----------------------------
DROP TABLE IF EXISTS `tbl_vendors`;
CREATE TABLE `tbl_vendors` (
  `vendor_id` varchar(10) CHARACTER SET utf8 NOT NULL,
  `vendor_type` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `company_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `company_name_khmer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `contact` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `website` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address_detail` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_vendors
-- ----------------------------
BEGIN;
INSERT INTO `tbl_vendors` VALUES ('V-001', 'T-001', 'Fiplus Khmer', 'ហ្វាយផ្លាស⁣ ខ្មែរ', 'Mrs.', 'Soy', 'Hunridollar', 'Hunridollar', '096-996-7697', 'soyhunridollar@gmail.coms', 'www.fiplus-khmer.com', 'Phnom Penh', '1', 0);
INSERT INTO `tbl_vendors` VALUES ('V-002', 'T-002', 'Chentra Computer Shop', 'ចន្រ្តាកំុព្យូទ័រ', '', 'Chea', 'Chentra', 'Chentra', '096-455-4556', '', 'www.chantra-shop.com', '', '', 0);
INSERT INTO `tbl_vendors` VALUES ('V-003', 'T-003', 'Lemada Designer', 'ឡាម៉ាដា⁣ ដឺគ័រ', 'Mss.', 'SOR', 'CHIVY', 'SOR CHIVY', '010 22 33 33', '', 'lemada@gmail.com', '', '', 0);
COMMIT;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`role`,`username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
BEGIN;
INSERT INTO `user_roles` VALUES (2, 'admin', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES (1, 'admin', 'ROLE_USER');
INSERT INTO `user_roles` VALUES (3, 'hunridolla', 'ROLE_USER');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('admin', '$2a$10$WpH3z/fRSArusnJ2PMQA8uruCzB96JiMj1SzhK/kuCavvnXErk13u', 1);
INSERT INTO `users` VALUES ('hunridolla', '$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.', 1);
COMMIT;

-- ----------------------------
-- Procedure structure for FI_SV_GET_USERS
-- ----------------------------
DROP PROCEDURE IF EXISTS `FI_SV_GET_USERS`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FI_SV_GET_USERS`()
BEGIN
	SELECT a.user_id,a.user_name,a.login_name,a.password,b.profile_name as profile_id,a.remark,a.inactive,
        a.pwd_expiry FROM sys_users a inner join sys_profiles b on a.profile_id = b.profile_id order by a.user_id;
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for FI_SV_GET_USER_BY_ID
-- ----------------------------
DROP PROCEDURE IF EXISTS `FI_SV_GET_USER_BY_ID`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FI_SV_GET_USER_BY_ID`(IN user_id VARCHAR(20))
BEGIN
	SELECT a.user_id,a.user_name,a.login_name,a.password,a.profile_id,a.remark,a.inactive,
         a.pwd_expiry FROM sys_users a inner join sys_profiles b on a.profile_id = b.profile_id WHERE a.user_id = user_id;
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for FI_SV_GET_USER_ID
-- ----------------------------
DROP PROCEDURE IF EXISTS `FI_SV_GET_USER_ID`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FI_SV_GET_USER_ID`()
BEGIN
	SELECT CONCAT('USR-' , LPAD(RIGHT(MAX(user_id),3) + 1,3,0)) as user_id FROM sys_users;
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GBL_CALL_CostMethods
-- ----------------------------
DROP PROCEDURE IF EXISTS `GBL_CALL_CostMethods`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GBL_CALL_CostMethods`()
BEGIN
  #Routine body goes here...
	SELECT * FROM sys_cost_methods;
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GBL_CALL_Forms
-- ----------------------------
DROP PROCEDURE IF EXISTS `GBL_CALL_Forms`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GBL_CALL_Forms`()
BEGIN
	SELECT * FROM sys_forms ORDER BY form_id;
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GBL_CALL_StockTypes
-- ----------------------------
DROP PROCEDURE IF EXISTS `GBL_CALL_StockTypes`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GBL_CALL_StockTypes`()
BEGIN
  #Routine body goes here...
	SELECT * FROM sys_stock_types ORDER BY stock_type_id;
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GBL_GET_FormControls
-- ----------------------------
DROP PROCEDURE IF EXISTS `GBL_GET_FormControls`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GBL_GET_FormControls`(
	IN form_id VARCHAR(20)
)
BEGIN
	SELECT * FROM sys_form_controls WHERE form_id = form_id;
END;
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
