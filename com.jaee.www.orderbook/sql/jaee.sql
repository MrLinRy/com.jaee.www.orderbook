/*
Navicat MySQL Data Transfer

Source Server         : mysqp27
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : giit

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-01-02 11:45:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
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
  PRIMARY KEY (`book_title`,`isbn`),
  KEY `book_title` (`book_title`),
  KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('Effective JAVA', '1561315135213', '2008', 'Joshua Bloch', '工业出版社', 'A', '88');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` varchar(30) NOT NULL DEFAULT '',
  `class_name` varchar(10) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `spec_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `spec_name` (`spec_name`),
  CONSTRAINT `spec_name` FOREIGN KEY (`spec_name`) REFERENCES `speciality` (`spec_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', null, '20161', '软件工程');

-- ----------------------------
-- Table structure for course
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
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('JavaEE Web', '必修课/公共课', '4', '软件工程');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(10) NOT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('3', '机电系');
INSERT INTO `department` VALUES ('1', '管理系');
INSERT INTO `department` VALUES ('2', '计算机与控制工程学院');

-- ----------------------------
-- Table structure for order_book
-- ----------------------------
DROP TABLE IF EXISTS `order_book`;
CREATE TABLE `order_book` (
  `staff_id` varchar(30) DEFAULT '',
  `sec_id` int(11) DEFAULT '0',
  `book_title` varchar(30) DEFAULT '',
  `isbn` varchar(20) DEFAULT '',
  `remark` varchar(30) DEFAULT NULL,
  `approval` tinyint(1) DEFAULT NULL,
  KEY `book_title` (`book_title`),
  KEY `isbn` (`isbn`),
  KEY `staff_id` (`staff_id`),
  KEY `sec_id` (`sec_id`),
  CONSTRAINT `isbn` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`),
  CONSTRAINT `sec_id` FOREIGN KEY (`sec_id`) REFERENCES `section` (`sec_id`),
  CONSTRAINT `staff_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_book
-- ----------------------------
INSERT INTO `order_book` VALUES ('teacher', '1', 'Effective JAVA', '1561315135213', '不要二手', '1');

-- ----------------------------
-- Table structure for resource
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
-- Records of resource
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `resource_ids` bigint(20) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_role_resource_ids` (`resource_ids`),
  CONSTRAINT `resource_ids` FOREIGN KEY (`resource_ids`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '管理员', null, '1');
INSERT INTO `role` VALUES ('2', 'student', '学生', null, '1');
INSERT INTO `role` VALUES ('3', 'teacher', '老师', null, '1');
INSERT INTO `role` VALUES ('4', 'supplier', '游客', null, '1');

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `sec_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_title` varchar(30) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  `limitCount` int(11) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sec_id`),
  KEY `course_title` (`course_title`),
  CONSTRAINT `course_title` FOREIGN KEY (`course_title`) REFERENCES `course` (`course_title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('1', 'JavaEE Web', '2016', '8', 'teacher');

-- ----------------------------
-- Table structure for speciality
-- ----------------------------
DROP TABLE IF EXISTS `speciality`;
CREATE TABLE `speciality` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(10) NOT NULL,
  `spec_name` varchar(15) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`spec_id`),
  KEY `spec_name` (`spec_name`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `dept_name` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of speciality
-- ----------------------------
INSERT INTO `speciality` VALUES ('1', '计算机与控制工程学院', '软件工程', null);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` varchar(30) NOT NULL DEFAULT '',
  `staff_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('teacher', 'teacher');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` varchar(30) NOT NULL DEFAULT '',
  `student_name` varchar(20) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  `class_id` varchar(30) DEFAULT NULL,
  `telephone_number` varchar(20) DEFAULT NULL,
  `student_origin_base` varchar(10) DEFAULT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `pic_path` varchar(45) DEFAULT NULL,
  `leave_of_absence` tinyint(1) DEFAULT NULL,
  `leave_school` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `class_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('3161104138', 'MrLinRy', '35062619971201', '1997', '1', '13225919120', '1', '16', '福建', null, null);

-- ----------------------------
-- Table structure for takes
-- ----------------------------
DROP TABLE IF EXISTS `takes`;
CREATE TABLE `takes` (
  `student_id` varchar(30) DEFAULT NULL,
  `sec_id` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  KEY `student_id` (`student_id`),
  KEY `sec_id2` (`sec_id`),
  CONSTRAINT `sec_id2` FOREIGN KEY (`sec_id`) REFERENCES `section` (`sec_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of takes
-- ----------------------------

-- ----------------------------
-- Table structure for timetable
-- ----------------------------
DROP TABLE IF EXISTS `timetable`;
CREATE TABLE `timetable` (
  `sec_id` int(11) NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `weeks` varchar(20) DEFAULT NULL,
  `week` varchar(20) DEFAULT NULL,
  `classroom` varchar(10) DEFAULT NULL,
  KEY `sec_id3` (`sec_id`),
  CONSTRAINT `sec_id3` FOREIGN KEY (`sec_id`) REFERENCES `section` (`sec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timetable
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `role_ids` bigint(20) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `idx_user_username` (`user_id`),
  KEY `role_ids` (`role_ids`),
  CONSTRAINT `role_ids` FOREIGN KEY (`role_ids`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', '3ab82b226b3b60f4eab8cd0a88887ba0', 'cd0faf6f821809044e35e35fd23cf44a', '1', '0');
INSERT INTO `user` VALUES ('student', '5476883b25e9c7bb0528b6fdfa0f5de7', '20d98880380112ff6404bdcaa4ba9c10', '2', '0');
INSERT INTO `user` VALUES ('supplier', '19a885f6627571598621fe5f5e9cbbc5', '9c64193184d34fa04a205d06b93ca3d6', '4', '0');
INSERT INTO `user` VALUES ('teacher', 'f7e7844cad9aadb0c7f1722f2c9be050', 'a7bbf832a7472759146b0967a78e6ce5', '3', '0');
