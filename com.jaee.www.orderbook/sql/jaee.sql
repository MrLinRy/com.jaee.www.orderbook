/*
 Navicat Premium Data Transfer

 Source Server         : LRY_MySql
 Source Server Type    : MySQL
 Source Server Version : 50630
 Source Host           : localhost
 Source Database       : giit

 Target Server Type    : MySQL
 Target Server Version : 50630
 File Encoding         : utf-8

 Date: 12/28/2018 02:45:07 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_title` varchar(30) NOT NULL DEFAULT '',
  `isbn` varchar(20) NOT NULL DEFAULT '',
  `date_of_printing` varchar(20) DEFAULT NULL,
  `author` varchar(15) DEFAULT NULL,
  `press` varchar(15) DEFAULT NULL,
  `category` char(1) DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  PRIMARY KEY (`book_title`,`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `book`
-- ----------------------------
BEGIN;
INSERT INTO `book` VALUES ('Effective JAVA', '1561315135213', '2008', 'Joshua Bloch', '工业出版社', 'A', '88');
COMMIT;

-- ----------------------------
--  Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` varchar(30) NOT NULL DEFAULT '',
  `class_name` varchar(10) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `spec_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `class`
-- ----------------------------
BEGIN;
INSERT INTO `class` VALUES ('161111', null, '20161', '软件工程');
COMMIT;

-- ----------------------------
--  Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_title` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(10) DEFAULT NULL,
  `credits` float DEFAULT NULL,
  `speciality` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`course_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `course`
-- ----------------------------
BEGIN;
INSERT INTO `course` VALUES ('JavaEE Web', '必修课/公共课', '4', '软件工程');
COMMIT;

-- ----------------------------
--  Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `department`
-- ----------------------------
BEGIN;
INSERT INTO `department` VALUES ('1', '管理系'), ('2', '计算机与控制工程学院'), ('3', '机电系');
COMMIT;

-- ----------------------------
--  Table structure for `order_book`
-- ----------------------------
DROP TABLE IF EXISTS `order_book`;
CREATE TABLE `order_book` (
  `staff_id` varchar(30) NOT NULL DEFAULT '',
  `sec_id` int(11) NOT NULL DEFAULT '0',
  `book_title` varchar(30) NOT NULL DEFAULT '',
  `isbn` varchar(20) NOT NULL DEFAULT '',
  `remark` varchar(30) DEFAULT NULL,
  `approval` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`staff_id`,`sec_id`,`book_title`,`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `order_book`
-- ----------------------------
BEGIN;
INSERT INTO `order_book` VALUES ('teacher', '1', 'Effective JAVA', '1561315135213', '不要二手', '1');
COMMIT;

-- ----------------------------
--  Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_resource_parent_id` (`parent_id`),
  KEY `idx_resource_parent_ids` (`parent_ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `resource_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_role_resource_ids` (`resource_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', 'admin', '管理员', '', '1'), ('2', 'student', '学生', '', '1'), ('3', 'teacher', '老师', '', '1'), ('4', 'supplier', '游客', '', '1');
COMMIT;

-- ----------------------------
--  Table structure for `section`
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `sec_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_title` varchar(15) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  `limitCount` int(11) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `section`
-- ----------------------------
BEGIN;
INSERT INTO `section` VALUES ('1', 'JavaEE Web', '20161', '8', 'teacher');
COMMIT;

-- ----------------------------
--  Table structure for `speciality`
-- ----------------------------
DROP TABLE IF EXISTS `speciality`;
CREATE TABLE `speciality` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(10) DEFAULT NULL,
  `spec_name` varchar(15) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `speciality`
-- ----------------------------
BEGIN;
INSERT INTO `speciality` VALUES ('1', '计算机与控制工程', '软件工程', null);
COMMIT;

-- ----------------------------
--  Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` varchar(30) NOT NULL DEFAULT '',
  `staff_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `staff`
-- ----------------------------
BEGIN;
INSERT INTO `staff` VALUES ('teacher', 'teacher');
COMMIT;

-- ----------------------------
--  Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` varchar(30) NOT NULL DEFAULT '',
  `student_name` varchar(20) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  `class_id` varchar(10) DEFAULT NULL,
  `telephone_number` varchar(20) DEFAULT NULL,
  `student_origin_base` varchar(10) DEFAULT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `pic_path` varchar(45) DEFAULT NULL,
  `leave_of_absence` tinyint(1) DEFAULT NULL,
  `leave_school` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `student`
-- ----------------------------
BEGIN;
INSERT INTO `student` VALUES ('3161104138', 'MrLinRy', '35062619971201', '1997', '1', '13225919120', '1', '16', '福建', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `takes`
-- ----------------------------
DROP TABLE IF EXISTS `takes`;
CREATE TABLE `takes` (
  `student_id` varchar(30) NOT NULL DEFAULT '',
  `sec_id` varchar(30) NOT NULL DEFAULT '',
  `score` float DEFAULT NULL,
  PRIMARY KEY (`student_id`,`sec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `takes`
-- ----------------------------
BEGIN;
INSERT INTO `takes` VALUES ('student', '1', '5'), ('student2', '1', '5');
COMMIT;

-- ----------------------------
--  Table structure for `timetable`
-- ----------------------------
DROP TABLE IF EXISTS `timetable`;
CREATE TABLE `timetable` (
  `sec_id` int(11) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `weeks` varchar(20) DEFAULT NULL,
  `week` varchar(20) DEFAULT NULL,
  `classroom` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `role_ids` varchar(100) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `idx_user_username` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('admin', '3ab82b226b3b60f4eab8cd0a88887ba0', 'cd0faf6f821809044e35e35fd23cf44a', '1', '0'), ('student', '5476883b25e9c7bb0528b6fdfa0f5de7', '20d98880380112ff6404bdcaa4ba9c10', '2', '0'), ('supplier', '19a885f6627571598621fe5f5e9cbbc5', '9c64193184d34fa04a205d06b93ca3d6', '4', '0'), ('teacher', 'f7e7844cad9aadb0c7f1722f2c9be050', 'a7bbf832a7472759146b0967a78e6ce5', '3', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
