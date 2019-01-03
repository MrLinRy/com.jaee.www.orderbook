/*
Navicat MySQL Data Transfer

Source Server         : mysqp27
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : giit

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-01-03 19:23:18
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
INSERT INTO `book` VALUES ('1', '2', null, null, null, null, null);
INSERT INTO `book` VALUES ('2', '3', null, null, null, null, null);
INSERT INTO `book` VALUES ('3', '4', null, null, null, null, null);

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
INSERT INTO `class` VALUES ('162211', null, '20162', '软件工程');
INSERT INTO `class` VALUES ('172531', null, '20172', '文化与传媒');
INSERT INTO `class` VALUES ('192241', null, '20192', '通信工程');

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
INSERT INTO `course` VALUES ('C++编程设计', '必修课/公共课', '4', '软件工程');
INSERT INTO `course` VALUES ('JavaEE Web', '必修课/公共课', '4', '软件工程');
INSERT INTO `course` VALUES ('大学英语', '必修课/公共课', '2', '软件工程');
INSERT INTO `course` VALUES ('数据库课程设计', '必修课/公共课', '3', '软件工程');
INSERT INTO `course` VALUES ('现代传媒艺术', '必修课/公共课', '2', '文化与传媒');
INSERT INTO `course` VALUES ('离散数学', '必修课/公共课', '2', '软件工程');
INSERT INTO `course` VALUES ('通信原理', '必修课/公共课', '4', '通信工程');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(10) NOT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('5', '中文系');
INSERT INTO `department` VALUES ('3', '机电系');
INSERT INTO `department` VALUES ('1', '管理系');
INSERT INTO `department` VALUES ('2', '计算机与控制工程学院');

-- ----------------------------
-- Table structure for order_book
-- ----------------------------
DROP TABLE IF EXISTS `order_book`;
CREATE TABLE `order_book` (
  `staff_id` varchar(30) NOT NULL DEFAULT '',
  `sec_id` int(11) DEFAULT '0',
  `book_title` varchar(30) DEFAULT '',
  `isbn` varchar(20) NOT NULL DEFAULT '',
  `remark` varchar(30) DEFAULT NULL,
  `approval` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`staff_id`,`isbn`),
  KEY `isbn` (`isbn`),
  KEY `sec_id` (`sec_id`),
  CONSTRAINT `isbn` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`),
  CONSTRAINT `sec_id` FOREIGN KEY (`sec_id`) REFERENCES `section` (`sec_id`),
  CONSTRAINT `staff_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_book
-- ----------------------------
INSERT INTO `order_book` VALUES ('student', '4', '1', '2', '', '1');
INSERT INTO `order_book` VALUES ('student', '1', '2', '3', '', '1');
INSERT INTO `order_book` VALUES ('student', '2', '3', '4', '', '1');
INSERT INTO `order_book` VALUES ('teacher', '1', '1', '2', '', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '申请审批信息', null, null, null, null, null, '0');

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
INSERT INTO `role` VALUES ('3', 'teacher', '老师', '1', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('1', 'JavaEE Web', '20192', '8', 'teacher');
INSERT INTO `section` VALUES ('2', '数据库课程设计', '20192', '4', 'student');
INSERT INTO `section` VALUES ('3', '离散数学', '20192', '7', 'student');
INSERT INTO `section` VALUES ('4', '大学英语', '20192', '5', 'student');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of speciality
-- ----------------------------
INSERT INTO `speciality` VALUES ('1', '计算机与控制工程学院', '软件工程', null);
INSERT INTO `speciality` VALUES ('3', '中文系', '文化与传媒', null);
INSERT INTO `speciality` VALUES ('4', '计算机与控制工程学院', '通信工程', null);

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
INSERT INTO `staff` VALUES ('student', '学生');
INSERT INTO `staff` VALUES ('teacher', '老师');

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
INSERT INTO `student` VALUES ('3161104121', 't', '', '', '162211', '', null, '男', null, null, null);
INSERT INTO `student` VALUES ('student', null, null, '20192', '172531', null, null, null, null, null, null);

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
INSERT INTO `takes` VALUES ('student', '1', null);
INSERT INTO `takes` VALUES ('student', '3', null);
INSERT INTO `takes` VALUES ('student', '2', null);

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
INSERT INTO `timetable` VALUES ('1', '3', '2', '星期一', '1b203');

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
INSERT INTO `user` VALUES ('3161104111', 'b4a2c8753b2d94f1ea7d10acf8219a72', '0ec8e908cba95b38ff81e0dfdb752d23', '2', '0');
INSERT INTO `user` VALUES ('3161104121', '0a003b663994db83aa4b52ede07f646a', '9243c4352879f9ca08c18c8c2ca7de20', '2', '0');
INSERT INTO `user` VALUES ('admin', '3ab82b226b3b60f4eab8cd0a88887ba0', 'cd0faf6f821809044e35e35fd23cf44a', '1', '0');
INSERT INTO `user` VALUES ('student', '5476883b25e9c7bb0528b6fdfa0f5de7', '20d98880380112ff6404bdcaa4ba9c10', '2', '0');
INSERT INTO `user` VALUES ('supplier', '19a885f6627571598621fe5f5e9cbbc5', '9c64193184d34fa04a205d06b93ca3d6', '4', '0');
INSERT INTO `user` VALUES ('teacher', 'f7e7844cad9aadb0c7f1722f2c9be050', 'a7bbf832a7472759146b0967a78e6ce5', '3', '0');
