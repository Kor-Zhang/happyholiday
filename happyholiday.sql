/*
Navicat MySQL Data Transfer

Source Server         : COCO
Source Server Version : 60011
Source Host           : 127.0.0.1:3306
Source Database       : happyholiday

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2016-10-18 09:19:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminloginrecord
-- ----------------------------
DROP TABLE IF EXISTS `adminloginrecord`;
CREATE TABLE `adminloginrecord` (
  `loginRecordId` varchar(36) NOT NULL,
  `adminId` varchar(36) NOT NULL,
  `loginTime` datetime NOT NULL,
  `logoffTime` datetime NOT NULL,
  `loginAddress` varchar(255) NOT NULL,
  `loginIP` varchar(255) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`loginRecordId`),
  KEY `aid` (`adminId`),
  KEY `adminId` (`adminId`),
  CONSTRAINT `adminloginrecord_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminloginrecord
-- ----------------------------
INSERT INTO `adminloginrecord` VALUES ('020f904a-85dd-4739-9407-bcbc9a8474a9', '1138829222', '2016-07-12 22:40:31', '2016-07-12 22:41:30', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('02c182ee-ae95-40be-864d-df900913857a', '1138829222', '2016-07-12 15:29:11', '2016-07-12 15:32:48', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('0a20cb0c-5f2d-44ba-9a81-d7e8d486f339', '1138829222', '2016-07-12 22:39:59', '2016-07-12 22:40:07', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('0d243f62-f98a-4bec-8b3d-9fd24f9fdc1f', '1138829222', '2016-07-15 13:50:51', '2016-07-15 13:54:09', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('111d8b40-0407-45f5-8100-f64c06e8c9a3', '1138829222', '2016-07-15 13:10:15', '2016-07-15 13:24:46', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('14308977-91a6-4b42-8798-a746604f8edf', '987654', '2016-07-13 14:46:10', '2016-07-13 14:48:01', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('161004d7-6360-4822-b5c7-3bee80a1eefd', '1138829222', '2016-07-12 15:47:02', '2016-07-12 15:47:02', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('1679af6c-58b8-430e-adf7-2f769a13c662', '1138829222', '2016-10-13 13:55:57', '2016-10-13 14:00:50', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('168d1bf8-645d-4180-806e-cbc5bd07dbab', '123456', '2016-10-15 17:12:48', '2016-10-15 17:15:26', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('16e745bd-457d-4c62-af24-b89eb26a311c', '1138829222', '2016-10-15 17:08:53', '2016-10-15 17:15:14', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('1d335e7b-7ec3-43d9-9f84-1cac8d1c3fcc', '1138829222', '2016-07-12 15:42:46', '2016-07-12 15:46:52', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('1fe6f1c4-77f6-4bb8-8c14-cc41626cc1c7', '1138829222', '2016-10-13 13:52:27', '2016-10-13 13:55:36', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('222f5ca0-690b-480d-b2f9-a38f0ab91ea4', '987654', '2016-10-13 13:41:24', '2016-10-13 13:50:24', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('2406e26a-bf84-43ed-a4fe-c8460c2ad032', '1138829222', '2016-10-16 10:33:32', '2016-10-16 10:33:32', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('28820e9d-65c7-40ef-aa80-65df49a86e1a', '1138829222', '2016-07-12 15:41:52', '2016-07-12 15:42:30', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('291ba7ac-1cca-425c-a33a-07764d7e70cd', '1138829222', '2016-07-12 15:35:25', '2016-07-12 15:35:48', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('2ded2b89-5525-46b7-8229-ac6d10d11eb3', '123456', '2016-10-16 10:17:34', '2016-10-16 10:22:14', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('305a5b0c-b9fc-446b-9eb0-4950554294bf', '987654', '2016-07-13 14:02:33', '2016-07-13 14:05:20', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('31fa3151-3bbd-403d-9339-84687e054ce5', '1138829222', '2016-10-16 09:46:30', '2016-10-16 09:46:49', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('36a83c4a-d992-47b2-a6cb-04b3dad7001d', '1138829222', '2016-07-12 15:35:50', '2016-07-12 15:37:13', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('39412cbc-98a3-4e62-8ae7-18b145cb8044', '1138829222', '2016-10-15 14:45:56', '2016-10-15 14:45:56', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('394df28a-db80-4cd1-a707-d9362592a37b', '987654', '2016-10-13 13:09:48', '2016-10-13 13:09:48', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('43057adc-3247-4855-b2cb-db76913c5e45', '987654', '2016-10-13 13:55:42', '2016-10-13 13:55:52', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('436ed1aa-19a7-4fcd-b5c3-eb2e9006b9e9', '1138829222', '2016-07-12 12:52:41', '2016-07-12 13:01:24', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('43c06da6-c01e-4a2c-957c-fc04464f760b', '1138829222', '2016-07-12 22:39:32', '2016-07-12 22:39:59', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('44c628d6-c133-4419-9194-6170a99e7ec5', '1138829222', '2016-10-13 21:51:53', '2016-10-13 21:51:53', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('4744089b-c01f-459e-8d12-e360ded1718a', '987654', '2016-07-13 21:20:51', '2016-07-13 21:23:23', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('47adb2ea-f95e-458c-bfc4-29a250a940cf', '123456', '2016-10-16 09:59:24', '2016-10-16 09:59:24', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('487ed667-636d-45cd-937a-a2a8d54a745b', '1138829222', '2016-10-17 19:46:00', '2016-10-17 21:22:27', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('49bfc529-6370-4710-b4e7-c76d7c9aebda', '1138829222', '2016-10-16 17:57:18', '2016-10-16 17:57:18', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('4e1a31ef-4a60-4f64-96d2-ac410feb83b5', '1138829222', '2016-07-13 14:47:33', '2016-07-13 14:47:33', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('50f09838-372e-499f-bd51-7feaa2091d44', '987654', '2016-07-13 12:56:20', '2016-07-13 12:56:41', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('521b79fc-e7c8-4ab5-9568-8e6d89826e0d', '1138829222', '2016-07-13 15:35:25', '2016-07-13 16:10:05', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('559a5028-4980-4823-bb19-77e6bba5a2c6', '987654', '2016-07-13 16:18:09', '2016-07-13 16:47:12', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('59804d77-101c-48cc-8612-fb423fbedf99', '987654', '2016-07-13 11:30:08', '2016-07-13 11:42:25', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('5ace7a7c-fb98-4d50-8979-de851ce652b3', '1138829222', '2016-07-15 13:56:48', '2016-07-15 13:59:48', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('5b86ed37-8f07-4e2f-be7a-9522e0b5b633', '1138829222', '2016-07-13 10:57:56', '2016-07-13 11:42:24', '未知', '127.0.0.1', '0');
INSERT INTO `adminloginrecord` VALUES ('60d4a0c1-8073-4326-a63c-28c4399a5037', '987654', '2016-07-13 13:53:07', '2016-07-13 13:53:07', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('61f0dadd-dec1-440b-8c38-82f9c7583d74', '123456', '2016-10-15 17:29:46', '2016-10-15 18:22:25', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('64081e76-46a5-4c80-9996-1788e14e7523', '1138829222', '2016-07-12 22:23:17', '2016-07-12 22:24:56', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('70b44153-2eda-4fb0-a80e-9e53881a5092', '1138829222', '2016-10-14 10:28:00', '2016-10-14 10:28:00', '未知', '127.0.0.1', '0');
INSERT INTO `adminloginrecord` VALUES ('7342150f-91cb-4edb-8a14-d740aeedc11e', '123456', '2016-10-16 10:26:47', '2016-10-16 10:33:28', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('7469db0b-9248-4bc0-8bc9-f31a4fa55228', '1138829222', '2016-10-17 21:32:55', '2016-10-17 21:32:55', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('76e7449e-ebc3-4295-a1a4-15a417121e02', '1138829222', '2016-10-13 14:02:38', '2016-10-13 14:02:38', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('7e7c8649-a588-46a6-a4cc-fe62f9bba66d', '1138829222', '2016-07-12 22:40:07', '2016-07-12 22:40:23', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('80278cd6-6ad0-4d56-b0dc-500167fb9334', '1138829222', '2016-07-12 12:43:57', '2016-07-12 12:52:16', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('8131805e-0828-4158-9139-8456f7902118', '987654', '2016-07-13 12:37:41', '2016-07-13 12:39:08', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('816da779-3802-46db-8f95-20ed37256b66', '1138829222', '2016-10-15 14:40:20', '2016-10-15 14:40:20', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('8a14b0cf-43d0-44ce-b194-36385e38d2e7', '1138829222', '2016-07-12 22:30:49', '2016-07-12 22:33:13', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('8c76d94e-e520-4e9f-ac55-63d4b38f3c59', '1138829222', '2016-07-13 13:08:44', '2016-07-13 13:42:51', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('8cfde61b-1b16-4087-b146-a2ea386fe668', '123456', '2016-10-16 09:46:54', '2016-10-16 09:59:04', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('8f7fa957-f0a6-430a-9785-f8882eb58e26', '123456', '2016-10-16 10:22:21', '2016-10-16 10:22:21', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('94aa5faf-07a3-4bfa-ab9f-6c5b278c1547', '1138829222', '2016-07-12 13:46:47', '2016-07-12 13:47:22', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('a138dbe2-e44a-4434-a96d-4935797d6fca', '1138829222', '2016-07-12 13:35:48', '2016-07-12 13:36:18', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('a1a38854-195b-4382-b0e2-09eb83299b08', '1138829222', '2016-07-13 16:17:23', '2016-07-13 16:18:04', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('ac2c3e62-5f60-4e84-9afd-6a6e09150a4b', '1138829222', '2016-10-15 16:26:06', '2016-10-15 17:06:01', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('afd067c4-ec81-459a-b8d1-41c65943d06b', '1138829222', '2016-07-12 15:35:09', '2016-07-12 15:35:23', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('b3eb81ed-7b3b-487d-affa-a5242d172637', '1138829222', '2016-07-12 12:52:16', '2016-07-12 12:52:41', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('b63ae743-197e-4696-97ed-8dfd36fe1608', '1138829222', '2016-10-15 13:30:48', '2016-10-15 13:30:48', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('b648697a-efda-4773-bb28-311569ec3f91', '1138829222', '2016-10-15 17:15:33', '2016-10-15 17:15:33', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('bb4f8cf2-284e-4848-99dd-4d7070a327b9', '1138829222', '2016-07-12 13:15:08', '2016-07-12 13:28:38', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('c41d256f-2bcb-42c4-9a35-a54be66b25bb', '1138829222', '2016-07-12 13:14:06', '2016-07-12 13:14:23', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('c859bbea-b070-414c-a46e-3ca256f0647a', '1138829222', '2016-10-16 17:14:24', '2016-10-16 17:14:24', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('ca47610e-fe0a-4d28-9cb8-1d81c83ce436', '123456', '2016-10-16 09:59:06', '2016-10-16 09:59:24', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('ccab7642-e98b-4004-aac3-01387cb2c61e', '1138829222', '2016-07-12 13:49:43', '2016-07-12 14:01:07', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('cd82dc08-bb87-4e10-a95b-a41df14c761c', '1138829222', '2016-07-12 13:12:47', '2016-07-12 13:13:50', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('cdf0ab7b-1f63-41e6-ab6b-15ca7061baac', '1138829222', '2016-07-12 15:34:29', '2016-07-12 15:34:34', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('cf54388c-44a5-4032-83b2-7d94b4d1b4d1', '1138829222', '2016-10-14 11:17:30', '2016-10-14 11:17:30', '未知', '127.0.0.1', '0');
INSERT INTO `adminloginrecord` VALUES ('d003fe11-5aa2-466a-8e7a-1c5a0cfc5565', '1138829222', '2016-07-12 13:04:16', '2016-07-12 13:09:58', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('d495380d-fca4-41fa-b3c6-00e203e09c40', '1138829222', '2016-07-13 12:56:46', '2016-07-13 13:06:12', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('d6f531e1-643e-4dbf-a7ed-3464c617c948', '1138829222', '2016-07-12 13:10:35', '2016-07-12 13:11:52', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('d8c0686d-e379-4885-8608-a2bc8376322a', '1138829222', '2016-10-13 13:51:45', '2016-10-13 13:51:51', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('d9127a2e-9626-48d8-81e7-4c3ef0f8471a', '987654', '2016-07-13 13:06:30', '2016-07-13 13:07:11', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('e065e0b8-e1a9-45a5-88e7-9f2e0158025b', '123456', '2016-10-15 17:15:50', '2016-10-15 17:29:39', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('e4dbacf3-ea3f-4b6d-815e-aa90b311e935', '1138829222', '2016-07-12 13:44:58', '2016-07-12 13:45:43', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('e72cf279-0ff9-4f04-a21c-99a3c9e46ef6', '987654', '2016-07-13 12:58:52', '2016-07-13 13:06:12', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('ecacbda6-da1d-4c71-b190-6c2fe21c00ce', '1138829222', '2016-07-12 14:01:25', '2016-07-12 14:13:06', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('ef5d4a01-aa46-42b4-8fc4-b7339e31af6f', '1138829222', '2016-07-12 15:37:13', '2016-07-12 15:40:48', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('eff8ca86-d029-4e3d-9160-1a425aba4b48', '1138829222', '2016-07-12 22:36:12', '2016-07-12 22:39:32', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('f05068ca-2d05-4fb1-9cf0-0191ae34a790', '987654', '2016-07-13 13:08:12', '2016-07-13 13:08:39', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('f5c9dd49-cbcf-41cb-af41-18a0c37f2c9d', '1138829222', '2016-07-13 21:23:31', '2016-07-15 12:51:46', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `adminloginrecord` VALUES ('fe46a209-c75c-4c17-ad23-418279102721', '1138829222', '2016-07-15 13:26:36', '2016-07-15 13:45:12', '本机', '0:0:0:0:0:0:0:1', '0');

-- ----------------------------
-- Table structure for adminpower
-- ----------------------------
DROP TABLE IF EXISTS `adminpower`;
CREATE TABLE `adminpower` (
  `id` varchar(36) NOT NULL,
  `powerId` varchar(36) NOT NULL,
  `adminId` varchar(36) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0代表么有拥有该权限，1代表拥有该权限',
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forkey_power_admin_powerId` (`powerId`),
  KEY `forkey_power_admin_adminId` (`adminId`),
  CONSTRAINT `forkey_power_admin_adminId` FOREIGN KEY (`adminId`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `forkey_power_admin_powerId` FOREIGN KEY (`powerId`) REFERENCES `powers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminpower
-- ----------------------------
INSERT INTO `adminpower` VALUES ('016ff5e7-7366-427f-baad-2de3b4470ca4', '903', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('119641af4fqa', '2102', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('1231231314156234156436', '1104', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('1231314154asd', '504', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('12891289', '401', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('13122', '101', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('13123', '204', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('16756f6e-6b19-4c4e-84b4-fe8877467bd9', '804', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('1856qadf4qw', '1602', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('19c540e3-26b7-4333-baf5-a530128bf9c0', '503', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('19ef5ae4-ff6c-451b-9b1b-5c2b7bc735ec', '603', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('1a6f4q6aw', '1904', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('1f4as6we4q6f', '1903', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('20bae7a5-77fb-4fa4-9bb0-5a35003d045b', '304', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('213156a4f6s', '1001', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('21345646ads', '404', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('2217c97d-8dc5-42a9-a5c7-d6253d884999', '902', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('23423', '204', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('29f1d29b-8861-44a5-a003-679c4857b1cb', '404', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('29f71ae8-e89f-4822-be5a-5e49c8ff6ad4', '602', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('2b1d17a1-eba7-4352-ab8d-470f671bd46d', '801', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('2b7efbe4-d65b-474a-a302-f186ca7c99f2', '802', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('2f870750-fe4c-4cee-a95c-59a6ebdc72bd', '703', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('3123123', '102', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('31f9975c-8034-4357-9c51-c669497ec1c1', '901', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('3767723d-e06e-44e8-b60a-143129fe78b2', '504', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('3aa91ac2-035d-453a-a046-d36665ff4eaf', '804', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('3f2a75fd-eb4c-49a8-962e-6019627b6236', '101', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('3f4a79f2-d60d-4230-9957-71034d12c259', '704', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('433a85c6-946f-4050-9151-25eb4e6f3acb', '903', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('44770ec5-969c-4c43-869a-b8936b8f3dd3', '1703', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('456asd456asd', '701', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('456dasd56456', '602', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('46b3552b-dd3f-4cfd-94da-5cbe3ba9d347', '102', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('485994d2-1ec3-4770-8172-7f82de07273b', '302', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('4a56sd4a56', '502', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('4a65rf4w', '901', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('4a6fc1b6-8fb6-4c2c-9fb5-73bedd286c9e', '1103', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('4a89w4q1huiui', '904', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('4ad65456qw4', '1701', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('4adf56w4qfqsvgs', '1404', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('4af6w4q4f9q', '2104', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('4asf56456aaf', '1902', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('4f6qw4wdrfqweqadsas', '1501', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('4f89weq456ssf', '1302', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('4qq4wed4q64150', '1502', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('53842083-1bbb-4197-8157-b66e9ceea27f', '1803', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('564456', '202', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('56465qwe', '501', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('56a4w64q6w1wge', '903', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('56f4qw64fw6f', '1604', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('56qw74q6', '402', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('590a052c-7a2f-4acb-897d-fd95f370f5c4', '802', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('5ac66f41-74b8-4135-bde7-473a2bb06403', '203', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('5as456asd456', '604', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('61b36a62-3961-46aa-acb6-1899552b9b08', '503', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('63fcd033-e049-4b92-bda1-64b6cb59d946', '301', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('64a6dwq', '1403', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('65f4w6ewrfwq65r41qvss', '1603', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('68564513', '203', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('69d0f57a-1899-41d1-b952-671b48e29942', '2101', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('6a53adb4-2e1b-4d73-8a4e-0fecc4e10a78', '101', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('6ef464h6jkluioy', '1401', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('702a152d-dc8a-4832-ad4e-f0e6242a0f30', '101', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('7fbbdfba-cfdd-449d-95b7-daf82acd7491', '1003', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('8096c2b0-f0fa-484e-b40a-6668fbee4185', '2003', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('842958a2-fa47-4ab8-8400-ceedec1d85d1', '301', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('84353841-3ffe-4dec-bd47-3e7bc721e7ae', '803', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('84a9f4tyukyt', '1802', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('8695b6ff-3c53-4a55-9202-1e8aabf486db', '302', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('88e9f2cc-266e-4db0-a283-31cca04dd4b4', '403', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('89789789', '201', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('89sg489we4g84w', '2001', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('8a4wf89q4f484yuky', '1304', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('8a9cbedc-ade3-47a7-9d28-9a3c7a841ff9', '701', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('8af4qw894f89q4', '2003', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('8c25eda0-f316-4ba7-b1a8-fd0bf91314f8', '1002', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('8d69c5a7-c7f6-4ab7-b925-2ee9c013a136', '804', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('8f4afe44jyj', '1704', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('8f4awe9f44sdg', '1703', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('8f4e9bcd-4fec-4126-adcd-c2e9527038bf', '601', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('9035c64e-336c-4ff1-b60c-5a527050c994', '501', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('92e8febc-d9fc-4eb9-9d8f-ac373d857612', '601', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('979c9e1f-c9df-40a5-a5bc-1dc3f31cf7b0', '502', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('989b6d45-cfe6-4e60-b26d-66811a53af07', '802', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('98d504d2-3741-4b91-aa2e-413e67e4faa8', '2103', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('a0dd4349-077b-4662-9d46-ca243ac172eb', '904', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('a22767f3-ab38-488b-9254-3f392d96ae5d', '404', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('a247b77e-31d9-4a6d-8ca3-367dac571e87', '102', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('a2a1ccf7-e371-402f-baeb-92f5eb62c8a7', '603', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('a36553c9-784e-449f-ab13-faa4511427ae', '801', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('a456f4a5612', '1202', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a4f6w4q61sz', '902', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a4sd564a564da564', '703', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a564d56', '304', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a564df6', '403', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a564dfq894rfqf', '1504', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a564ew89q4c1z1c', '704', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a57330a5-19be-4e49-bd5d-551fac941429', '502', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('a5d56a456w4qhgfd', '2004', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a6d4a6', '303', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a6f456as4f56jk', '1804', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a721c33e-5f3e-4c9e-aab0-8dc6b65d281d', '102', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('a798f7b0-35e7-4ebb-9058-3193ff61bdb8', '703', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('a87r1j6kl.1jk', '804', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a98df74qw1c6qw', '1003', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('a9c87129-dad5-4831-a821-fb8b9214e65a', '603', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('aa27c48f-4d14-4fa8-afa7-35e0161754dc', '701', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('aasdasdasd526456456', '601', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('ad', '302', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('ad0022fe-bbb0-4449-8f89-7b0ea8c6a972', '803', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('ad41qw646gkj6myujrtf', '1402', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('ad4aw56465', '1803', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('ad7q965daw', '1002', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('ad89w4qrfqzxca', '1503', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('ad8d4qw894drq', '1901', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('adf84wd84q6', '2101', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('adq654we56q', '1601', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('adsadqweqq1102', '1102', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('as4d56a465', '702', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('as4f86qw4fa', '1204', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('as4f86we4q8932s1fhge', '1301', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('as4fd65aw456e', '1203', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('as56f4da6', '301', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('asdad', '1201', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('asdasd', '1101', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('asdd789a7w89qed6', '1303', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('asdfladfkopadfkop', '603', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('asdkplq', '1004', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('asdqakwopq456+', '1103', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('b0396933-9f28-41f3-a300-f1daa84f5815', '504', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('b2549e0d-a7b7-4354-a0c6-b31543e08521', '702', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('b650cb16-2043-41be-8fbd-2ab907b2c6ad', '604', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('b8e6c54d-82d8-4e2f-aeee-2892e0db7148', '503', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('be1cacee-090d-4db9-b46b-ac39315727a8', '301', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('c1f733a3-24f2-4753-b06f-f828aaee7c7e', '801', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('c630ef1f-e003-4eea-ab89-e78dd23e3dcd', '704', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('c6af9da3-ad74-4749-83ea-1fa30d6f8afb', '702', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('c92c8f95-8e1b-4db6-8c47-2cf0c1193ba7', '401', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('cc37d1bb-1796-4ae0-8a96-2941cb64ee55', '1903', '123456', '1', '0');
INSERT INTO `adminpower` VALUES ('d3b3cbfa-f598-46f8-8756-9d3fc27c737b', '501', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('d5255f33-fdd1-445d-ac5a-d86f6b72ebc3', '602', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('d8d9bd9d-dc90-4944-93b3-e99c4407dc45', '701', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('da84wrqd41a56f4', '1702', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('e1ac7102-a282-4c47-b61c-905f39346f91', '1004', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('e26c8a5c-019e-4170-8c70-a841b6edf871', '1001', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('e39b3858-9c08-4be1-bc26-2393a947b7e0', '803', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('e3a23f3a-b513-45cb-a05e-f42b97738a5e', '304', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('e440d306-ab4c-403b-bda0-994e8a7a2270', '604', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('efdef7fb-25f6-4611-808b-89508dc4a24f', '402', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('f2db3a54-63f2-45b8-a72b-c07f598c3554', '303', '1234567', '1', '0');
INSERT INTO `adminpower` VALUES ('f3606f70-8ed0-40b7-89dd-98b140397818', '303', '987654', '1', '0');
INSERT INTO `adminpower` VALUES ('f89a4q894q', '2103', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('fa89w494qwdrq98e498', '2002', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('fase4q894ef9', '1801', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('q7w481c561we6g', '802', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('q89wr7451s56cv1we', '801', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('t4yu5646', '503', '1138829222', '1', '0');
INSERT INTO `adminpower` VALUES ('w897q641n564yug', '803', '1138829222', '1', '0');

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(36) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `isSuperAdmin` int(1) NOT NULL DEFAULT '0',
  `theme` varchar(255) NOT NULL DEFAULT 'bootstrap',
  `createTime` datetime NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `canAdd` int(11) NOT NULL,
  `canAddAdmin` int(11) NOT NULL,
  `canDelete` int(11) NOT NULL,
  `canDeleteAdmin` int(11) NOT NULL,
  `canQuery` int(11) NOT NULL,
  `canQueryAdmin` int(11) NOT NULL,
  `canUpdate` int(11) NOT NULL,
  `canUpdateAdmin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1138829222', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '0', 'bootstrap', '2016-07-12 12:40:39', '0', '第一测试账户', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `admins` VALUES ('123456', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '0', 'default', '2016-07-12 22:40:47', '0', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `admins` VALUES ('1234567', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '0', 'bootstrap', '2016-07-13 11:28:48', '0', '第三测试账户', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `admins` VALUES ('654321', null, '654321', '1', '0', 'bootstrap', '2016-07-12 12:40:17', '1', '654321', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `admins` VALUES ('987654', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '1', 'bootstrap', '2016-07-12 22:40:47', '0', '', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for adminupdaterecord
-- ----------------------------
DROP TABLE IF EXISTS `adminupdaterecord`;
CREATE TABLE `adminupdaterecord` (
  `updateRecordId` varchar(36) NOT NULL,
  `doAdminId` varchar(36) NOT NULL COMMENT '进行操作的adminId',
  `doneAdminId` varchar(36) NOT NULL COMMENT '被操作的adminId',
  `item` varchar(255) NOT NULL,
  `updateTime` datetime NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`updateRecordId`),
  KEY `doneAId` (`doneAdminId`),
  KEY `doAId` (`doAdminId`),
  CONSTRAINT `adminupdaterecord_ibfk_1` FOREIGN KEY (`doAdminId`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adminupdaterecord_ibfk_2` FOREIGN KEY (`doneAdminId`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminupdaterecord
-- ----------------------------
INSERT INTO `adminupdaterecord` VALUES ('0defecb2-acc7-45bc-9b41-daa0f35c21c6', '1138829222', '987654', '编辑', '2016-07-13 11:29:05', '0');
INSERT INTO `adminupdaterecord` VALUES ('6cec4b81-c192-4a9a-9bc6-e04724347a23', '1138829222', '987654', '编辑密码', '2016-07-13 11:30:06', '0');
INSERT INTO `adminupdaterecord` VALUES ('792373de-d42a-4573-adfc-744298ad0c41', '1138829222', '987654', '添加', '2016-07-12 22:40:47', '0');
INSERT INTO `adminupdaterecord` VALUES ('82552ea5-1ab0-4767-a362-4a86330ad800', '1138829222', '123456', '编辑', '2016-10-15 17:12:45', '0');
INSERT INTO `adminupdaterecord` VALUES ('86b8b588-8c94-4e4c-8972-8cd86abc365d', '1138829222', '1234567', '编辑密码', '2016-10-15 17:29:33', '0');
INSERT INTO `adminupdaterecord` VALUES ('c6dd4296-191e-496d-8bc2-fa1103d64786', '1138829222', '123456', '编辑密码', '2016-10-15 17:10:31', '0');
INSERT INTO `adminupdaterecord` VALUES ('ff57ac1e-5d64-46d5-bb12-54f1a4128f4b', '1138829222', '123456', '编辑密码', '2016-10-15 17:11:05', '0');

-- ----------------------------
-- Table structure for caraddress
-- ----------------------------
DROP TABLE IF EXISTS `caraddress`;
CREATE TABLE `caraddress` (
  `id` varchar(36) NOT NULL,
  `address` varchar(255) NOT NULL,
  `pId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA43265A0DAB46139` (`pId`),
  CONSTRAINT `FKA43265A0DAB46139` FOREIGN KEY (`pId`) REFERENCES `caraddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caraddress
-- ----------------------------

-- ----------------------------
-- Table structure for carimgs
-- ----------------------------
DROP TABLE IF EXISTS `carimgs`;
CREATE TABLE `carimgs` (
  `id` varchar(36) NOT NULL,
  `imgId` varchar(36) NOT NULL,
  `carId` varchar(36) NOT NULL,
  `main` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carid` (`carId`),
  KEY `imgid` (`imgId`),
  CONSTRAINT `carid` FOREIGN KEY (`carId`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `imgid` FOREIGN KEY (`imgId`) REFERENCES `imgs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carimgs
-- ----------------------------
INSERT INTO `carimgs` VALUES ('10a8ba9d-64db-4436-bbb6-d9167a9acccd', '27147d56-7e39-4d89-8e03-889bc97b6f4f', '91bc49f4-b39a-44ed-8236-9a7a73b54835', '1');
INSERT INTO `carimgs` VALUES ('1b233ee3-54c4-441e-8ec0-89f12b87f118', '634702f3-8caf-4a65-99b7-0eb15593ceed', '2544b53a-a3ca-4859-b840-f4093779f372', '0');
INSERT INTO `carimgs` VALUES ('25609a1d-1718-4f15-ae6a-bd129def8f65', 'd383bb4a-14de-46cf-bf78-a63142def791', '23cfeec7-7d7a-4eae-ac24-0f48c5bbdb7c', '1');
INSERT INTO `carimgs` VALUES ('a6f46389-fe92-4e9e-bbb9-1f6519bdbb73', '50dae349-cea2-438b-b3af-c267bc49da1e', '2544b53a-a3ca-4859-b840-f4093779f372', '0');
INSERT INTO `carimgs` VALUES ('b66e2c3b-c6ca-4ae0-b263-cdfde7e9a6b9', '7e12b0ab-dbda-45b2-9bc6-81624f00ce13', '892c11f1-b266-4178-b4e7-da1857ac31df', '0');
INSERT INTO `carimgs` VALUES ('b6f9e639-2d02-49e5-bd35-6f63bd238307', '60e9ed30-2b02-4677-af00-d693f1587915', '91bc49f4-b39a-44ed-8236-9a7a73b54835', '0');
INSERT INTO `carimgs` VALUES ('e0a24d64-3d01-41c2-ba77-072b8049c758', '7ad04249-1ab1-4b92-b2a2-7eb2e53cfe37', '2544b53a-a3ca-4859-b840-f4093779f372', '1');
INSERT INTO `carimgs` VALUES ('f4402db9-0563-4e06-ab7a-b655a8b55756', 'bf916df2-2918-4f49-9a67-f5928f624193', '2544b53a-a3ca-4859-b840-f4093779f372', '0');

-- ----------------------------
-- Table structure for cars
-- ----------------------------
DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `id` varchar(36) NOT NULL DEFAULT '',
  `carBd` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '车型',
  `carLine` varchar(255) NOT NULL COMMENT '车系',
  `year` date NOT NULL COMMENT '发行年份',
  `address` varchar(255) NOT NULL,
  `seatType` varchar(255) DEFAULT NULL COMMENT '座位类型',
  `seatNumber` int(11) DEFAULT NULL COMMENT '座位数',
  `fuelType` varchar(255) DEFAULT NULL COMMENT '燃料类型',
  `transmissionType` varchar(255) DEFAULT NULL COMMENT '变速箱类型',
  `displacement` int(255) DEFAULT NULL COMMENT '排量',
  `drivingMode` varchar(255) DEFAULT NULL COMMENT '驱动模式',
  `engineIntakeForm` varchar(255) DEFAULT NULL COMMENT '发动机进气形式',
  `skyWindow` varchar(255) DEFAULT NULL COMMENT '天窗',
  `fuelTankage` int(255) DEFAULT NULL COMMENT '汽油容量',
  `soundBox` varchar(255) DEFAULT NULL COMMENT '音响',
  `reverseSensor` varchar(255) DEFAULT NULL COMMENT '倒车雷达',
  `airSacNumber` int(11) DEFAULT NULL COMMENT '气囊数量',
  `dvd` varchar(255) DEFAULT NULL COMMENT 'cd',
  `gps` varchar(255) DEFAULT NULL COMMENT 'gps定位',
  `price` int(11) NOT NULL,
  `guidePrice` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cars_bd` (`carBd`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cars
-- ----------------------------
INSERT INTO `cars` VALUES ('23cfeec7-7d7a-4eae-ac24-0f48c5bbdb7c', '本田', '小型车', '本田', '2016-10-17', '中国/四川/眉山/彭山/彭山东店', '本田', null, '本田', '本田', null, '本田', '本田', '本田', null, '本田', '本田', null, '本田', '本田', '123', '22', '22', '0', '2016-10-17 21:53:37');
INSERT INTO `cars` VALUES ('2544b53a-a3ca-4859-b840-f4093779f372', '本田', '小型车', '本田', '2016-07-18', '中国/四川/眉山/彭山/彭山东店', '本田', '213', '本田', '本田', '132', '本田', '本田', '本田', '132', '本田', '本田', '123', '本田', '本田', '123', '123', '132', '0', '2016-07-18 16:33:04');
INSERT INTO `cars` VALUES ('6ec26ebf-1160-41f9-8556-df0476e2ebdd', '梅赛德斯奔驰', '小型车', '大一气', '2016-07-13', '中国/四川/眉山/彭山/彭山东店', '软垫', '4', '汽油', '本田', '12312', '本田', '本田', '本田', '1333', '本田', '本田', '3', '本田', '本田', '991', '1', '333', '0', '2016-07-13 15:36:30');
INSERT INTO `cars` VALUES ('892c11f1-b266-4178-b4e7-da1857ac31df', '梅赛德斯奔驰', '小型车', '大一气', '2016-07-13', '中国/四川/眉山/彭山/彭山东店', '软垫', '4', '汽油', '本田', '12312', '本田', '本田', '本田', '1333', '本田', '本田', '3', '本田', '本田', '991', '1321', '333', '0', '2016-07-13 15:36:38');
INSERT INTO `cars` VALUES ('91bc49f4-b39a-44ed-8236-9a7a73b54835', '梅赛德斯奔驰', '小型车', '系', '2016-07-13', '中国/湖南/湖南市中店', '软座', '4', '本田', '本田', '3000', '本田', '本田', '本田', '3000', '本田', '本田', '3', '本田', '本田', '201', '1', '4', '0', '2016-07-13 13:01:48');

-- ----------------------------
-- Table structure for cost
-- ----------------------------
DROP TABLE IF EXISTS `cost`;
CREATE TABLE `cost` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `belong` varchar(255) NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO `cost` VALUES ('1321', '汽车基本保险', '汽车的基本保险', '10', 'car', '2016-07-05 11:44:51', '2016-07-13 13:02:28', '0');
INSERT INTO `cost` VALUES ('7c348afb-00cf-4ccb-a905-d6c9e41226ef', '2', '2', '22', 'car', '2016-07-25 20:50:32', '2016-07-25 20:50:32', '0');

-- ----------------------------
-- Table structure for imgs
-- ----------------------------
DROP TABLE IF EXISTS `imgs`;
CREATE TABLE `imgs` (
  `id` varchar(36) NOT NULL,
  `imgName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgs
-- ----------------------------
INSERT INTO `imgs` VALUES ('007cfd65-3592-44b7-9577-682fb9e98434', '4165e092-51d0-4c76-8b0e-f70213c7351b.jpeg');
INSERT INTO `imgs` VALUES ('041295cb-ef7e-477b-8cfd-18e9fcf1818d', 'a8075d88-2d07-4ed7-981c-1a93f9817a66.jpeg');
INSERT INTO `imgs` VALUES ('0840fec4-693f-4df8-a624-f865a268db2c', '1f9ac55b-f3ff-4ab6-bbbe-62406f580c1a.jpeg');
INSERT INTO `imgs` VALUES ('084b6831-fb83-42b2-aa97-dbe41194f96c', '54f0d1de-55e6-4c0f-bd73-eff3e4f37746.jpeg');
INSERT INTO `imgs` VALUES ('0ced188c-d5b7-477c-b4c4-f869693fd857', 'aed4114e-861b-47ed-8ccf-72539867f029.jpeg');
INSERT INTO `imgs` VALUES ('0f21a0fc-60bc-49b6-8928-b69b8fc8aad1', 'cf018e5c-9a9c-4254-82e2-4b604ba32645.jpeg');
INSERT INTO `imgs` VALUES ('0f963c98-ffe8-44e4-9cb3-b62f6ecce77d', '15a7bfbb-2802-4e5d-887f-2bd0fb7e346a.jpeg');
INSERT INTO `imgs` VALUES ('0fa16a51-bd89-47c7-8a4d-1a208499c7ce', 'bfc79d18-074b-4fdb-bb2a-f33d4addfcb5.jpeg');
INSERT INTO `imgs` VALUES ('1018c420-47cf-4c0b-8d36-5e55120099a5', '78c951d1-e12e-4bab-8259-e1e6c0f3c8cb.jpeg');
INSERT INTO `imgs` VALUES ('1371815a-ae30-4849-b192-2da5614d6e69', '1fc61042-e23e-460c-a1a1-1489bc21a180.jpeg');
INSERT INTO `imgs` VALUES ('15d8b7f9-86c7-4aec-9045-b765ef8ac3ab', '4c098136-701d-4b31-a1e6-0467d9fdd360.jpeg');
INSERT INTO `imgs` VALUES ('16069da7-6d99-4e3f-9bcd-d295bee1aa55', '3325a376-4fe8-4866-b68f-48b4772b4757.jpeg');
INSERT INTO `imgs` VALUES ('160b67fe-9dc5-4d73-89e0-87ce7cc4430f', '150c87d2-f1a7-4aef-b4e6-cc937d7aa2da.jpeg');
INSERT INTO `imgs` VALUES ('17172572-304a-4d2a-8147-ac51673f76bc', 'ab990e15-d03a-4454-b4aa-816c8514793a.jpeg');
INSERT INTO `imgs` VALUES ('174199da-da28-41bb-88f7-3d41da4d2cce', 'bf0cd3bf-6695-4b34-8988-ced8f4c625ac.png');
INSERT INTO `imgs` VALUES ('17cda138-261c-4e1a-8d8f-66e0ec8e3b06', 'adbf8dfa-a5f8-4ba3-a16f-bc878226453a.jpeg');
INSERT INTO `imgs` VALUES ('18c8e83f-85a7-4905-9401-afb7eb522aa4', 'e534c1ed-e83d-4571-ae56-d59523dee9ba.jpeg');
INSERT INTO `imgs` VALUES ('22bf0967-45ce-4c04-aa43-1d6d393c6d23', 'f6ef32ca-d07e-4ee3-9b6b-6201aba1a0a8.jpeg');
INSERT INTO `imgs` VALUES ('243b4abd-f732-479a-8339-2cbd729e32ed', '0a96b218-ca06-4893-a4fb-d126bbb4362c.jpeg');
INSERT INTO `imgs` VALUES ('27147d56-7e39-4d89-8e03-889bc97b6f4f', '10a8ba9d-64db-4436-bbb6-d9167a9acccd.jpeg');
INSERT INTO `imgs` VALUES ('275c8c59-90ce-4be5-affe-cae3bb143132', '64e8b8be-b16a-4c76-91b7-84e2ad78f9b7.jpeg');
INSERT INTO `imgs` VALUES ('2b9489f9-2045-4e24-a8e9-30c666ab10ef', 'ebe1a9ab-e0dd-401b-a4e6-6f6399630f4d.jpeg');
INSERT INTO `imgs` VALUES ('2ebb66dc-a1a7-45c9-aa37-136b45cfaae3', '1cdf93be-8412-40e7-889e-4a9389bb4154.jpeg');
INSERT INTO `imgs` VALUES ('2f74c58a-3df8-4b32-bf0c-4cc3242d815f', '62ec18c3-5a07-496f-8ac2-e6d1e20fbc8e.jpeg');
INSERT INTO `imgs` VALUES ('303adb82-663f-4642-b592-7791bf1c0554', 'ee6f6fe4-0026-44f1-9039-11b356255f95.jpeg');
INSERT INTO `imgs` VALUES ('3101edd8-d524-4b79-a692-cf7b09f1f192', '07c560a8-e784-4ea0-bdb0-958d17b5e782.jpeg');
INSERT INTO `imgs` VALUES ('318247d0-f2e4-4399-9efb-59c1a794bd69', 'd7780015-406a-4839-b626-ff642b5edc5c.jpeg');
INSERT INTO `imgs` VALUES ('345e3be8-e016-4642-a1e6-8872464671d8', '985ecd5d-e363-4a2d-a6c7-88391dbed57c.jpeg');
INSERT INTO `imgs` VALUES ('34f2d675-40e4-4aa7-955d-9c73695ed9af', '2071aafe-ed56-4efd-8f63-e0d31c497a5e.jpeg');
INSERT INTO `imgs` VALUES ('358b96f6-faeb-4b79-9d17-de777ac34e8c', 'd57ca968-66eb-494b-9f11-f894f3a30a76.jpeg');
INSERT INTO `imgs` VALUES ('36b00c11-75bc-4d5f-96c3-6e2ac168a6fa', 'e4abe1b1-4f35-4ea4-b3cc-69bf4baa9c80.jpeg');
INSERT INTO `imgs` VALUES ('37ba4d17-7dc7-437a-960a-1efb16d1d6c5', 'ce3c489c-7ec4-48ba-adb6-7ee3adaeb75d.jpeg');
INSERT INTO `imgs` VALUES ('38e1042a-5efd-4ad0-8c2d-b11f8717e139', 'c5da54a7-24a0-4e39-ae24-8b6c84794b0a.jpeg');
INSERT INTO `imgs` VALUES ('39aaa26b-6601-4a24-bda1-77308db614c7', '9664d8cb-aa4d-4b75-b3d4-d26b85a165fd.jpeg');
INSERT INTO `imgs` VALUES ('3a2a3959-e44a-4471-9b44-697f0a78a527', '5bf289e7-3d48-4b45-bbf6-2bc07ff1a179.jpeg');
INSERT INTO `imgs` VALUES ('3ab46fe6-4a03-416b-8c2d-6cbc0e41d22f', '26645cd0-e673-4841-a743-6e3c9d363570.jpeg');
INSERT INTO `imgs` VALUES ('3fe48ccd-88c0-45f7-9071-122d33f53238', 'dd460ba6-82a3-428e-b13b-29176b342b2b.jpeg');
INSERT INTO `imgs` VALUES ('41911f5a-936a-411a-a251-c968c9cb5c79', 'c97ca315-3811-4503-b6ae-7e5a8dd730d5.jpeg');
INSERT INTO `imgs` VALUES ('49164ede-6cb8-4267-8744-d97d69de5bd9', '1648df47-84ee-4fe5-bfbe-a3f3701a146a.jpeg');
INSERT INTO `imgs` VALUES ('4997ec13-4ec2-4932-a6b1-01a6b7fde79c', 'aa118212-1641-4cd1-b13e-0b84264c1d85.jpeg');
INSERT INTO `imgs` VALUES ('4fe94806-9e07-4967-92ce-efde2575dc7c', '26fed10e-255c-45e8-bdd1-29e2f5c6eec7.jpeg');
INSERT INTO `imgs` VALUES ('50dae349-cea2-438b-b3af-c267bc49da1e', 'a6f46389-fe92-4e9e-bbb9-1f6519bdbb73.jpeg');
INSERT INTO `imgs` VALUES ('511e6186-4e2e-4d1a-89ce-5a989ae7d9bc', 'd5b32e70-8228-4c68-8ed0-d38e37aacbc6.jpeg');
INSERT INTO `imgs` VALUES ('52df4ea8-1228-4247-9feb-677c3edf43f9', 'c12e89eb-ec05-4c1f-83c3-86153a1180d9.jpeg');
INSERT INTO `imgs` VALUES ('54dc17dd-23ed-4398-a7bf-9d8b9c407fd3', '5af22020-e3a3-4a21-b322-30f367141e36.jpeg');
INSERT INTO `imgs` VALUES ('5bb14658-9b40-4673-b4cf-dfacf1d7e2a6', '973ea6d3-6056-41b6-9d42-5cd5ed27cafa.jpeg');
INSERT INTO `imgs` VALUES ('5e6ae63f-2dbf-4cdb-aa4e-d36e1df1d13f', '79b0aa53-818b-4629-9623-58c22a3c19d3.jpeg');
INSERT INTO `imgs` VALUES ('60e9ed30-2b02-4677-af00-d693f1587915', 'b6f9e639-2d02-49e5-bd35-6f63bd238307.jpeg');
INSERT INTO `imgs` VALUES ('62f1df1d-3aca-4b60-95e6-a15921d47ca3', 'b66422cf-a2f2-4c91-bd72-1ece9f064f9a.jpeg');
INSERT INTO `imgs` VALUES ('6307d916-c73c-4a45-b433-105c4f24c895', 'fed1689a-8e14-43b5-ba22-9460d000180b.jpeg');
INSERT INTO `imgs` VALUES ('634702f3-8caf-4a65-99b7-0eb15593ceed', '1b233ee3-54c4-441e-8ec0-89f12b87f118.png');
INSERT INTO `imgs` VALUES ('64662319-6cac-4753-81fb-1b1b3ed28228', 'f795c62d-2f89-4db6-add1-cab659781780.jpeg');
INSERT INTO `imgs` VALUES ('6623d244-419d-4ad7-8cf7-858a69a6caa9', '58dd90fc-a8e4-49b5-8654-df18d3d05603.jpeg');
INSERT INTO `imgs` VALUES ('6d6313dd-314a-4457-891e-e0fb0dab77df', '84689cdc-379f-4a52-b348-115a12d07325.jpeg');
INSERT INTO `imgs` VALUES ('6e4fb3db-d2dc-4f68-a047-07890223a8db', '3ef57a28-a46a-45d3-b1ef-ac2838736c25.jpeg');
INSERT INTO `imgs` VALUES ('71612b0a-d542-4cfa-84b4-b46f90426330', '4ca3c4f5-d1b4-4d2e-aeb0-0d24929c3c19.jpeg');
INSERT INTO `imgs` VALUES ('727e87c8-0b98-4341-9ec7-2011eee24b69', '835bde46-bf57-4a49-86a8-df28415adea2.jpeg');
INSERT INTO `imgs` VALUES ('73585d99-abdc-490f-a194-4cf562e6f3e3', '059ddb6f-5a13-41ce-bbe2-7fe6ec350ba4.jpeg');
INSERT INTO `imgs` VALUES ('75146e15-4163-4311-a854-b6f478a87149', '20f27246-2e47-4847-ba00-b2c17bfde6c5.jpeg');
INSERT INTO `imgs` VALUES ('7562604a-4858-43d6-8d02-56bf7358c72f', '410739a6-f886-4339-834f-5fb38a244d93.jpeg');
INSERT INTO `imgs` VALUES ('75c35112-9284-4150-bf22-a01d88360ac5', 'bafd66d1-20df-49e6-ba77-277fd98cd6cc.png');
INSERT INTO `imgs` VALUES ('79843839-2980-4a7a-88d7-dda6685e8b72', 'e4487aa7-440a-4a6e-aa70-33e46cb44429.jpeg');
INSERT INTO `imgs` VALUES ('79dc872b-f7b6-4433-a3d1-e62b3c2cdb21', '3abe8056-75c4-4d4c-a113-608173bf20f2.jpeg');
INSERT INTO `imgs` VALUES ('7ab802f1-f653-4052-aa45-865bd38c8c32', 'd2371d55-9b86-40cc-a385-1f5e4a4fc27c.jpeg');
INSERT INTO `imgs` VALUES ('7ad04249-1ab1-4b92-b2a2-7eb2e53cfe37', 'e0a24d64-3d01-41c2-ba77-072b8049c758.jpeg');
INSERT INTO `imgs` VALUES ('7d9161f7-0ba1-44ee-9d8f-327fb53129eb', '16c74c5d-c80b-410b-952d-e1028289d44a.jpeg');
INSERT INTO `imgs` VALUES ('7e12b0ab-dbda-45b2-9bc6-81624f00ce13', 'b66e2c3b-c6ca-4ae0-b263-cdfde7e9a6b9.jpeg');
INSERT INTO `imgs` VALUES ('81b46d84-2f1d-41cb-b467-2298ed9b8805', 'e3ecba79-4f96-47af-9d98-349f54b67ab7.jpeg');
INSERT INTO `imgs` VALUES ('83176f0d-83ef-40b6-93f4-866ebe404ad5', '38e564a4-0725-4f7a-b271-53409bdee0dd.jpeg');
INSERT INTO `imgs` VALUES ('83c6a407-505b-41d1-9644-1c6f4c53ce92', '1c8a2a65-d1fe-4233-a72d-cea41ed0caea.jpeg');
INSERT INTO `imgs` VALUES ('8657a47e-d350-4a25-a6b6-ae236cd3fa69', 'e194deb9-9360-4ad6-9afe-e04661c17fe3.jpeg');
INSERT INTO `imgs` VALUES ('8957b08a-9aff-489b-8f65-bbd8f3635e95', 'ecf5ff07-618e-4fef-a6ae-4bac7b0dd924.jpeg');
INSERT INTO `imgs` VALUES ('8bd94f01-1d00-46d6-bd2d-81fba6b820be', '21fc511d-eed7-4826-b66c-16b8bfbb7c47.jpeg');
INSERT INTO `imgs` VALUES ('8cf97e16-5b4d-405c-a6e3-c85063f7157d', '8f0961e0-4b0c-42c3-9940-0435d86d3cc3.jpeg');
INSERT INTO `imgs` VALUES ('9253a6c1-cd8c-47fc-824d-b092bd0b0574', '77e3577a-7d2c-41f1-a0a3-d8ee4b0524da.jpeg');
INSERT INTO `imgs` VALUES ('9519ad9d-2a42-4287-96e2-6e81ac3703f3', '544ca102-6872-4ad7-a9ab-7c8038bc8b0a.jpeg');
INSERT INTO `imgs` VALUES ('958267b0-5a79-490f-b5ee-5a6200ad1060', '65c809bc-af11-4456-9d11-bdfa8eb3ea5c.jpeg');
INSERT INTO `imgs` VALUES ('9c840371-b095-48c4-80cc-58c57cf61a03', '994a8f37-2304-4eac-8b7a-e4620c7c5069.jpeg');
INSERT INTO `imgs` VALUES ('9f8831c5-380d-49d7-8ef3-54c656582071', '86c10818-06d0-49fb-8097-80182d0f12c3.jpeg');
INSERT INTO `imgs` VALUES ('a128600b-8947-41ed-9e00-ea632c7d343b', '30873808-2b62-4340-9b53-e7931fc826e2.jpeg');
INSERT INTO `imgs` VALUES ('a19cd05a-0724-401c-917b-db71a6d2c4fa', '6041a952-0cc0-4536-8057-34fa82ddb7f6.jpeg');
INSERT INTO `imgs` VALUES ('a1acf09a-ab9c-4fb0-a3b4-bce0b79cf4d8', '3ecd4a87-5632-43f1-aca3-ae3265be287f.jpeg');
INSERT INTO `imgs` VALUES ('a259c20f-42bc-4bea-bc5c-2a25a9b4d455', '6d53c818-e0c8-4722-a6b0-2a3827610d8b.jpeg');
INSERT INTO `imgs` VALUES ('a41ae7cc-7eb5-487c-8fd6-8f9480431048', '7bdb7b56-2c3a-4ad3-80d5-6555b4a328ba.jpeg');
INSERT INTO `imgs` VALUES ('a429b22f-52ef-4775-bd59-0f5ca9f1d8ec', '830a4dbe-5101-494a-9321-ae2f1478d731.jpeg');
INSERT INTO `imgs` VALUES ('a42ee897-925a-4bbc-9aad-4e24525d5258', 'db9f03d7-3ec4-447b-9b1c-b3de4182aee1.jpeg');
INSERT INTO `imgs` VALUES ('a4d2196a-ec55-4396-8368-50e36a100f88', '29f3790a-672b-4c92-8292-a1cb1656ad7d.png');
INSERT INTO `imgs` VALUES ('a6d228ba-8ede-4ec2-ad0d-308063427ef7', '5ea01532-fb20-49c8-919d-450f08bcb088.jpeg');
INSERT INTO `imgs` VALUES ('a7a4fde9-c2a2-4fd5-a413-f924c055239f', 'bb0c2df3-1afb-4fab-ae7e-018a7e802fdd.jpeg');
INSERT INTO `imgs` VALUES ('a8b26488-f01f-4b2e-92c6-83bdd1354932', 'fe2ae771-7c69-4cb6-8f13-a8b893d27979.jpeg');
INSERT INTO `imgs` VALUES ('aa4cb800-3d2d-431a-8095-f726e2ed886f', '747b7e67-ea09-465e-9e83-5e9860a62728.png');
INSERT INTO `imgs` VALUES ('ab3ea00b-9179-4bef-94f6-47593f8c23e9', '87709767-d417-48b7-b939-453f2d313c0a.jpeg');
INSERT INTO `imgs` VALUES ('b150e40f-f89f-4323-ba10-0512a797f1a1', '4444560c-f75c-4a2b-bee3-9761eafdac0a.jpeg');
INSERT INTO `imgs` VALUES ('b19cbfed-c5ef-4cfd-8546-dedb0fde7a58', '1261ed3b-4d99-4f49-949d-0126ef23082e.jpeg');
INSERT INTO `imgs` VALUES ('b4926cd0-1d97-48d5-ac95-a1bed07c2fb8', 'f099e0b9-fc75-48a8-bef0-57ee7195d40a.jpeg');
INSERT INTO `imgs` VALUES ('b68346ce-da70-4cb4-9db5-a71c1d8b8c00', '0ac05089-3355-469e-9016-e90f1c9110f8.jpeg');
INSERT INTO `imgs` VALUES ('baaa3229-cc04-4810-92b8-201cbcc74398', '15be1db0-88de-40da-9562-abd41354b701.jpeg');
INSERT INTO `imgs` VALUES ('bc5e036f-6620-48a9-b313-d54b5f81d6ef', 'f58e8212-b998-4dd0-b3e9-f7e5d85b22a2.jpeg');
INSERT INTO `imgs` VALUES ('bc842ccd-7333-44e5-bcfe-80c27f11a2eb', 'e7e1cf30-901f-4664-8068-8b84c099f73e.png');
INSERT INTO `imgs` VALUES ('be1c421a-7472-4554-82d9-25651853d1c8', '7d31e4f5-699b-480a-a8e1-d787a0a54262.jpeg');
INSERT INTO `imgs` VALUES ('bedf7209-aa30-4ebd-9e83-6faf41b3a258', '2d454f0e-bdae-4c22-871f-a2987db2f777.jpeg');
INSERT INTO `imgs` VALUES ('bf916df2-2918-4f49-9a67-f5928f624193', 'f4402db9-0563-4e06-ab7a-b655a8b55756.jpeg');
INSERT INTO `imgs` VALUES ('c31113ba-0ac0-4bfb-b209-4cbe87e44273', '394e509f-ee77-4d7b-b323-4bba0f96d648.jpeg');
INSERT INTO `imgs` VALUES ('c4ca0c23-8f72-4430-8c04-2d52f3ce8907', 'f7367044-79ba-43cd-8bec-383b8ba3f209.jpeg');
INSERT INTO `imgs` VALUES ('c519501a-118c-4054-815f-bd808983d672', '07dc0281-82bc-4505-a043-ea91246f1b83.jpeg');
INSERT INTO `imgs` VALUES ('c81b3936-958b-472b-b8df-06828cb22768', '773ed613-ce35-47f9-b5be-db08583b7ca4.jpeg');
INSERT INTO `imgs` VALUES ('c92668bb-1dcd-4459-90dd-4737534aec0e', '0896c845-5002-4f18-99c4-97438d6f75df.jpeg');
INSERT INTO `imgs` VALUES ('cb269a39-9ed5-4ddd-8596-a1e58dc951b5', '452eb89e-7eef-4ec2-afeb-36a27c322592.png');
INSERT INTO `imgs` VALUES ('cbcaa446-00e9-4b8f-be47-5231c01301dd', '538dfcb6-9dd7-47e5-8a08-7d92905e46ad.jpeg');
INSERT INTO `imgs` VALUES ('d1ebc87a-78c6-43e3-b285-849e7513c6ea', 'f3fd6db4-54bd-4f38-95b8-b25abdf44f42.jpeg');
INSERT INTO `imgs` VALUES ('d383bb4a-14de-46cf-bf78-a63142def791', '25609a1d-1718-4f15-ae6a-bd129def8f65.jpeg');
INSERT INTO `imgs` VALUES ('d61c76b3-8332-44b8-bceb-c487c3203628', '1d6eabc1-5123-436b-a1c7-3ea1e2680628.jpeg');
INSERT INTO `imgs` VALUES ('d71adf23-0170-49b0-8a47-025cbbe64855', '8cad0680-852b-4da0-a9be-96413385ff9b.jpeg');
INSERT INTO `imgs` VALUES ('d72e9591-7be7-45ce-8ad0-6e55b7665661', '0d27d37b-650a-4736-87aa-798683524719.jpeg');
INSERT INTO `imgs` VALUES ('d8dac7f7-2b0e-478f-9ccd-b125a236482b', '86251dd0-b1b8-449c-ad1d-4ac577b98292.jpeg');
INSERT INTO `imgs` VALUES ('da123ff3-94dd-439f-9107-30178ce982c5', 'f608e675-b7fc-436d-9cc8-a842e5ef45b6.jpeg');
INSERT INTO `imgs` VALUES ('dac52109-eb92-4b41-9e75-13f000562ad6', 'e91cbc12-64b7-47c5-b954-81b6d58e688f.jpeg');
INSERT INTO `imgs` VALUES ('e1441bb3-9668-4b45-b85a-7fd18c69a352', '525459f8-13c1-4f67-b445-4aa17320b622.jpeg');
INSERT INTO `imgs` VALUES ('e1fb5cae-b4a2-4b4a-9a26-1d708023c914', '7cc5e14e-06ec-4e01-addd-f00f7080b4f5.jpeg');
INSERT INTO `imgs` VALUES ('ea56a464-ed4a-4939-b8a7-e3e028e3f4df', 'f46cab20-1d75-489e-b012-66d7f2a15c9d.jpeg');
INSERT INTO `imgs` VALUES ('ee1db32b-833b-4ab5-bcdb-52d2a2995cd9', 'c22f7824-fcdc-4fba-903d-057b3f886b8d.jpeg');
INSERT INTO `imgs` VALUES ('f090c3e7-b1e1-4869-8ab2-5c720f629f7f', 'a56446b9-4e1b-4620-861e-be3eb5624477.jpeg');
INSERT INTO `imgs` VALUES ('f24953e9-6a9c-4f21-b27d-c2f7bd3463d2', 'ee3c2636-1080-4e28-bf23-158dd9428a02.jpeg');
INSERT INTO `imgs` VALUES ('f5afaeb2-93b6-41e1-88b7-8f519d56d812', '1e71c254-d0a9-4270-89ef-68fb3911a5c0.jpeg');
INSERT INTO `imgs` VALUES ('f6e81d0b-b79e-402a-9857-e3bddec35ec6', '2bbc33ae-3127-443e-a18a-4a8d692cf856.png');
INSERT INTO `imgs` VALUES ('f97b2a64-8178-411b-805d-d160c3aeef3e', '75b91eaf-cd08-4033-9b8e-76a72fb5badc.jpeg');
INSERT INTO `imgs` VALUES ('fa815a02-171b-487d-933e-6428af2fe346', 'd5c03649-e979-4f9e-b733-7f8cc68e47c8.jpeg');
INSERT INTO `imgs` VALUES ('fbb89de0-8cca-4456-a95e-0b047352276c', '1193f185-4400-406f-a1bc-bdc67201d7fd.jpeg');
INSERT INTO `imgs` VALUES ('fdd24451-1d3f-4c13-aa8e-1de58300b841', '14827ba3-309a-4202-8755-4ae336acbe41.jpeg');
INSERT INTO `imgs` VALUES ('fe9cc34f-a48f-4119-a992-e0bf7bc14b03', '6b1b129f-0bb9-411d-8fa8-4032c0999a3f.jpeg');

-- ----------------------------
-- Table structure for indexcarousels
-- ----------------------------
DROP TABLE IF EXISTS `indexcarousels`;
CREATE TABLE `indexcarousels` (
  `id` varchar(36) NOT NULL,
  `imgId` varchar(36) NOT NULL,
  `createTime` datetime NOT NULL,
  `introduction` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forkey_imgid` (`imgId`),
  CONSTRAINT `forkey_imgid` FOREIGN KEY (`imgId`) REFERENCES `imgs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indexcarousels
-- ----------------------------
INSERT INTO `indexcarousels` VALUES ('452eb89e-7eef-4ec2-afeb-36a27c322592', 'cb269a39-9ed5-4ddd-8596-a1e58dc951b5', '2016-10-13 14:11:56', '');
INSERT INTO `indexcarousels` VALUES ('bf0cd3bf-6695-4b34-8988-ced8f4c625ac', '174199da-da28-41bb-88f7-3d41da4d2cce', '2016-10-13 14:11:51', '');

-- ----------------------------
-- Table structure for menutree
-- ----------------------------
DROP TABLE IF EXISTS `menutree`;
CREATE TABLE `menutree` (
  `id` varchar(36) NOT NULL,
  `iconCls` varchar(50) DEFAULT NULL,
  `text` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parentId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKDC11C17D9E7AE967` (`parentId`),
  CONSTRAINT `menutree_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menutree` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menutree
-- ----------------------------
INSERT INTO `menutree` VALUES ('ddgl', null, '租车订单管理', '/admins/cars/ddgl.jsp', 'zcywgl');
INSERT INTO `menutree` VALUES ('fygl', null, '租车费用管理', '/admins/cars/zcfygl.jsp', 'zcywgl');
INSERT INTO `menutree` VALUES ('gggl', null, '公告管理', '/admins/other/gggl.jsp', 'qt');
INSERT INTO `menutree` VALUES ('glydlrz', null, '管理员登录日志', '/admins/adm/glydlrz.jsp', 'rzgl');
INSERT INTO `menutree` VALUES ('gwcygl', null, '官网成员管理', '/admins/officialwebsite/gwcygl.jsp', 'gwywgl');
INSERT INTO `menutree` VALUES ('gwlbgl', null, '官网轮播管理', '/admins/officialwebsite/gwlbgl.jsp', 'gwywgl');
INSERT INTO `menutree` VALUES ('gwlxwmgl', null, '官网用户意见管理', '/admins/officialwebsite/gwlxwmgl.jsp', 'gwywgl');
INSERT INTO `menutree` VALUES ('gwxwgl', null, '官网新闻管理', '/admins/officialwebsite/gwxwgl.jsp', 'gwywgl');
INSERT INTO `menutree` VALUES ('gwxxzsgl', null, '官网日常展示管理', '/admins/officialwebsite/gwrczsgl.jsp', 'gwywgl');
INSERT INTO `menutree` VALUES ('gwywgkgl', null, '官网业务管理', '/admins/officialwebsite/gwywgl.jsp', 'gwywgl');
INSERT INTO `menutree` VALUES ('gwywgl', '', '官网业务管理', '', 'root');
INSERT INTO `menutree` VALUES ('jqjslb', null, '景区介绍列表', '/admins/viewticket/viewticket_intros.jsp', 'mpgl');
INSERT INTO `menutree` VALUES ('jqlb', null, '景区列表', '/admins/viewticket/viewticket_views.jsp', 'mpgl');
INSERT INTO `menutree` VALUES ('jqmmdd', '', '景区门票订单', '/admins/viewticket/viewticket_orders.jsp', 'mpgl');
INSERT INTO `menutree` VALUES ('jqmplb', null, '景区门票列表', '/admins/viewticket/viewticket_tickets.jsp', 'mpgl');
INSERT INTO `menutree` VALUES ('jqtjgl', null, '景区推荐管理', '/admins/viewticket/viewticket_recommendView.jsp', 'mpgl');
INSERT INTO `menutree` VALUES ('jqtplb', null, '景区轮播', '/admins/viewticket/viewticket_carousels.jsp', 'mpgl');
INSERT INTO `menutree` VALUES ('mpgl', null, '门票管理', '', 'root');
INSERT INTO `menutree` VALUES ('qcgl', null, '汽车管理', '/admins/cars/qcgl.jsp', 'zcywgl');
INSERT INTO `menutree` VALUES ('qt', null, '其他', null, 'root');
INSERT INTO `menutree` VALUES ('qxgl', null, '权限管理', '/admins/adm/qxgl.jsp', 'xtgl');
INSERT INTO `menutree` VALUES ('qxglrz', null, '权限管理日志', '/admins/adm/qxglrz.jsp', 'rzgl');
INSERT INTO `menutree` VALUES ('root', null, '首页', null, null);
INSERT INTO `menutree` VALUES ('rzgl', null, '日志管理', null, 'root');
INSERT INTO `menutree` VALUES ('sylbgl', null, '首页轮播管理', '/admins/other/sylbgl.jsp', 'xtgl');
INSERT INTO `menutree` VALUES ('syqctjgl', null, '首页汽车推荐管理', '/admins/cars/syqctjgl.jsp', 'zcywgl');
INSERT INTO `menutree` VALUES ('xtgl', null, '系统管理', null, 'root');
INSERT INTO `menutree` VALUES ('yhdlrz', null, '用户登录日志', '/admins/users/yhdlrz.jsp', 'rzgl');
INSERT INTO `menutree` VALUES ('yhgl', null, '用户管理', '/admins/users/yhgl.jsp', 'xtgl');
INSERT INTO `menutree` VALUES ('yhglrz', null, '用户管理日志', '/admins/users/yhglrz.jsp', 'rzgl');
INSERT INTO `menutree` VALUES ('zcywgl', null, '租车业务管理', '', 'root');

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `id` varchar(36) NOT NULL,
  `creatAdminId` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `status` int(10) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forkey_amdinId` (`creatAdminId`),
  CONSTRAINT `forkey_amdinId` FOREIGN KEY (`creatAdminId`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES ('c175261c-1f2b-4ec8-93d1-fd3b266954be', '1138829222', '测试管理员的公告', '测试管理员的公告', '2016-07-12 13:45:24', '2016-07-12 14:01:55', '1', '0');

-- ----------------------------
-- Table structure for officialwebsite_contact_us
-- ----------------------------
DROP TABLE IF EXISTS `officialwebsite_contact_us`;
CREATE TABLE `officialwebsite_contact_us` (
  `id` varchar(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `personOrOrg` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `updateTime` datetime NOT NULL,
  `createTime` datetime NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `status` int(1) NOT NULL,
  `adminNote` text COMMENT '管理员的备注',
  `dealAdminId` varchar(36) DEFAULT NULL COMMENT '处理该意见的管理员',
  PRIMARY KEY (`id`),
  KEY `for_key_admin_id` (`dealAdminId`),
  CONSTRAINT `for_key_admin_id` FOREIGN KEY (`dealAdminId`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of officialwebsite_contact_us
-- ----------------------------
INSERT INTO `officialwebsite_contact_us` VALUES ('132f2402-3583-44ec-9022-fa8e38eeae8c', '1138829222@qq.com', 'zk', '156564156', '2016-08-29 13:08:24', '2016-08-29 13:08:24', '0', '0', null, null);
INSERT INTO `officialwebsite_contact_us` VALUES ('9092661c-8bef-4b5c-8397-a49326fe0231', '1138829222@qq.com', '1138829222@qq.com', '1138829222@qq.com', '2016-07-30 18:00:23', '2016-07-30 18:00:23', '0', '0', null, null);

-- ----------------------------
-- Table structure for officialwebsite_index_carousel
-- ----------------------------
DROP TABLE IF EXISTS `officialwebsite_index_carousel`;
CREATE TABLE `officialwebsite_index_carousel` (
  `id` varchar(36) NOT NULL,
  `imgName` varchar(55) NOT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `status` int(1) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `imgId` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forkey_img_id` (`imgName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of officialwebsite_index_carousel
-- ----------------------------
INSERT INTO `officialwebsite_index_carousel` VALUES ('16e5d3b2-8de4-43b2-b36c-43f72bb2b7d0', '16e5d3b2-8de4-43b2-b36c-43f72bb2b7d0.jpeg', '这是小村庄', '2016-07-31 00:45:42', '2016-07-31 00:49:42', '1', '0', '');
INSERT INTO `officialwebsite_index_carousel` VALUES ('26af2e5b-8ea1-4a43-893d-f458702c5686', '26af2e5b-8ea1-4a43-893d-f458702c5686.jpeg', '这是艾菲尔', '2016-07-31 00:48:20', '2016-07-31 00:49:19', '1', '0', '');
INSERT INTO `officialwebsite_index_carousel` VALUES ('2c4da8a4-d124-497f-b4c4-2329366ec6c4', '2c4da8a4-d124-497f-b4c4-2329366ec6c4.jpeg', '\r\n6666\r\n\r\n', '2016-07-26 21:58:10', '2016-07-28 14:04:23', '1', '1', '');
INSERT INTO `officialwebsite_index_carousel` VALUES ('47c14466-c2bc-47c7-90ee-4a7cff837b95', '47c14466-c2bc-47c7-90ee-4a7cff837b95.jpeg', '', '2016-07-26 22:12:25', '2016-07-31 00:43:18', '0', '0', '');
INSERT INTO `officialwebsite_index_carousel` VALUES ('58d5b4c8-7c1d-499b-b7d0-61e66e7fa7de', '58d5b4c8-7c1d-499b-b7d0-61e66e7fa7de.jpeg', '', '2016-07-28 17:18:25', '2016-07-31 00:43:31', '0', '0', '');
INSERT INTO `officialwebsite_index_carousel` VALUES ('711154d1-1f04-4b49-8714-b4edf4c40236', '711154d1-1f04-4b49-8714-b4edf4c40236.jpeg', '这是红土区', '2016-07-31 00:48:06', '2016-07-31 00:49:32', '1', '0', '');
INSERT INTO `officialwebsite_index_carousel` VALUES ('b23dd168-841e-40dd-aadf-d7edfdcdc879', 'b23dd168-841e-40dd-aadf-d7edfdcdc879.jpeg', '\r\n\r\n\r\nasdfa\r\n\r\n\r\nasdad', '2016-07-26 21:58:22', '2016-07-26 22:28:14', '1', '1', '');
INSERT INTO `officialwebsite_index_carousel` VALUES ('b316cb3e-ea52-4d3c-9ebe-df0f15f7ee56', 'b316cb3e-ea52-4d3c-9ebe-df0f15f7ee56.jpeg', '', '2016-07-31 00:43:06', '2016-07-31 00:45:50', '0', '0', '');
INSERT INTO `officialwebsite_index_carousel` VALUES ('ed7ae9ff-f472-41c3-8c0a-806bf5fa087e', 'ed7ae9ff-f472-41c3-8c0a-806bf5fa087e.jpeg', '', '2016-07-31 00:42:42', '2016-07-31 00:45:56', '0', '0', '');
INSERT INTO `officialwebsite_index_carousel` VALUES ('ee420ddc-9a10-45a7-8b83-4c2f12d968ef', 'ee420ddc-9a10-45a7-8b83-4c2f12d968ef.jpeg', '', '2016-07-28 17:18:13', '2016-07-31 00:43:00', '0', '0', '');
INSERT INTO `officialwebsite_index_carousel` VALUES ('eec52766-c6e8-4219-9ee8-2fb108c67526', 'eec52766-c6e8-4219-9ee8-2fb108c67526.jpeg', 'asdadsa', '2016-07-26 21:55:42', '2016-07-28 14:04:27', '1', '1', '');

-- ----------------------------
-- Table structure for officialwebsite_index_display
-- ----------------------------
DROP TABLE IF EXISTS `officialwebsite_index_display`;
CREATE TABLE `officialwebsite_index_display` (
  `id` varchar(36) NOT NULL,
  `imgName` varchar(55) NOT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `status` int(1) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `imgId` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forkey_img_id` (`imgName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of officialwebsite_index_display
-- ----------------------------
INSERT INTO `officialwebsite_index_display` VALUES ('1014e921-13bd-4245-b73f-1e9d414f7117', '1014e921-13bd-4245-b73f-1e9d414f7117.jpeg', '4444444', '2016-07-27 08:24:22', '2016-07-27 08:24:22', '1', '1', '');
INSERT INTO `officialwebsite_index_display` VALUES ('70cb8992-0a86-4a53-9651-ed445dc83a42', '70cb8992-0a86-4a53-9651-ed445dc83a42.jpeg', '系统架构师是一个既需要掌控整体又需要洞悉局部瓶颈并依据具体的业务场景给出解决方案的团队领导型人物。', '2016-07-28 17:27:58', '2016-07-31 20:40:30', '1', '0', '');
INSERT INTO `officialwebsite_index_display` VALUES ('74abced9-7514-42cf-b613-5439a3e0e896', '74abced9-7514-42cf-b613-5439a3e0e896.jpeg', 'ryktyu\r\njkf\r\nfy\r\nfy\r\nuy\r\n\r\nyrukr', '2016-07-26 21:58:57', '2016-07-26 22:21:40', '1', '1', '');
INSERT INTO `officialwebsite_index_display` VALUES ('89625884-2ae6-491f-adc4-2ec13252ffef', '89625884-2ae6-491f-adc4-2ec13252ffef.jpeg', '程序员(英Programmer)是从事程序开发、维护的专业人员。软件从业人员分为初级程序员、高级程序员、系统分析员，系统架构师，测试工程师六大类', '2016-07-28 17:28:09', '2016-07-31 20:39:15', '1', '0', '');
INSERT INTO `officialwebsite_index_display` VALUES ('9dd9305d-fdf7-4bf1-a44c-2c262c79909d', '9dd9305d-fdf7-4bf1-a44c-2c262c79909d.jpeg', '456456', '2016-07-26 22:14:27', '2016-07-26 22:21:17', '1', '1', '');
INSERT INTO `officialwebsite_index_display` VALUES ('9eebf1af-0888-4f20-90aa-eeb3e16cd6db', '9eebf1af-0888-4f20-90aa-eeb3e16cd6db.jpeg', '计算机（computer）俗称电脑可以进行逻辑计算，还具有存储记忆功能的机器。', '2016-07-28 17:26:34', '2016-07-28 17:36:27', '1', '0', '');
INSERT INTO `officialwebsite_index_display` VALUES ('c3150bb5-aab3-416f-8933-3495b0a745c7', 'c3150bb5-aab3-416f-8933-3495b0a745c7.jpeg', ']]]]]]', '2016-07-27 08:26:17', '2016-07-27 08:26:30', '1', '1', '');
INSERT INTO `officialwebsite_index_display` VALUES ('c9420312-2f4e-4f87-81bf-e8f30a4d791a', 'c9420312-2f4e-4f87-81bf-e8f30a4d791a.jpeg', '骇客，源自英文Hacker，即闯入计算机系统或者网络系统者。', '2016-07-28 17:28:27', '2016-07-28 17:37:47', '1', '0', '');
INSERT INTO `officialwebsite_index_display` VALUES ('d78cbf25-db1d-4498-a7fb-0fc93acefcca', 'd78cbf25-db1d-4498-a7fb-0fc93acefcca.jpeg', '51', '2016-07-26 22:02:31', '2016-07-26 22:27:38', '1', '1', '');

-- ----------------------------
-- Table structure for officialwebsite_index_img
-- ----------------------------
DROP TABLE IF EXISTS `officialwebsite_index_img`;
CREATE TABLE `officialwebsite_index_img` (
  `id` varchar(36) NOT NULL,
  `createTime` datetime NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `status` int(11) NOT NULL,
  `updateTime` datetime NOT NULL,
  `imgId` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK118D84A7CF88DBC` (`imgId`),
  CONSTRAINT `FK118D84A7CF88DBC` FOREIGN KEY (`imgId`) REFERENCES `imgs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of officialwebsite_index_img
-- ----------------------------

-- ----------------------------
-- Table structure for officialwebsite_members
-- ----------------------------
DROP TABLE IF EXISTS `officialwebsite_members`;
CREATE TABLE `officialwebsite_members` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `head` varchar(55) NOT NULL COMMENT '头像',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `status` int(1) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of officialwebsite_members
-- ----------------------------
INSERT INTO `officialwebsite_members` VALUES ('123', 'asda', '总经理', '很牛的45一个man666', '123.jpeg', '2016-07-21 15:51:17', '2016-07-28 16:26:32', '1', '1');
INSERT INTO `officialwebsite_members` VALUES ('349fdf16-d73f-4bb5-bd47-9ba83a30ff92', '4545', null, '4545', '349fdf16-d73f-4bb5-bd47-9ba83a30ff92.jpeg', '2016-07-28 16:26:47', '2016-07-28 16:26:47', '0', '1');
INSERT INTO `officialwebsite_members` VALUES ('asd4a654d56', 'asda', '副总裁', '666', '132', '2016-07-21 15:51:17', '2016-07-21 15:51:20', '1', '1');
INSERT INTO `officialwebsite_members` VALUES ('asd4a654d5612', 'asda', '打算', '飒沓', '132', '2016-07-21 15:51:17', '2016-07-21 15:51:20', '1', '1');
INSERT INTO `officialwebsite_members` VALUES ('asd4a654d56123', 'asda', '打算', '飒沓', '132', '2016-07-21 15:51:17', '2016-07-21 15:51:20', '1', '1');
INSERT INTO `officialwebsite_members` VALUES ('asdad', 'asda', '打算', '飒沓', 'asdad.jpeg', '2016-07-21 15:51:17', '2016-07-28 16:31:02', '0', '1');
INSERT INTO `officialwebsite_members` VALUES ('c6aacad7-13b1-43b0-a0a1-7e2dfeb9556b', '苏轼', '宋朝文学家，政治家', '苏轼（1037年1月8日—1101年8月24日），字子瞻，又字和仲，号东坡居士，世称苏东坡、苏仙[1-3]  。汉族，北宋眉州眉山（今属四川省眉山市）人，祖籍河北栾城，北宋著名文学家、书法家、画家。', 'c6aacad7-13b1-43b0-a0a1-7e2dfeb9556b.png', '2016-07-28 16:48:20', '2016-07-28 16:50:08', '1', '0');
INSERT INTO `officialwebsite_members` VALUES ('ccc66cc5-b0d0-458c-bc7b-3c2a3658dbc3', '习近平', '国家主席，国家军委主席', '习近平，男，汉族，1953年6月生，陕西富平人，1969年1月参加工作，1974年1月加入中国共产党，清华大学人文社会学院马克思主义理论与思想政治教育专业毕业，在职研究生学历，法学博士学位。', 'ccc66cc5-b0d0-458c-bc7b-3c2a3658dbc3.png', '2016-07-28 16:32:47', '2016-07-28 16:50:14', '1', '0');
INSERT INTO `officialwebsite_members` VALUES ('d9b85e64-19df-44fb-a6e6-2ea014ec4593', '卡尔·马克思', '马克思主义创始人', '卡尔·海因里希·马克思（德语：Karl Heinrich Marx，1818年5月5日－1883年3月14日），马克思主义的创始人之一，第一国际的组织者和领导者。[1]  无产阶级的精神领袖，国际共产主义运动的先驱。', 'd9b85e64-19df-44fb-a6e6-2ea014ec4593.png', '2016-07-28 16:56:24', '2016-07-31 00:21:41', '1', '0');
INSERT INTO `officialwebsite_members` VALUES ('db5631e6-3976-4716-953b-1eed07d870fe', '张可', '扫地僧', '器宇轩昂，万人景仰，无人能及，玉树临风，内外兼备，才华横溢，情操高尚，超级无敌，炉火纯青，登峰造极，人见人爱，猪见猪赞，狗见狗夸，树见花开，花见花败，车见车爆胎，牛见了牛摆尾，羊见羊歇菜，鸭子见了满天飞，飞沙走石，鬼斧神工，振聋发聩，烛照天下，明见万里，雨露苍生，泽被万方，鹰视狼顾，龙行虎步，英姿伟岸，高屋建瓴，仁义道德，风流倜傥，大公无私，貌似潘安，才比宋玉，一树梨花压海棠', 'db5631e6-3976-4716-953b-1eed07d870fe.jpeg', '2016-10-14 10:33:37', '2016-10-15 15:47:27', '0', '0');

-- ----------------------------
-- Table structure for officialwebsite_news
-- ----------------------------
DROP TABLE IF EXISTS `officialwebsite_news`;
CREATE TABLE `officialwebsite_news` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `updateTime` datetime NOT NULL,
  `createTime` datetime NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of officialwebsite_news
-- ----------------------------
INSERT INTO `officialwebsite_news` VALUES ('231231', '第一新闻介绍', '<p align=\"center\">\r  <span style=\"color:#64451D;font-size:16px;\"><embed src=\"http://player.youku.com/player.php/sid/XMTYwMzc2MDU3Ng==/v.swf\" type=\"application/x-shockwave-flash\" width=\"550\" height=\"400\" autostart=\"true\" loop=\"true\" /><br />\r </span> \r </p>\r <p>\r  <span style=\"color:#99BB00;font-size:16px;\">短短一个月之内，中国在南海进行了两次大规模军事演习，这种频率貌似并不常见；此次军演起始之日，恰好在所谓“南海仲裁案”结果公布后一周，又正好在空军宣布巡航“常态化”之后第二天，此种安排究竟是作何考虑呢？\r     　　经常“擦枪”才能防止“走火”，适时的“亮剑”才能有效维护我国主权与领土安全及地区和平大局。对此，中国必须要做好长期准备。文︱瞭望智库特约研究员方晓志本文为瞭望智库特约文章，如需转载请在文前注明来源瞭望智库（zhczyj）及作者信息，否则将严格追究法律责任根据中国海事局公告，7月19日至21日，中国海军在海南岛东面海域进行诸兵种联合军事演习。此前（7月5日至11日），中国海军在西沙群岛周边举行了为期一周的军演。7月18日，中国空军新闻发言人宣布，中国空军在近期出动了轰-6K飞机赴黄岩岛等岛礁附近空域进行了巡航，并表示这种巡航将会保持“常态化”。短短一个月之内，中国在南海进行了两次大规模军事演习，这种频率貌似并不常见；此次军演起始之日，恰好在所谓“南海仲裁案”结果公布后一周，又正好在空军宣布巡航“常态化”之后第二天，此种安排究竟有何考虑？\r     　　空海互动：提高我军应对南海安全威胁的整体实力\r     　　在中国正在积极推行军队改革的大背景下，多军兵种联合作战的重要性更加突出，强调各军兵种的一体互动。此次军演的一个显著特点，就是更加注重海空军的配合——以阶段性海空军独立演练的方式，来推动军兵种配合的实战化训练的深入发展；通过海空军之间的战略与战术配合演练，提升我军应对南海地区各种安全威胁的整体实战能力。之前，解放军已派出战斗机赴黄岩岛附近海域进行战斗巡航，轰-6K、歼-11以及侦察机、空中加油机等机型均包含在内。其中，轰-6K格外引人注目。作为一款中国自行设计的中远程轰炸机，轰-6K最大起飞重量约95吨，正常载弹量为9吨，最大航程超过8000公里，作战半径超过3000公里，主要用于执行远距离精确打击和临空轰炸任务，装备主要武器为长剑-20攻陆巡航导弹，有效射程在1500-2500公里之间，战斗部重量约为500千克，打击能力与美军最新的战斧4巡航导弹相当。理论上，如出动一个轰炸机团18架轰-6K，一次就可以摧毁琉球群岛上39处重要军事设施的半数，将极大削弱冲绳基地运作能力，为后续的攻击机群打开空袭通道。但是，轰-6K也有弱点，那就是自卫能力较弱。因此，此次我军派出了一个强悍的空中战斗群为其保驾护航，包括歼击机、侦察机、空中加油机等，几乎囊括了我军全部主力机种，以空中侦察、对抗空战和岛礁巡航为主要目标组织行动，不仅能够执行远程精确打击任务，还具备随时歼灭空中来犯敌军的能力。如上所述，空军已经宣布，将这种巡航“常态化”。因此，这也将会成为此次军演的一个重要组成部分。未来，我们进行南海区域的远程常态化巡航时，轰-6k战斗群将不仅只针对黄岩岛，而且涵盖该南海地区所有中国主权范围内的岛礁，从而将中国空军的远程覆盖能力提升到一个新的高度。另外，今后空军在实施常态化南海巡航的过程中，将会使用与相关海空域距离较近的机场。除了正在部分南沙岛礁上修建的机场外，海南岛将是空军对南海实施常态化巡航的最佳基地——若从海南岛东南部机场起飞，中国空军的大部分机型作战半径都可以覆盖黄岩岛。因此，此次中国海军选择在海南岛附近海域举行演习，实际上也是在进行配合演练、实现空军战机的常态化巡航，是对海空军在南海地区进行海空立体配合态势的一种磨练。具体而言，通过空军实施长距离巡航监视，为海军行动提供远程预警，一旦南海地区发生不测，中国的海空力量将有更多机会和时间来完成维护国家权益的任务。\r     　　低调亮剑：对“南海闹剧”后系列挑衅行为作出回应\r     　　南海问题之所以复杂，在很大程度上，是由于域外大国的干涉造成的。今年以来，美国就打着维护“航行自由”的旗号，不断派出军舰进入南海区域进行挑衅。7月12日，由日本右翼分子柳井俊二担任庭长的仲裁庭对所谓“南海仲裁案”做出了既非法又无效的裁决。中国外交部严正声明，“南海仲裁案”一开始就是建立在菲律宾违法行为和非法诉求基础上，无论是在管辖权、公正性、程序性等方面都不具备合法性，因此没有任何效力，中国将绝对不接受、不承认仲裁庭管辖和裁决。然而，所谓“仲裁”结果刚刚公布，美国、日本、菲律宾等国家就企图联合起来在南海问题上兴风作浪。*菲律宾不仅通过舆论鼓吹菲渔民自此有权在黄岩岛海域捕鱼，而且还于13日派出一个电视台采访组，试图随菲律宾渔船“重返黄岩岛”，而这些举措也得到了美日等国家的支持。*7月13日，日本和菲律宾在马尼拉附近海域举行联合演习，包括1艘日本海上保安厅的“津轻”号巡逻舰，以及菲律宾海岸警卫队的海上和空中力量，美国和澳大利亚则以观察员身份参加。尽管两国声称演习是为应对海盗行为和武装抢劫，不针对中国和南海，但是，选在这种时机举行演习，不能不让人理解为是在给菲律宾撑腰打气，以及向国际社会表明两国对仲裁结果的态度。*7月15日，日本抓住亚欧首脑会议的时机炒作南海问题，加强对中国施压力度，期待中国遵守所谓“南海仲裁”结果。*7月17日，美国副总统拜登访问澳大利亚，对媒体表示期待中国“遵守国际规则”。针对上述种种“发难”，中国这种不承认、不接受的态度，不能只停留在口头上，而须采取必要措施——中国应当像一根弹簧，当外界施加的压力越大时，反弹也要更大。“法理战”和“舆论战”是必要的，通过摆事实、讲道理、加大说服力度，争取国际社会更多支持和理解；同时，中国更需要采取能切实捍卫主权不受侵犯的军事手段，加大在南海的维权力度，从而更有效地宣示自己在南海的主权主张。因此，中国选在19日开始举行军演，是对美国、日本及个别周边国家在南海地区的挑衅行为作出的反应；同时，显示出中国军队维护国家主权、领土安全的能力和决心，将对那些对中国心怀不轨的国家起到重要的威慑作用。同时，通过适当、适时地展示军事实力，以及坚持有条不紊地进行南海岛礁建设，中国正在向世界证明自己“说话算数”的能力。\r     　　做好长期斗争的准备：常“擦枪”才能防“走火”\r     　　很大程度上，南海问题在是中美之间的一种战略博弈，虽然两国经常因南海问题剑拔弩张，但军队交流与合作一直没有停止，并且保持着各种沟通渠道畅通。就在南海仲裁案结果公布后，两国仍然在进行“环太平洋-2016”海上演习。中国海军参演舰艇所在的175特混编队，已经陆续展开了警戒幕队形、营救落水人员、海上拦截、小艇登临检查和编队运动等课目的演练，并未受到仲裁案的影响。此外，就在此次南海军演前夕，中国邀请了美国海军最高将领、海军作战部长约翰·理查森上将，从7月17日起对中国进行了为期3天的访问，共同讨论南海争端、环太平洋军演以及两国海军未来的合作机会等议题。这表明，中美之间虽然存在着分歧和矛盾，但已经具有了非常成熟的海上危机管控机制。中国是在自己“家门口”进行军事活动，与某些国家不远万里派出航空母舰、轰炸机及战斗机到南海海耀武扬威的行为性质完全不同。实际上，中国此次军演保持了相当程度的克制。与上一次海军诸兵种联合军事演习相比，这次联合军演的演习范围和地点都有所缩小，不仅远离南海争议岛礁（甚至都未选择已实际控制的西沙群岛），而是在海南岛附近海域进行演习，此举既保持了演习范围和地点的连接性和延续性，在展示捍卫主权之意愿和实力的同时，也在充分表达了中国政府不希望给南海局势过分加压的克制态度。从未来发展来看，在“南海仲裁案”结果出台后的短期内，美国以此为借口在南海挑起事端的可能性会很大。除了利用军事优势加大挑衅力度以外，美国还可能挑动周边国家以及域外国家构筑围堵中国的包围圈，实现其深化“亚太再平衡”战略的目的。若任其发展，南海形势会越来越严峻与复杂。正如海军司令员吴胜利在与理查德森会晤时所说的那样：“我们绝不会牺牲南海主权权益，不要指望我们在领土主权上作出让步；我们绝不会畏惧任何军事挑衅，中国军队是维护国家主权、安全和发展利益的坚强力量，中国海军已做好充分准备应对任何侵权挑衅。”总而言之，经常“擦枪”才能防止“走火”，适时的“亮剑”才能有效维护我国主权与领土安全及地区和平大局。中国，必须要做好长期斗争的准备。（来源：瞭望智库）</span> \r </p>', '2016-07-21 18:13:33', '2016-08-19 18:13:35', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('256ca9e2-c5b5-40c7-8323-0db871282895', 'html标签测试', '<p>\r  &lt;html&gt;\r </p>\r <p>\r  &nbsp;&nbsp;&nbsp; &lt;body&gt;\r </p>\r <p>\r  请输入内容\r </p>\r <p>\r  &lt;br/&gt;\r </p>\r <p>\r  &lt;br/&gt;&lt;br/&gt;&lt;br/&gt;&lt;br/&gt;&lt;br/&gt;\r </p>\r <p>\r  &lt;/body&gt;\r </p>\r <p>\r  &lt;/html&gt;\r </p>', '2016-07-28 13:19:44', '2016-07-28 13:19:44', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('3a187059-e361-4e98-b5d1-224369f0e60f', '安倍的自民党为何鼓励学生举报反战老师', '<blockquote>\r  <p style=\"text-align:center;\" align=\"left\">\r   <span style=\"color:#E56600;\"></span><img src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owNewsBackAction!getNewsTextImgByImgName.action?imgName=459ccb02-c310-431f-b32b-b8a92b4d92d9.jpeg\" alt=\"\" /> \r  </p>\r  <p style=\"text-align:center;\" align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">自民党展开的学校教育政治中立性调查页面</span> \r  </p>\r  <p style=\"text-align:center;\" align=\"center\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\"><embed src=\"http://player.youku.com/player.php/sid/XMTQ2NDY0NDc2/v.swf\" type=\"application/x-shockwave-flash\" width=\"500\" height=\"400\" quality=\"high\" /></span> \r  </p>\r  <p style=\"text-align:center;\" align=\"center\">\r   <img src=\"/happyholiday_0.2/ow/back/owNewsBackAction!getNewsTextImgByImgName.action?imgName=4e63f776-4750-4622-b3ac-1301b223d149.png\" alt=\"\" height=\"293\" width=\"851\" /> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\"><span style=\"background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"background-color:#FFFFFF;\">6月25日，当日本各个政党为了参议员选举忙得不可开交时，日本首相安倍所在的自民党却悄悄展开了名为“学校教育政治中立性事态调查”，呼吁民\r                         众举报身边涉及违反”学校政治中立“原则的事件，并且采用了实名制。这一调查在日本引起巨大反响，网友质疑政府对”政治中立“的定义，更反感自民党采取的\r                         实名制举报方式，批评其为“告密论坛”，企图用政治监控教育，让人联想起战前的告密社会。</span></span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:&quot;color:#E56600;background-color:#FFFFFF;\">此前由于日本国内声势浩大的反安保活动，安倍政府遭到了史无前例的质疑，其中高中生和大学生充当了反安保主力军。而今年7月的参院选举，日本首\r                         次将选举年龄下调至18周岁，这意味着许多高中生的选择也将影响选举结果。高中生的主要活动场所就是学校，教师的言行会对学生产生极深影响。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;尽管争议巨大，调查活动仍然按计划进行，并在参议院选举结束后结束调查，自民党党员称调查结果会提交文科省（相当于教育部）。不难推测，自民党此次动作很可能是为了7月的选举，给高校老师们一个警告。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">自民党：请</span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">“</span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">举报</span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">”</span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">反对安保法的教职人员</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">据自民党官网上的说明，这次调查由党文部科学部会负责，为了贯彻学校教育必须坚持政治中立的原则。他们指出，虽然教育追求的是不偏不党，但是实际上，常有老师违背这一原则，在教育过程中发表不恰当的言论，比如说“不能把孩子送去战场”之类的话。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;自民党呼吁大家“举报”身边违背政治中立原则的老师，由于采取了实名制，举报者需要填写具体的时间，地点，人物和事件详情。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">“不能把孩子送去战场”，这不是理所当然的事情吗？日本网友开始讨论这类言论是否违背政治中立，由于舆论讨论太热，调查网页一度崩溃。页面恢复后，“不能把孩子送去战场“也被更换成”应该废除安保法案。”</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">负责调查活动的是自民党文部科学部会长木原稔，他在接受采访时表示，选举权年龄下调至18周岁，又临近参议院选举，我们只是想调查学校里有没有发生混乱。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">不过早在今年5月，自民党就提出要修改《教育公务员特例法》，呼吁给违反规则参与政治活动的教职员工制定惩罚条例，最早在今年秋天的临时国会提\r                         出修正案。虽然现行法律明文禁止国家公务员“为政治或政党的目的，从事政治行为”，但是由于缺乏惩罚规范，自民党干部指出，事实上相当于没有约束。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">修正案预计提出，对违反规定的教职员工处以“三年以下监禁，及100万日元以下罚款”。同时还希望把约束范围从义务教育制公立学校扩大所有高校，包括日本数量众多的私立高校。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">自民党党员称调查结果会提交文科省，由于自民党是日本执政党，在国会拥有多数席位，又加上安倍政权控制了日本政府，此次调查对教育政策的影响必然不小。</span> \r  </p>\r  <p align=\"left\">\r   <br />\r  </p>\r  <p align=\"center\">\r   <img src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owNewsBackAction!getNewsTextImgByImgName.action?imgName=16544378-56e8-4790-a8df-cb1738bfdfea.jpeg\" alt=\"\" /> \r  </p>\r  <p align=\"left\">\r   <br />\r  </p>\r  <p style=\"text-align:center;\" align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">标语：安倍政权不可原谅</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">以中立之名干涉自由：日本重返告密社会？</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;按照日本《教育基本法》的规定，“校方不能开展支持或反对特定政党的政治教育与政治活动”，这也是所谓“教育政治中立”的由来。但该法监督的只是义务制教育范围内的公立学校教职员工，大学教师因非公务员身份，不在监督范围以内。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">在日本参议院审核安保法案前爆发的反安保游行期间，不少教职员工因发表反安保言论而被警告批评的事件，比如2015年7月，福冈教育大学副教授\r                         林崎和彦，因在课堂上批评安倍政权和安保法案，学生在推特上爆料后，该教授受到大学的停课处分。9月，北海道曾有某高中老师把反安倍政权标语牌放在了办公\r                         桌上，事后北海道教育委员会开始对公立学生展开调查，以确保教育的政治中立性。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">自民党这次调查让不少日本民众感觉不太舒服，首先调查采取的是实名揭发制，等于让学生直接检举身边的老师，让同事揭发身边的同事。其次，自民党\r                         会把调查结果报告日本文科省，目的是促进在秋季国会时讨论修改法律，加强对高校职工的惩罚条例。在选举进行时开展此次调查，简直就是给全国老师的警告，结\r                         果只是让全国老师们“自省”，甚至是追责地方教育委员会，让原本应该自由讨论的课堂陷入萎缩。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">甲南大学名誉教授熊泽诚发表评论说，二战前的日本，也曾像纳粹一样实行“告密”和言论控制。安倍政权的极权主义倾向很明显，这次的举动非常危险。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">日本教职员工工会“日教组”，曾站出来批评教育委员会的调查行为，认为这是执政党控制下政府对教育的干预。但由于日教组有许多经历过二战的年长成员，并且与在野党的密切关系，日教组在日本常被批评为“偏左派系”。</span> \r  </p>\r  <p align=\"left\">\r   <br />\r  </p>\r  <div align=\"left\">\r   <p align=\"center\">\r    <img src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owNewsBackAction!getNewsTextImgByImgName.action?imgName=b5a6da24-e811-40c9-8e02-7736272dba79.jpeg\" alt=\"\" /> \r   </p>\r   <p>\r    <br />\r   </p>\r   <p style=\"text-align:center;\">\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">自民党官网上对调查的说明前后进行了修改</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">何为中立：教育不能成为洗脑工具</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;日本舆论对自民党的“揭发”调查活动表现出普遍不满，认为会让日本重返“告密社会”，但大家普遍认同，教育确实需要保持中立，向学生们宣传某一特定党派的思想的教师应该受到处罚，“洗脑教育”不可原谅。</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">只是何为中立，是需要社会共同讨论的，而非自民党自说自话。在日本下调选举年龄后，老师们肩负了更重的“政治启蒙”任务，政治中立不是指避免谈\r                         论政治，而是指老师们应该向学生提供多方面的思考。比如涉及安保法案时，老师们应同时提供支持者和反对者双方的看法，让学生们自由思考，自行选择。</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">日本《每日新闻》曾在今年5月下旬展开问卷调查，对自民党修改法律、惩罚违反“中立原则”的教职员工的计划进行询问。民调显示，接受采访的100人中，63人持反对态度，赞成的仅有5人</span><span style=\"font-family:Microsoft YaHei;\"></span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">。大家认为，惩罚制度会限制教育自由，而且政治中立的定义尚不明确。</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;在自民党官网最初的说明中，将“反对战争”也列为了违反中立的案例，但是不少评论认为，不想让孩子们上战场，不是理所当然的事情吗？难道我们应该期待战争吗？官网最终把这一句删除，但民众仍然认为</span><span style=\"font-family:Microsoft YaHei;\"></span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">这不能改变整个事件的性质。</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">讽刺的是，网友找出2014年10月2日自民党木原稔的讲话，他提出“只有在文科省的指导下，通过学校教育，才能让孩子们正确理解修改宪法的必\r                         要性。”如果“废除安保法案”违背了中立原则的话，“支持安倍经济学”、“支持修宪”的发言是否也应该被举报呢？教育不能成为自民党巩固政权的“洗脑工\r                         具”。</span> \r   </p>\r   <p>\r    <br />\r   </p>\r  </div>\r </blockquote>', '2020-10-01 22:41:49', '2028-07-27 22:41:49', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('4165456', '习近平就做好当前防汛抗洪抢险救灾工作提出6点要求', '第一，切实落实防汛抗洪责任制。第二，科学精准预测预报。第三，突出防御重点。第四，全力保障人员安全。第五，强化军民联防联动机制。第六，抓紧谋划灾后水利建设。\r\n\r\n　　原标题：习近平对加强安全生产和汛期安全防范工作作出重要指示强调\r\n\r\n　　新华社北京7月20日电近日，中共中央总书记、国家主席、中央军委主席习近平在中共中央政治局常委会会议上发表重要讲话，对加强安全生产和汛 期安全防范工作作出重要指示，强调安全生产是民生大事，一丝一毫不能放松，要以对人民极端负责的精神抓好安全生产工作，站在人民群众的角度想问题，把重大 风险隐患当成事故来对待，守土有责，敢于担当，完善体制，严格监管，让人民群众安心放心。\r\n\r\n　　习近平指出，各级党委和政府特别是领导干部要牢固树立安全生产的观念，正确处理安全和发展的关系，坚持发展决不能以牺牲安全为代价这条红线。经济社会发展 的每一个项目、每一个环节都要以安全为前提，不能有丝毫疏漏。要严格实行党政领导干部安全生产工作责任制，切实做到失职追责。要把遏制重特大事故作为安全 生产整体工作的“牛鼻子”来抓，在煤矿、危化品、道路运输等方面抓紧规划实施一批生命防护工程，积极研发应用一批先进安防技术，切实提高安全发展水平。\r\n\r\n　　习近平强调，要加快完善安全生产管理体制，强化安全监管部门综合监管责任，严格落实行业主管部门监管责任、地方党委和政府属地管理责任，加强 基层安全监管执法队伍建设，制定权力清单和责任清单，督促落实到位。要发挥各级安委会指导协调、监督检查、巡查考核的作用，形成上下合力，齐抓共管。要改 革安全生产应急救援体制，提高组织协调能力和现场救援实效。要完善各类开发区、工业园区、港区、风景区等功能区安全监管体制，严格落实安全管理措施。要完 善安全生产许可制度，严把安全准入关。要健全安全生产法律法规和标准体系，统筹做好涉及安全生产的法律法规和标准的制定修订工作。\r\n\r\n　　习近平强调，要加强城市运行管理，增强安全风险意识，加强源头治理。要加强城乡安全风险辨识，全面开展城市风险点、危险源的普查，防止认不清、想不到、管不到等问题的发生。\r\n\r\n　　习近平指出，目前正值主汛期，一些地区出现了严重洪涝灾害，这是对我们的重大考验。各级党委和政府要坚持守土有责、履职尽责，做好防汛抗洪抢险各项工作，切实保护人民群众生命财产安全。\r\n\r\n　　中共中央政治局常委、国务院总理李克强作出批示指出，今年以来，在各方面共同努力下，全国安全生产形势总体稳定，但重特大事故多发势头仍未得 到有效遏制，造成的重大人员伤亡和损失令人痛心，也暴露出安全生产相关领域的工作仍存在诸多不足与隐患。各地区、各部门尤其是各级领导干部要深刻汲取教 训，坚持生命安全至上、人民利益至上，坚持安全发展理念，坚持依法治安、源头防范、系统治理，切实加强安全风险识别管控和隐患排查治理，切实加大安全基础 保障能力建设力度，切实落实安全生产责任制、强化工作考核，依法严惩违法违规和失职渎职行为。加快制定完善相关法律法规和标准，进一步深化安全监管体制改 革和机制创新。当前，要特别重视做好极端天气和重大灾害预警预报、检查督查和应急处置工作，强化各项安全防范措施，坚决遏制重特大事故发生，切实把保障人 民群众生命安全的承诺落到实处。\r\n\r\n　　国务院20日召开全国安全生产电视电话会议。中共中央政治局委员、国务院副总理马凯出席会议并讲话。他指出，各地区、各部门要认真贯彻落实习 近平总书记重要指示精神，按照国务院要求，扎实做好汛期和下半年安全生产重点工作。要高度警惕汛期灾害性天气带来的威胁，突出矿山、尾矿库、危化品、建筑 施工、交通运输、旅游等重点行业领域和易受灾害影响的重点部位，对汛期安全防范工作进行再检查再落实，确保灾害监测预警及时、风险隐患治理管控到位、应急 处置和保障有力。要在总结巩固上半年工作成效的基础上，保持工作连续性、增强工作预见性和实效性，继续紧紧抓住遏制重特大事故这个重点不放松，积极推进安 全生产领域改革创新、依法治安、专项治理等重点工作，全力维护安全生产形势的总体稳定，为经济发展和社会和谐稳定创造良好的安全生产环境。\r\n\r\n　　国务委员郭声琨在会上传达了习近平重要指示和李克强批示。国务委员王勇主持会议。\r\n\r\n　　公安部、交通运输部、安全监管总局负责同志在会上作交流发言。\r\n\r\n　　国务院安委会各成员单位、在京中央企业负责同志参加会议。各省区市、计划单列市、新疆生产建设兵团和市、县设分会场。（完）', '2016-07-21 18:13:33', '2016-07-29 18:13:35', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('4165456asda', '刚刚，华为又向美韩开了 一枪！举国沸腾！', '<div style=\"text-align:justify;\">\r  <span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">振奋人心！华为刚刚又出手了，这一枪打向了韩国，同时也把枪头对准了美国！众所周知，目前的南海中美局势紧张，而华为首先做出抗美的全面反击！\r   起诉，三星再上法庭\r   你没有看错，华为又一次把三星告上法庭！一个月前，华为打响第一</span><span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">枪，在</span><span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">美国、中国同时向三星起诉，要求三星立即停止侵权行为，并向华为进行赔偿，这是历史首次！\r   就在所有人都在等待最终结果，三星也正在准备反诉华为的时候，又是一枪打响了。7月7日，华为再次出手，把三星第二次告上法庭，共计16款手机涉嫌侵权，包括三星最新旗舰GalaxyS7！\r   三星在中国的三大命脉全被起诉！华为表示，惠州三星、天津三星、三星投资公司未经许可，以生产经营为目的，大量制作、使用、销售、许诺销售被控侵权产品！\r   从来不打无准备之仗，三星连续两次被华为起诉，一旦败诉，三星不仅仅是巨额赔偿，或还有最恐怖的禁售！最新数据，三星已从国内排行榜中消失，过去一年三星在华员工骤减上万人，这个韩国人眼中的“天下第一”正被中国企业搞得痛不欲生！\r   刚刚，华为又向美韩开了 </span><wbr style=\"line-height:1.5;\"><span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">一枪！举国沸腾！\r   反击，向美国开枪\r   禁售！制裁！调查！这是美国对中国企业最常用的伎俩，禁华为、制中兴、查钢企，一次又一次的欺人太甚！美国永远没想到，今天正把苹果逼上绝路的是一家中国企业，他更没想到今天将美国第四大运营商告上法庭的，还是这家中国企业！\r   没错，华为这次双管齐下，一枪打向韩国三星，另一枪打向美国第四大运营商！7月8日，华为把美国第四大运营商T-Mobile告上法庭，T-Mobile不但拒绝与华为达成专利授权协议，还继续肆意使用14项华为的4G LTE通信专利！\r   众所周知，华为在美国拥有9800件专利，但你不一定知道其中7400件都是通信技术专利，这次华为向美国开枪，不是手机，而是致命的4G LTE通信专利！如果T-Mobile继续肆意妄为，流血的将是整个美国的通信网络！\r   任正非，被告变原告\r   刚刚，华为又向美韩开了 </span><wbr style=\"line-height:1.5;\"><span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">一枪！举国沸腾！\r   鬓发苍白，仍在沙场的任正非\r   3年被告54次！曾经这个天天被告的任正非，如今却在他72岁的时候成了中国第一位起诉并接连起诉世界级巨头的原告！当韩国人认为这是中国山寨企业在博眼球的时候，他又把三星告上了法庭。\r   当美国频繁欺负中国企业，刚制裁中兴，再对华为下手的时候，他仍坚定表示“五年内全面超越苹果”！并放出狠话：“不要在乎一城一池的得失，我们要的是全世界”！\r   而就在今天，在南海问题中美博弈的背景下，任正非又一次出现在了原告席上，他说：不是我喜欢打官司，而是我必须打官司。我必须保护中国自己的知识产权，保护华为自己的科研成果！只有科技强，才能中国强！\r   我们相信随着华为、海尔、苏宁等一批中国企业的不断崛起，中华民族的伟大复兴不会太遥远，中华人民将屹立在世界的</span><span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">东方！\r   卧薪尝胆，磨砺十年青锋！扬眉出鞘，为之中华而为！</span> \r </div>', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('4a65s4d56a4d65', '俄罗斯对中国在岛屿争议方面支持', '根据俄罗斯军工综合体7月19日报道，俄罗斯用苏霍伊的最新杰作---苏-35战机支持中国。根据《军事平衡》报道，中国空军即将有两型新型战机服役——俄罗斯的苏-35和中国自主研发的歼-20战机。\r\n　　海牙仲裁法庭否定中国对中国南海争议岛屿的拥有权，7月14日中国互联网有报道称，俄罗斯将对华交付第一架苏-35战机，借此对南海仲裁案的结果进行强力回应。根据中国媒体报道，当中国苏-35出现在争议岛屿时，局面将“非常有趣”。\r\n　　苏-35是“苏霍伊的最新杰作”。这是一种多用途的战斗机，可以执行包括空中打击、拦截敌机和攻击海上和地面目标的多种任务。该型战机拥有第五代战机技术，配备的雷达可以在“罕见的大范围内探测空中目标”。\r\n　　然而中国新一代战机歼-20的战斗状态给予了更有利的回应。该飞机能够对抗美国部署在亚太地区的F-22战机。歼-20的战斗力已经远超过日本的F-15D/J、F-2战机和越南的苏-30MKV战机，这些战机击败歼-20的机会几乎为零。\r\n　　消息人士同时认为，苏-35战机在中国空军的服役也间接展示了俄罗斯对于中国在岛屿争议方面的支持。', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('55471683-a876-46ee-b8ec-8719e223d4c2', '习近平：努力建设巩固国防和强大军队', '<p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平在中共中央政治局第三十四次集体学习时强调</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>多多学习java代码，比如</em></strong></span>\r </p>\r <p>\r  <br />\r </p>\r <pre class=\"prettyprint lang-js\"> \r \r <pre class=\"prettyprint lang-js\">afterBlur : function(){ //编辑器聚焦后，将编辑器的内容设置到原来的textarea控件里\r     this.sync();\r    } </pre>\r <br />\r </pre>\r <p>\r  <br />\r </p>\r <p>\r  <br />\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em></em></strong></span>\r </p>\r <p>\r  <br />\r </p>\r <p>\r  <br />\r </p>\r <p>\r  <img src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owNewsBackAction!getNewsTextImgByImgName.action?imgName=9c72b2a1-2101-49dc-994d-78cc8d7aecda.octet-stream\" alt=\"\" height=\"201\" width=\"562\" /> \r </p>\r <p>\r  <img src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owNewsBackAction!getNewsTextImgByImgName.action?imgName=74ad7062-235d-4a56-9233-95951c30d569.octet-stream\" alt=\"\" height=\"201\" width=\"561\" /> \r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>坚持党在新形势下的强军目标 努力建设巩固国防和强大军队</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>新华社北京7月27日电 \r     中共中央政治局7月26日下午就深化国防和军队改革进行第三十四次集体学习。中共中央总书记习近平在主持学习时强调，深化国防和军队改革是一场整体性、革\r     命性变革，要坚持以党在新形势下的强军目标为引领，贯彻新形势下军事战略方针，全面实施改革强军战略，着力解决制约国防和军队建设的体制性障碍、结构性矛\r     盾、政策性问题，推进军队组织形态现代化，进一步解放和发展战斗力，进一步解放和增强军队活力，建设同我国国际地位相称、同国家安全和发展利益相适应的巩\r     固国防和强大军队，为实现“两个一百年”奋斗目标、实现中华民族伟大复兴的中国梦提供坚强力量保证。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>中央军委深化国防和军队改革领导小组专家咨询组副组长蔡红硕同志就这个问题进行讲解，并谈了意见和建议。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>中共中央政治局各位同志认真听取了他的讲解，并就有关问题进行了讨论。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平在主持学习时发表了讲话。他指出，长期以来，在党的领导下，我军从小到大、从弱到强、从胜利走向胜利，改革创新步伐从来没有停止过。现\r     在，国防和军队建设处在新的历史起点上，纵观全局，审时度势，应对国际形势深刻复杂变化，坚持和发展中国特色社会主义，实现“两个一百年”奋斗目标，贯彻\r     落实党在新形势下的强军目标和新形势下军事战略方针，履行好军队使命任务，都要求我们以更大的智慧和勇气深化国防和军队改革。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平强调，党的十八大以来，党中央对深化国防和军队改革高度重视，坚持把这项重大改革摆在党和国家工作全局的突出位置，放在实现全面建成小康\r     社会奋斗目标、实现中华民族伟大复兴中国梦的战略高度来谋划和推进。党的十八届三中全会后，在党中央领导下，中央军委成立深化国防和军队改革领导小组和相\r     关工作机构，经过深入调研论证，集中全军智慧，形成了深化国防和军队改革总体方案及相关实施方案。我们相继成立陆军领导机构、火箭军、战略支援部队，把军\r     委机关由4个总部改为1厅、6部、3个委员会、5个直属机构共15个职能部门，把7大军区调整划设为东部、南部、西部、北部、中部5大战区，完成海军、空\r     军、火箭军、武警部队机关整编工作。通过这些大力度的改革，人民解放军突破了长期实行的总部体制、大军区体制、大陆军体制，建立了军委管总、战区主战、军\r     种主建的新格局，解决了一些多年来想解决但一直没有很好解决的问题，解决了许多过去认为不可能解决的问题，实现了军队组织架构的一次历史性变革。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平指出，根据改革总体方案确定的时间表，2020年前要在领导管理体制、联合作战指挥体制改革上取得突破性进展，在优化规模结构、完善政策\r     制度、推动军民融合发展等方面改革上取得重要成果，努力构建能够打赢信息化战争、有效履行使命任务的中国特色现代军事力量体系，完善中国特色社会主义军事\r     制度。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平强调，深化国防和军队改革势头很好，但后续任务依然艰巨繁重。我们要再接再厉，乘势而上，迎难而上，扎扎实实把深化国防和军队改革推向前\r     进。要进一步坚定改革信心，在国防和军队改革向纵深推进的关键当口，我们要有定力、有担当、有韧劲，继续蹄疾步稳向前走。要进一步把准改革方向，坚持正确\r     政治方向，坚持向打仗聚焦，坚持创新驱动，坚持体系设计，坚持法治思维，坚持积极稳妥。要进一步抓好改革落实，加强组织领导，抓铁有痕、踏石留印，确保各\r     项改革举措落实、落细、落稳。军队各级党委要把抓改革任务落实作为重大政治责任，着力提高精准理解、精准发力、精准落地能力，高标准完成好担负的改革任\r     务。要深化思想发动，引导广大官兵读懂改革、吃透改革，在解放思想中统一思想，为推进改革打下坚实思想认识基础。军队各级领导干部特别是高级干部要带头做\r     改革的促进派、实干家，自觉在大局下定位、思考、行动，把对党忠诚、听党指挥、向党看齐体现到落实改革任务上。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平强调，深化国防和军队改革是全党全国共同的事业，中央和国家机关、地方各级党委和政府以及有关方面要强化国防意识，一如既往关心支持国防\r     和军队建设，积极配合完成跨军地的改革任务，自觉把经济布局调整同国防布局完善有机结合起来。深化国防和军队改革期间，军队转业安置干部比较多，中央和国\r     家机关有关部门、各地方要全面落实党中央决策部署，把军转干部安置好、使用好，确保军转安置工作圆满完成。</em></strong></span>\r </p>', '2016-07-27 22:27:34', '2016-07-27 22:27:34', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('asd45a6d15a44sd56', '美国竟然迫切需要一场针对中国战争', '除台湾以外，中国地缘政治还有另外四个命门所在，得之则生，失之则死。他们分别是东北方向的朝鲜，西部方向的阿富汗，东南方向的越南，西南方向的缅甸。\r\n\r\n　　众所周知，美国借9.11事件攻克阿富汗，抢先得手中亚核心地带。现虽已大部撤军，但仍有两万部队长驻该国。对中国西部形成长期觊觑之势，扼住我西进要冲。他们一直在静候着中国东部或南部可能响起的枪声，准备随时策应。\r\n\r\n　　西南缅甸，本为我传统友好邻邦，但因中国改开以后，忙于赚钱发财，放弃经略这个唯一的印度洋通道，导致美日乘虚而入，特别是美帝对该国进行了长期的渗透和策反。拉拢军政府，培植所谓民主力量。功夫不负有心人，近年缅甸军政府几乎与中国全面翻脸，对其境内我华帮武装大打出手，悉数剿灭;前不久，昂山傀儡政权也得以成功上台执政。美国得手缅甸，中国就近前出印度洋之梦告破。不得不舍近求远，巨资打造巴基斯坦瓜达尔港。\r\n\r\n　　越南亦为我传统友邦，但因上世纪80年代为配合并服务美国全球对苏战略，换取西方世界对我开放(解除封锁)，我对越发动10年所谓“自卫战争“，从此友邦变恶邻。10年中越战争，我数以万计的军人生命只换来两个山头(老山，法卡山)，却在随后20年间丢失南海29个岛礁和数以亿桶计的石油资源。相反，近年来，美国却成功将越南化敌为友;越南成为美国新世纪反华先锋指日可待。一但越南投入美帝怀抱，将极有可能配合美帝封锁我南海黄金水道。扼杀我能源生命线。\r\n\r\n　　朝鲜本与我有浴血之盟，刎颈之交。也是我前出日本海的唯一通道。朝鲜战争后，我军本应长驻38线，一者拒强敌美帝于最前沿，二者可将金氏政权长期控于股掌之间。但因其时我为道义所困，忘记“兵者诡道”之古训。致使撤军以后，失去前沿阵地，而美帝则得以长期盘踞并经略半岛。不料金氏世袭政权随后也妄自尊大，渐行渐远，逐步失控。\r\n\r\n　　“改开”之后，我与南韩建交，但未对朝鲜作有效抚慰和引导。被朝鲜视为嫌贫爱富，形同背叛，几近翻脸。为求自保，朝鲜发奋图强，研发核弹。\r\n\r\n　　朝鲜拥核，兹事体大，关乎我华夏核心安全。初期，我本可站在朝鲜立场，同情其安全自保之诉求，以为其提供全面军事安全和核保护为条件，通过外交努力诱其弃核。可我们没有这样作，而是一开始就迎合美日立场，大肆谴责其拥核如何有害，如何不可接受，如何大逆不道，蛮横将其置于敌对一方。至此，朝鲜已对我完全绝望，一方面更加坚定开发核武，一方面寻求与美日和解，时时与美日暗通款曲。\r\n\r\n　　之后，美国本想对朝鲜核武进行外科手术式摘除，或对金氏政权作定点清除。这对我来说本应是求之不得的最佳解决方式，我们完全可以默认美帝亲缮牛刀，武力除之而后快。事成之后，我可立即主持缮后，控制局面。只要朝鲜不被美日军事占领或出现一面倒亲美政权，就算大功告成，何乐而不为?可事实上，天赐良机，我未及时把握;反而屡次硬充好汉，喝斥美帝，誓言“不许美帝在我家门口动武”。结果，两面不讨好，横竖是恶人。朝鲜骂我背信弃义，美帝责我助纣为虐。\r\n\r\n　　最终，还是美帝老辣,看出金氏政权反华底细，于是乎，一面对朝喊打，一面私下给糖，威逼利诱，暗中策反朝鲜。那么或许有人要问，现在美帝为防朝鲜核弹，已将萨德布署到朝鲜家门口，且已将金正恩列入制裁名单，还有可能策反朝鲜吗?\r\n\r\n　　这个问题，要从韩国身上找答案。韩国明知萨德并非针对自已的兄弟朝鲜，明知要得罪中俄，为何如此坚定果敢配合美国布署萨德呢?很显然，答案只有一个，韩国得到了美国和朝鲜的双重保证。也就是说美国、朝鲜、韩国早就成了一家人，他们布署萨德是为了共同对付中俄——当然主要是中国。可以肯定，萨德布署完成之时，就是美国与朝鲜建交之时。中国彻底失去朝鲜，意味着美帝对中国包围工程的最后完工。\r\n\r\n　　最后，我们谈一下台湾。美国防长卡特之所以敢在海军学院直截了当地向中国摊牌亮剑，太平洋司令哈里斯之所以敢对我叫嚣“今夜就开战”。这说明美帝如今的狂妄是有底气的。底气从何而来?很大程度来自于台湾。此话怎讲?\r\n\r\n　　如果说上述四个小国构成中国地缘政治的四个命门的话。那么台湾则是中国地缘政治命门中的罩门，是美帝合围中国包围圈上的一把大锁。\r\n\r\n　　30年来，我们对台只谈经济利益，不讲民族大义，只讲商贸往来，不作政治军事渗透。空喊寄希望于台湾人民，不认真培植政权和军事代理人。结果枉费国民党当政8年时机。导致台独思潮泛滥，政权一夜易手，再次落入台独魔爪。而美日则对台独代理人进行了长期耐心的哺育和培植，对台湾军政各部进行长期深入渗透。并愿意为台独分子随时撑腰打气，提供个人安全保证。而我对马英久之类的统派关键人物，却从未提供任何哪怕一句口头上的支持，更谈不上为他们提供个人或家庭的安全保障。\r\n\r\n　　现在看来，蔡英文为首的民进党强势归来，表明台独在美帝的悉心培育之下，终于瓜熟蒂落。美国对中国摊牌的时候也该到了。如今，他们正高歌猛进，大胆出牌。这不，一周之内，美帝与台独之间唱和有情，先有雄3导弹误射，后有太平岛撤舰，接着放风美帝接管太平岛。正如李敖所讲，美帝只要掌控了台湾，就等于抓住了中国的睾丸。同理，美帝一但占据太平岛，就意味着抓住了整个南中国海的睾丸。\r\n\r\n　　如此看来，中国地缘政治的五大命门已全部或接近全部落入美日掌控之中。难道我们只能坐以待毙吗?有没有破解之法?\r\n\r\n　　二、美国迫切需要一场针对中国的战争\r\n\r\n　　首先，我们要明白美帝处心积虑构筑对我包围圈，其动机意欲何为。总的说来，美国需要在东亚制造一场战争，而且是尽快制造一场战争，且这场战争必须是针对中国的战争。因为在美国看来，只有一场相当规模的战争才能立即终止世界工业中心向中国的转移。——因为历史已证明，世界工业中心意味着世界权力中心。\r\n\r\n　　这场战争的开局应在第三国(最好是日本)和中国之间发起。然后由美国积极参与，最后由美国主持分享成果。由第三国首先发起同中国的战争，最能符合美国对中国战争的构想。因为这样的战争，能给美国极大的操作空间。无论第双方输赢，只要中国陷入战争，投入或即将投入中国的全球资本就会一哄而散。而美国一方面可以名正言顺控制中国的周边的能源和粮食通道，逼迫中国就范。另一方面还可以气定神闲地组织指挥众多喽罗一哄而上，对中国实施群殴。而美国的军事力量可以始终以预备队的姿态，随时灵活自如地介入战争，保证能在战争中后期中国体力不支时给中国以致命一击，或者在双方持久胶着时出面要挟双方订立城下之盟，勒索双方利益。\r\n\r\n　　所以，让美国现在就直接面对面单挑中国，笑话——嚷嚷而已。\r\n\r\n　　三、国家和民族的竞争最终是要通过战争考试来分出优劣\r\n\r\n　　虽然我们不可能知道美国对中国战争的技术性构想，但上述的总体战略套路应该是不会有错的。明白这一点，我们再来看看有哪些破解之道。\r\n\r\n　　第一、美国既然要在东亚制造一场针对中国的战争，那么我们能不能在东亚以外的地区制造一场或几场针对美国的战争?沿着这个思路有三个落脚点。一是积极支持俄罗斯在乌克兰和叙利亚对美国的战争。即使不是直接针对美国而是针对美国代理人的战争也行。另一个落脚点是支持塔利班彻底赶走阿富汗的美军，重新执政。第三个落脚点是在广大的伊斯兰世界扶持壮大反美武装，开辟反美新战场。这是一个内线固守，在外线寻求突破的思路。\r\n\r\n　　第二、美国是要尽快地制造一场针对中国的战争。我们策略应该是尽量延后这场战争。但延后战争的前提必须是以最快的速度准备战争，战争准备得越快，战争才越有可能延后。紧急的战争准备有如下几点：\r\n\r\n　　1、 逐次加大战争动员力度，停止对内“和平崛起”的宣传，改为加强军事斗争准备，要准备打仗。\r\n\r\n　　2、加快粮食、能源、武器弹药储备，尤其是精确打击武器弹药。\r\n\r\n　　3、将核弹数量激增至1000枚以上，确保对敌互相摧毁。\r\n\r\n　　4、尽快与俄罗斯潜艇联合巡航美国西部海岸。\r\n\r\n　　5、 加快网络通讯自主系统的建设，加强网络防护。加快网络潜伏攻击病毒和程序的渗透。\r\n\r\n　　6、 加快对台军事情报人员，敌后特战人员，敌后临战组织指挥人员的培养和渗透。确保克里米亚回归模式的实现。\r\n\r\n　　7、加快对美军或敌对国军事基地或政战中心的情报和特战人员的渗透。\r\n\r\n　　8、 中学大学体育改革为军体，立即实施全面军事体育合一的教育政策，彻底解决后备兵源问题。\r\n\r\n　　第三、美国想要制造的是一场具有相当规模的战争。太小的战争不足以损耗中国的政治经济和军事实力。如果战争无法避免，那么我们就要想办法控制战争的规模。如何控制战争规模，有如下几点值得强调：\r\n\r\n　　1、 刚才所说尽量延后战争，不是说完全不能选择战争。相反，抓住时机，主动选择战争对象，打一场可控而有把握的战争是完全可能的。\r\n\r\n　　2、 认真主动选择战争对象。首先应避免选择日本这类有具大战争潜力或拥有核武的国家下手。在可控的时间和范围内，对菲越这样的国家进行短时间高强度的战争是完全可行的。打垮次要敌人，不仅可以震慑其他次要敌人，还可有效打乱主要敌人的战争计划，动摇其战争信心。\r\n\r\n　　3、 确立“杀鸡必须用牛刀”的现代战争观念。开战即用核武，一击必杀。在主要敌人还没有来得及反应之前，确保次要敌人已被击垮或已投降。常规战争久拖不决，就会落入主要敌人的车轮消耗的圈套。\r\n\r\n　　4、 严格控制战争时间，对时间控制无把握，不开战。特别是对台湾作战。主要战事必须3天结束。一周内全面占领到位。\r\n\r\n　　第四、最后，也是最重要的一点，那就是为政者须要从单纯的经济和科技兴国转变到政治和军事兴国上来。习惯用战争的观念来理解人性、认识世界。国家和民族的竞争最终是要通过战争考试来分出优劣的。', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('asd468a4d98a4ds89', ' 美国坐不住:乌克兰送给中国一份大礼', '2015年12月12日，美国就开始注意到东风41的发射，2016年4月12日中国又进行了一次测试。预计东风41导弹将在2020年左右服役。美国一直担心中国和乌克兰在此领域进行合作，因为东风41导弹与前苏联的“撒旦”导弹非常相似。\r\n　　而现在的乌克兰手中最值钱的洲际导弹技术，就是撒旦洲际导弹技术，这是全世界射程最远的洲际导弹，可以达到惊人的16000公里射程。撒旦导弹是世界上唯一的有10个弹头的核导弹，也是世界上体重最大的导弹。拥有多种独立锁定目标再进入载具，目前的反导系统对它无能为力。它有16个子平台，其中一个含有假目标系统。当进入高轨道时，所有弹头都隐藏到假目标中，因此雷达无法发现它的行踪。这种导弹的弹头还使用了高密度的重金属即使是激光武器也无法将其摧毁。\r\n　　据美国防务专家估计其精度也达到震撼的350米。这种导弹的核弹爆炸威力为550万吨，任何城市只要一枚就可以完全毁灭，800公里直径寸草不生。如果用150枚撒旦导弹对美国发动第一次打击，足以摧毁美国65%的陆基洲际导弹发射井，这对美国的陆基洲际弹道导弹构成了极大的威胁。此外，撒旦导弹可携带一枚两千万吨当量的氢弹或12枚以上的75万吨当量的氢弹，其最大威力约等于广岛原子弹的1600倍，也就是说两枚就能让城市圈密集的日本彻底亡国。美国一直担心这种导弹技术流入中国。\r\n　　到了2020年，正好中国全球卫星系统“北斗”也基本完成，全球卫星导航系统可以让中国核武器实现对敌方目标的精确打击。那么将可以使中国二炮部队洲际导弹得到质的飞跃。东风41导弹在理论上可以穿越一望无际的太平洋，对洛杉矶和旧金山进行打击，这可能是中国对美国发动报复性和先发制人性核打击的唯一现实途径。\r\n　　美国空军研究所研究员认为，中国核武库首要的战略目标是以美国的利益为要挟，反制美国领导人利用先进的常规或核力量来威胁中国，中国主要担心的问题就是解放军不具备可靠的核力量来发动报复性反击”。在许多方面，中国“一个世纪的屈辱”决定了其内政外交政策的制定。中国在18世纪和19世纪有遭西方侵略的历史教训，这继续左右着中国官员有关世界大国如何对待中国的观点。中国的领导者和军人希望翻过历史的这一页，下定决心绝不能让历史重演。中国的核武器计划体现了这种观念。', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('asd4a6d46a4d', ' 美核潜艇最近跑到中国黄海周边想干啥？', '近日，北海舰队组织某型核潜艇进行演习。而在7月13日，美国海军“俄亥俄”号巡航导弹核潜艇到达韩国釜山进行访问。这两件事如果单独来看，似乎都很正常，但是放在一起来看，就会发现意味深长。核潜艇由于具备水下隐蔽性好、航速快、机动性好、续航力大等特点，因此被各国海军视为极具威胁的海战装备。\r\n　　特别是搭载着潜射洲际弹道导弹的战略核潜艇，被世界公认为最佳的核威慑力量。有些军事专家甚至评论说：“核潜艇是第二次世界大战之后海军军事技术上空前的大变革。”因此，世界上一些大国、强国都非常重视发展核潜艇。中国也不例外，很早就意识到核潜艇的战略作用，很清楚只有自己拥有核潜艇，才能以威慑对付威胁。所以，中国花了很大力气，克服了重重困难，最终研制成功了核潜艇。如今，中国的核潜艇已经发展了两代，技战术性能有了很大进步。\r\n　　北海舰队是中国海军三大舰队中最早装备核潜艇的舰队，而且在相当长时间内也是唯一装备核潜艇的舰队。虽然随着形势的变化，核潜艇的部署重心现在移到了其他舰队，但是北海舰队仍旧保持着一支核潜艇力量，因为北海舰队有保护京、津等要害地区的责任，所以作战能力强大的核潜艇不能缺少。特别是在美中国所面临的战略压力剧增，所以北海舰队核潜艇的训练和演习越来越强化。\r\n　　从美军亚太军力部署来看，不只是南方水域加强军力存在，在东北亚地区的军力也在持续增加，此次“俄亥俄”号巡航导弹核潜艇到韩国釜山就是加强美军在东北亚军力的举措之一。实际上，美军核潜艇在东北亚地区的活动一直没有消停过。自2013年12月起，“俄亥俄”号巡航导弹核潜艇的姊妹艇“密歇根”号就已经被部署到亚太，并在东海、南海以及菲律宾进行水下监视、训练以及其他秘密任务。美国海军军官本杰明·皮尔森甚至猖狂地说：“这些区域就像我们的后院。”“俄亥俄”号、“密歇根”号原先都属于美国海军的俄亥俄级战略核潜艇，后来被改装为巡航导弹核潜艇，每艘都搭载有154枚“战斧”巡航导弹，并且还能搭载2艘水下运输器和64名特战人员。\r\n　　虽然俄亥俄级巡航导弹核潜艇体积和排水量庞大，不适合在海域狭窄且水深很浅的黄海活动，但是其搭载的“战斧”导弹的射程在1500公里以上，因此在第一岛链外就能对我沿海和浅近纵深目标实施打击。根据美国海军公开的信息，俄亥俄级巡航导弹核潜艇能在6分钟之内将其装备的154枚“战斧”巡航导弹全部发射完毕。\r\n　　因此，俄亥俄级巡航导弹核潜艇在战时对我北部要害地区的威胁极大。此外，俄亥俄级巡航导弹核潜艇搭载的水下运输器和特战人员可以进入黄海，执行秘密的渗透侦察和破坏任务。除了俄亥俄级巡航导弹核潜艇，美国海军的洛杉矶级攻击核潜艇也不断到访日本和韩国，并在相关海域进行训练和演习活动。由此可见，美国海军针对中国北部海域的水下围堵兵力是比较强的。而我军北海舰队核潜艇不断强化作战能力，就是为了打破这种围堵。', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('asda5d1a51dsa', 'VR技术', 'VR技术可以让人仿佛置身比赛现场。 本专题撰文 广州日报记者黄维 欧洲杯决赛即将打响，在现场观赛固然激动，但有一部分球迷无需去到现场，利用VR技术，也可以获得类似的观感。据悉，欧足联确认，他们将在决赛中采取VR技术摄录技术，这无疑让人激动，实际上，他们并不是先行者，在全球化和商业化程度最好的NBA联盟中，VR的大门早已经打开。 VR亮相欧洲杯开幕式 售价起码五六万美元 就在本届欧洲杯的开幕式上，法国国宝级音乐人、有“世界第一DJ”之称的大卫·库塔和瑞典的19岁歌星萨拉·拉尔森一起演唱赛会的主题曲《为你而战》，相信不少观众会留意到，在他们的旁边有一个不起眼的黑色圆球——那就是VR摄录装置。 这个黑色圆球就是诺基亚打造的一款名为“OZO”的设备，OZO摄像机重约2.72公斤，球体四周分布着8个摄像头，可实现360度×180度的全景拍摄，分辨率2K×2K，所有摄像头可由用户通过统一的快门操控。在每个摄像头附近分别设有嵌入式麦克风，从而可以实现全方位音频录制。这一设备造价不菲，虽然没有公布售价，但据科技行业人士估计，一个起码得卖五六万美元，要完成一场VR直播，一个足球场地里起码要配备几十个OZO摄像机。 视频采集完成后，这一系列拍摄到的影像将在网上发布，用户借助虚拟现实头盔或眼镜，就可以享受身临其境的观感。不过欧足联在比赛中对这项技术的运用显得很谨慎，只有即将到来的决赛才使用这一技术进行摄录。 毫无疑问，今年是欧洲杯采用VR技术的元年，此后这一技术将得到更广泛的应用。 NBA球迷大赞感受真实 “我想靠在球场通道的墙上” 尽管足球在全球范围内的影响力远超篮球，但作为全球商业化和科技化开发最佳的联盟，NBA在很多方面已经走在了前面，VR技术同样如此。 截至目前，NBA已经为VR直播进行了长于18个月的实验，并且多次举行美国境内的直播试看活动。由于种种原因，联盟并没有大张旗鼓地对试播进行宣传，但体验者们在社交媒体和博客上的体验报告无疑让人更加向往。 和《财富》与《商业周刊》齐名的著名商业杂志《快公司》的一名雇员丹尼尔·特尔迪曼曾经体验这一技术，他说：“我用VR技术观看的那场比赛共有5个摄像头，其中一个的机位正好设在场边的摄影师的身边，当我戴上VR设备，把头往右转，就能近距离看到那个摄影师。”迪尔特曼这样评价那种真实的感觉，“我刚进入直播时，选的是场边通道的角度，而通道两边是水泥墙，我当时第一反应就是想靠在墙上。” 现在一直深耕于NBA之VR直播的是一家名为NextVR的公司，勇士的老板皮特·库伯是这家公司的投资人之一以及顾问团的成员，由于他的关系，刚刚过去的这个赛季勇士VS鹈鹕的揭幕战就进行了VR直播。尽管NBA官方没有透露试看这次VR直播的具体人数，NBA官方的初衷并不是把这一技术广泛宣扬出去，而是要寻找此项技术的种种缺陷，并加以完善。但不管如何，NBA已经走在了各个体育项目的前面。 球队也是VR受益者 战术研究在虚拟空间实现 大家为什么会爱VR？这个问题从浅层考虑，只关乎“钱”。科比在今年退役的比赛，门票的平均价格是2.65万美元一张，而NextVR为这场比赛开通了360度的全景直播，在家里用VR技术观看这场比赛的球迷纷纷表示，“我好像真的坐在湖人的替补席上，可以清楚地看到他的每一个动作，身临其境。如果真的想享受到这样一种待遇，估计到现场得花2万~10万美元。” NBA副总裁杰夫·马尔西利奥的观点是：“你通过场边VR感知到的第一件事是，球员的体型、运动能力和穿越这个赛场的速度是其他任何媒介都无法体现的。VR比任何技术平台更加强大，让你切身感受到自己是现场的一分子，它能够拉近球迷和在球场上庆祝的球员之间的距离。” 虚拟现实技术可以让球员在休赛期也能“聚”在一起进行战术分析和研究。现在华盛顿奇才的球员发展教练和相关训练人员，持续地向一个名为STRIVER的实验室录入战术，希望有朝一日能将球队战术手册的内容都以VR的方式变成数据。球员即便不在一个地方，戴上VR设备，就能和队友在一个虚拟的空间进行交流，同时模拟出比赛中任何可能发生的战术细节，让大家进行研究。这样，球员无需站在训练场上，只需要动动脑子即可，这比看战术录像更加生动。当然，训练场上的汗水依然需要挥洒，但新技术能让学习变得更便利。 从观众席到训练场，VR的可能性更多。 高科技不会影响票价 VR还无法代替现场观赛 话说回来，VR技术目前还并不成熟。接受试看体验的观众表示，比赛的气氛非常好，但好像他们没戴眼镜，画面看起来不够清晰。而有一点也难以达到，那就是在现场的互动，如果你真的在赛场坐着，喊出的加油声和嘘声可以对球员造成影响；而当你戴着VR眼镜坐在家里，你喊得大声一点，恐怕邻居就会报警。 小牛的老板、“科技大鳄”马克·库班对于新鲜事物从来不吝尝试，但他表示，这一技术不可能影响票价：“该来球馆的人，还是会来球馆看球，看VR直播代替不了你真正坐在球馆前排的体验。” 而在漫长的比赛时间中，一直戴着一个头盔一样的东西，也会让人感到不适。好在，这一切才刚刚开始。勇士老板皮特·库伯说得好，“这不是一切的终点，也算不上新生，而是萌芽之前刚开始的那么一点‘破土’。它不是积蓄的水洼，而是奔涌的海啸。这是平民和大师接触中的变革，它最终将席卷每个地方。” 扫一扫，分享到微信朋友圈 分享阅读品味，首次分享送2元红包 ', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('asdada', '深度：东风41可在太空多次变轨 美需用30枚导弹拦截', '中国的“东风-41”洲际弹道导弹是中国目前即将服役的最新的战略打击武器，主要担负着战略核反击任务。不过中国“东风-41”洲际弹道导弹是否真正能够承担起国之重器的战略打击重任呢？最近俄罗斯《生意人》《国际文传电讯社》对俄罗斯空天军副司令兼防空反导部队司令专访时承认，俄方对中国的“东风-41”弹道导弹技术高度认可，甚至其技术水平超乎的俄方的意料。\r\n中国东风41导弹水平究竟有多高？俄将领证实美国反导绝对拦不住\r\n\r\n　　根据俄防空反导部队司令维克多·古缅内伊中将在接受专访时称：中国在4月进行了一次“东风-41”洲际弹道导弹的实验。刚一升空俄罗斯空天军位于伊尔库斯克“沃罗涅日-M”雷达就捕捉到图像并进行了全程监控。监测的结果显示中国的“东风-41”导弹在进入太空后进行了数次大幅度变轨，甚至改变了弹头的飞行方向，原本射向东北方向的导弹，突然变成飞向南部方向，随后释放出两个具有独立飞行弹道的模拟分导弹头，这项技术让俄方感到颇为震惊。因为俄罗斯目前现役的“亚尔斯”弹道导弹也没有达到在太空中数次改变发射轨迹的能力，这是穿透美国反导系统的极佳手段。因为美国反导系统的雷达是需要连续跟踪，提前发射拦截弹进行拦截，如果飞行方向改变，反导系统就彻底失去效用了。\r\n中国东风41导弹水平究竟有多高？俄将领证实美国反导绝对拦不住\r\n\r\n　　部署在俄罗斯伊尔库茨克西北部米舍列夫卡镇的77Я6“沃罗涅日-М”雷达是专为监视太空和导弹来自的预警系统的组成部分，探测距离达6000公里，监控区域从美国西海岸一直到印度，扫描扇面可达240°，中国正好在这个覆盖区域的重点监控范围内。这部雷达的性能相当出众，被俄方赞许为太空中“一个足球大小的目标”都逃不过其追踪。这次“东风-41”试射从发射到变轨段完全都在其监控范围，由此可见其监测结果具备较权威的参考意义。\r\n中国东风41导弹水平究竟有多高？俄将领证实美国反导绝对拦不住\r\n\r\n　　由于中国的核力量并没有美国和俄罗斯那么强大，这两个国家都有7000枚以上的核弹头，并且中国没有高性能的战略核轰炸机和足够数量游弋大洋的弹道导弹核潜艇和潜射导弹，因此中国特别注重发展陆基洲际弹道导弹。也因为如此，中国在陆基弹道导弹的研发上取得了长足的进步，以至于美国现在考虑要承诺“不首先使用核武器”。来源《华盛顿邮报》引用美高层幕僚的爆料称，美国最高统帅计划在本月内做出最终决定：放弃首先对中俄使用核武器打击的权利。源有是美国尽管有7500枚弹头，但是也不确保能够在开战伊始摧毁中、俄的全部核武库，而美国的反导系统在面对类似于中国“东风-41”这类具备较强突防能力的洲际弹道导弹面前并不能做到有效拦截。\r\n中国东风41导弹水平究竟有多高？俄将领证实美国反导绝对拦不住\r\n\r\n　　美国目前对于拦截东风-41是头痛的，因为这种导弹能够携带最多10枚核弹头，并且解放军的火箭军会在导弹上加装突防装置使得美国反导系统无所适从。这意味着中国东风-41发射的每一枚核弹头都有独立的飞行弹道，可以自行调整轨迹攻击不同目标。美方的表态和俄罗斯的监控结果是相互印证的，证明中国的“东风-41”弹道导弹确实具备了出色的分导多弹头打击能力。按照美国反导系统目前0.3的拦截概率计算，为了拦击一枚“东风-41”弹道导弹上的10个分导弹头，美国至少要发射30到40枚拦截弹才能够确保拦截，已经让美国的反导拦截系统处于过饱和状态了。也就是说仅仅发射2枚“东风-41”导弹，美国的反导系统就会顾此失彼丧失对全部弹头的拦截能力。如果美国要继续扩建反导系统，成本上率先是美国无法承受，现有的200亿美元的预算需要成倍增加，这也迫使美国要放弃首先使用核武器的一个动因，运营成本确实太高了。（作者署名：无名高地）\r\n\r\n　　本栏目所有文章目的在于传递更多信息，并不代表本网赞同其观点和对其真实性负责。凡本网注明版权所有的作品，版权均属于新浪网，凡署名作者的，版权则属原作者或出版人所有，未经本网或作者授权不得转载、摘编或利用其它方式使用上述作品。\r\n\r\n　　新浪军事：最多军迷首选的军事门户！\r\n', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('asdadadad', '解放军火箭炮精度堪比导弹 命中直径30米靶标', '近日，央视新闻节目报道了西藏军区某炮兵团远火分队近日进行实战化条件下的综合演练，在确定目标信息后，远火分队18分钟内就完成了远程目标精确打击。首轮打击，直径30公里外的预定目标被成功摧毁。（环球网）', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('asdas465d4a65d4sa65', '经纪人:登巴巴或明年3月重返赛场 会更加强大', '新浪体育讯　　北京时间7月21日消息，上海申花外援登巴巴在中超联赛第17轮的上海德比中左小腿骨折，重伤离场，他的职业生涯是否会就此终结呢？如果登巴巴恢复的话需要多长时间呢？据《雅虎体育》报道，登巴巴的经纪人亚历山大-龚特翰在接受采访时表示登巴巴在10年前胫骨也有过同样的创伤，他并不担心，登巴巴重返赛场后会变得更加强大。相信登巴巴会在明年3月复出，随上海申花征战2017赛季的比赛。上帝会给予登巴巴力量，帮助他重返球场。\r\n\r\n　　北京时间7月17日19点35分，2016赛季中超联赛第17轮在上海虹口体育场展开一场较量，上海申花主场2-1逆转战胜上海上港。第63分钟，登巴巴拼抢中左小腿骨折变形，重伤离场。上海申花主教练曼萨诺称这次受伤可能会让登巴巴的职业生涯终结。登巴巴的伤情让很多球迷为之担心。不过，无论是登巴巴本人还是登巴巴的经纪人亚历山大-龚特翰都对登巴巴重返赛场充满信心。登巴巴表示：“这真的是一次严重的受伤，但我相信我一定能够克服。我的职业生涯还没有结束，这是肯定的。”\r\n\r\n　　在谈到这次受伤时，登巴巴的经纪人亚历山大-龚特翰表示：“现在，登巴巴已经感觉好些了，他已经意识到了这个问题。他十年前胫骨也受过伤，他并不担心，他只是需要时间来恢复，并且他回来之后会比以前更加强大。”\r\n\r\n　　亚历山大-龚特翰还表示登巴巴会在本周五上午做手术，相信登巴巴能在明年3月新赛季开始的时候复出，并对上海申花给予登巴巴无微不至的关照表示感谢，“本周五的上午会由法国的外科医生来做手术，我们相信并且希望登巴巴能够在明年3月、上海申花下赛季开始的时候复出。（上海申花）俱乐部竭尽所能的关照登巴巴，我们感谢他们。”\r\n\r\n　　亚历山大-龚特翰还表示登巴巴的意志力坚若磐石，上帝会帮助他重返球场，“他就像磐石一样坚强，人生有很多种方式可以考验一个人的意志。上帝会予登巴巴力量，帮助他重返球场。”\r\n\r\n　　本赛季，登巴巴个人状态极佳，目前以14个进球领跑中超射手榜。原本是本赛季中超联赛金靴的第一热门，但由于遭遇重伤，登巴巴很可能无缘这项荣誉。不过，能否夺得中超金靴相对于登巴巴的恢复来说并不重要，我们一起期待登巴巴重返赛场的那一天！\r\n\r\n　　（李哲）', '2016-07-21 18:13:33', '2016-07-06 18:13:35', '0', '1');
INSERT INTO `officialwebsite_news` VALUES ('e82ff2e8-d61d-4e52-bfe5-0cbbc936c39f', '换行等特殊符号测试', '<p>\r  \\r\r </p>\r <p>\r  <br />\r </p>\r <p>\r  <br />\r </p>\r <p>\r  \\n\r </p>\r <p>\r  <br />\r </p>\r <p>\r  <br />\r </p>\r <p>\r  \\r\\n\r </p>\r <p>\r  <br />\r </p>\r <p>\r  <br />\r </p>\r <p>\r  \\n\\r\r </p>\r <p>\r  <br />\r </p>', '2016-07-28 13:20:19', '2016-07-28 13:20:19', '0', '1');

-- ----------------------------
-- Table structure for officialwebsite_service
-- ----------------------------
DROP TABLE IF EXISTS `officialwebsite_service`;
CREATE TABLE `officialwebsite_service` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `updateTime` datetime NOT NULL,
  `createTime` datetime NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of officialwebsite_service
-- ----------------------------
INSERT INTO `officialwebsite_service` VALUES ('231231', '第一YEWU介绍', '<p align=\"center\">\r  <span style=\"color:#64451D;font-size:16px;\"><embed src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owServiceBackAction!getServiceTextImgByImgName.action?imgName=189a450c-aaef-45d0-883a-85a93fb06436.jpeg\" type=\"video/x-ms-asf-plugin\" width=\"550\" height=\"400\" autostart=\"true\" loop=\"true\" /><br />\r </span> \r </p>\r <p>\r  <span style=\"color:#99BB00;font-size:16px;\">短短一个月之内，中国在南海进行了两次大规模军事演习，这种频率貌似并不常见；此次军演起始之日，恰好在所谓“南海仲裁案”结果公布后一周，又正好在空军宣布巡航“常态化”之后第二天，此种安排究竟是作何考虑呢？\r      　　经常“擦枪”才能防止“走火”，适时的“亮剑”才能有效维护我国主权与领土安全及地区和平大局。对此，中国必须要做好长期准备。文︱瞭望智库特约研究员方晓志本文为瞭望智库特约文章，如需转载请在文前注明来源瞭望智库（zhczyj）及作者信息，否则将严格追究法律责任根据中国海事局公告，7月19日至21日，中国海军在海南岛东面海域进行诸兵种联合军事演习。此前（7月5日至11日），中国海军在西沙群岛周边举行了为期一周的军演。7月18日，中国空军新闻发言人宣布，中国空军在近期出动了轰-6K飞机赴黄岩岛等岛礁附近空域进行了巡航，并表示这种巡航将会保持“常态化”。短短一个月之内，中国在南海进行了两次大规模军事演习，这种频率貌似并不常见；此次军演起始之日，恰好在所谓“南海仲裁案”结果公布后一周，又正好在空军宣布巡航“常态化”之后第二天，此种安排究竟有何考虑？\r      　　空海互动：提高我军应对南海安全威胁的整体实力\r      　　在中国正在积极推行军队改革的大背景下，多军兵种联合作战的重要性更加突出，强调各军兵种的一体互动。此次军演的一个显著特点，就是更加注重海空军的配合——以阶段性海空军独立演练的方式，来推动军兵种配合的实战化训练的深入发展；通过海空军之间的战略与战术配合演练，提升我军应对南海地区各种安全威胁的整体实战能力。之前，解放军已派出战斗机赴黄岩岛附近海域进行战斗巡航，轰-6K、歼-11以及侦察机、空中加油机等机型均包含在内。其中，轰-6K格外引人注目。作为一款中国自行设计的中远程轰炸机，轰-6K最大起飞重量约95吨，正常载弹量为9吨，最大航程超过8000公里，作战半径超过3000公里，主要用于执行远距离精确打击和临空轰炸任务，装备主要武器为长剑-20攻陆巡航导弹，有效射程在1500-2500公里之间，战斗部重量约为500千克，打击能力与美军最新的战斧4巡航导弹相当。理论上，如出动一个轰炸机团18架轰-6K，一次就可以摧毁琉球群岛上39处重要军事设施的半数，将极大削弱冲绳基地运作能力，为后续的攻击机群打开空袭通道。但是，轰-6K也有弱点，那就是自卫能力较弱。因此，此次我军派出了一个强悍的空中战斗群为其保驾护航，包括歼击机、侦察机、空中加油机等，几乎囊括了我军全部主力机种，以空中侦察、对抗空战和岛礁巡航为主要目标组织行动，不仅能够执行远程精确打击任务，还具备随时歼灭空中来犯敌军的能力。如上所述，空军已经宣布，将这种巡航“常态化”。因此，这也将会成为此次军演的一个重要组成部分。未来，我们进行南海区域的远程常态化巡航时，轰-6k战斗群将不仅只针对黄岩岛，而且涵盖该南海地区所有中国主权范围内的岛礁，从而将中国空军的远程覆盖能力提升到一个新的高度。另外，今后空军在实施常态化南海巡航的过程中，将会使用与相关海空域距离较近的机场。除了正在部分南沙岛礁上修建的机场外，海南岛将是空军对南海实施常态化巡航的最佳基地——若从海南岛东南部机场起飞，中国空军的大部分机型作战半径都可以覆盖黄岩岛。因此，此次中国海军选择在海南岛附近海域举行演习，实际上也是在进行配合演练、实现空军战机的常态化巡航，是对海空军在南海地区进行海空立体配合态势的一种磨练。具体而言，通过空军实施长距离巡航监视，为海军行动提供远程预警，一旦南海地区发生不测，中国的海空力量将有更多机会和时间来完成维护国家权益的任务。\r      　　低调亮剑：对“南海闹剧”后系列挑衅行为作出回应\r      　　南海问题之所以复杂，在很大程度上，是由于域外大国的干涉造成的。今年以来，美国就打着维护“航行自由”的旗号，不断派出军舰进入南海区域进行挑衅。7月12日，由日本右翼分子柳井俊二担任庭长的仲裁庭对所谓“南海仲裁案”做出了既非法又无效的裁决。中国外交部严正声明，“南海仲裁案”一开始就是建立在菲律宾违法行为和非法诉求基础上，无论是在管辖权、公正性、程序性等方面都不具备合法性，因此没有任何效力，中国将绝对不接受、不承认仲裁庭管辖和裁决。然而，所谓“仲裁”结果刚刚公布，美国、日本、菲律宾等国家就企图联合起来在南海问题上兴风作浪。*菲律宾不仅通过舆论鼓吹菲渔民自此有权在黄岩岛海域捕鱼，而且还于13日派出一个电视台采访组，试图随菲律宾渔船“重返黄岩岛”，而这些举措也得到了美日等国家的支持。*7月13日，日本和菲律宾在马尼拉附近海域举行联合演习，包括1艘日本海上保安厅的“津轻”号巡逻舰，以及菲律宾海岸警卫队的海上和空中力量，美国和澳大利亚则以观察员身份参加。尽管两国声称演习是为应对海盗行为和武装抢劫，不针对中国和南海，但是，选在这种时机举行演习，不能不让人理解为是在给菲律宾撑腰打气，以及向国际社会表明两国对仲裁结果的态度。*7月15日，日本抓住亚欧首脑会议的时机炒作南海问题，加强对中国施压力度，期待中国遵守所谓“南海仲裁”结果。*7月17日，美国副总统拜登访问澳大利亚，对媒体表示期待中国“遵守国际规则”。针对上述种种“发难”，中国这种不承认、不接受的态度，不能只停留在口头上，而须采取必要措施——中国应当像一根弹簧，当外界施加的压力越大时，反弹也要更大。“法理战”和“舆论战”是必要的，通过摆事实、讲道理、加大说服力度，争取国际社会更多支持和理解；同时，中国更需要采取能切实捍卫主权不受侵犯的军事手段，加大在南海的维权力度，从而更有效地宣示自己在南海的主权主张。因此，中国选在19日开始举行军演，是对美国、日本及个别周边国家在南海地区的挑衅行为作出的反应；同时，显示出中国军队维护国家主权、领土安全的能力和决心，将对那些对中国心怀不轨的国家起到重要的威慑作用。同时，通过适当、适时地展示军事实力，以及坚持有条不紊地进行南海岛礁建设，中国正在向世界证明自己“说话算数”的能力。\r      　　做好长期斗争的准备：常“擦枪”才能防“走火”\r      　　很大程度上，南海问题在是中美之间的一种战略博弈，虽然两国经常因南海问题剑拔弩张，但军队交流与合作一直没有停止，并且保持着各种沟通渠道畅通。就在南海仲裁案结果公布后，两国仍然在进行“环太平洋-2016”海上演习。中国海军参演舰艇所在的175特混编队，已经陆续展开了警戒幕队形、营救落水人员、海上拦截、小艇登临检查和编队运动等课目的演练，并未受到仲裁案的影响。此外，就在此次南海军演前夕，中国邀请了美国海军最高将领、海军作战部长约翰·理查森上将，从7月17日起对中国进行了为期3天的访问，共同讨论南海争端、环太平洋军演以及两国海军未来的合作机会等议题。这表明，中美之间虽然存在着分歧和矛盾，但已经具有了非常成熟的海上危机管控机制。中国是在自己“家门口”进行军事活动，与某些国家不远万里派出航空母舰、轰炸机及战斗机到南海海耀武扬威的行为性质完全不同。实际上，中国此次军演保持了相当程度的克制。与上一次海军诸兵种联合军事演习相比，这次联合军演的演习范围和地点都有所缩小，不仅远离南海争议岛礁（甚至都未选择已实际控制的西沙群岛），而是在海南岛附近海域进行演习，此举既保持了演习范围和地点的连接性和延续性，在展示捍卫主权之意愿和实力的同时，也在充分表达了中国政府不希望给南海局势过分加压的克制态度。从未来发展来看，在“南海仲裁案”结果出台后的短期内，美国以此为借口在南海挑起事端的可能性会很大。除了利用军事优势加大挑衅力度以外，美国还可能挑动周边国家以及域外国家构筑围堵中国的包围圈，实现其深化“亚太再平衡”战略的目的。若任其发展，南海形势会越来越严峻与复杂。正如海军司令员吴胜利在与理查德森会晤时所说的那样：“我们绝不会牺牲南海主权权益，不要指望我们在领土主权上作出让步；我们绝不会畏惧任何军事挑衅，中国军队是维护国家主权、安全和发展利益的坚强力量，中国海军已做好充分准备应对任何侵权挑衅。”总而言之，经常“擦枪”才能防止“走火”，适时的“亮剑”才能有效维护我国主权与领土安全及地区和平大局。中国，必须要做好长期斗争的准备。（来源：瞭望智库）</span> \r </p>', '2016-07-21 18:13:33', '2016-08-19 18:13:35', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('3a187059-e361-4e98-b5d1-224369f0e60f', '安倍的自民党为何鼓励学生举报反战老师', '<blockquote>\r  <p style=\"text-align:center;\" align=\"left\">\r   <span style=\"color:#E56600;\"></span><img src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owNewsBackAction!getNewsTextImgByImgName.action?imgName=459ccb02-c310-431f-b32b-b8a92b4d92d9.jpeg\" alt=\"\" height=\"520\" width=\"707\" /> \r  </p>\r  <p style=\"text-align:center;\" align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">自民党展开的学校教育政治中立性调查页面</span> \r  </p>\r  <p style=\"text-align:center;\" align=\"center\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\"><embed src=\"http://player.youku.com/player.php/sid/XMTQ2NDY0NDc2/v.swf\" type=\"application/x-shockwave-flash\" width=\"500\" height=\"400\" quality=\"high\" /></span> \r  </p>\r  <p style=\"text-align:center;\" align=\"center\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\"> \r   <iframe src=\"/happyholiday_admin_officialwebsite_0.2/jslib/kindeditor-4.1.10/plugins/baidumap/index.html?center=139.061454%2C36.585649&zoom=5&width=558&height=360&markers=139.061454%2C36.585649&markerStyles=l%2CA\" style=\"width:560px;height:362px;\" frameborder=\"0\">\r   </iframe>\r <br />\r </span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;6月25日，当日本各个政党为了参议员选举忙得不可开交时，日本首相安倍所在的自民党却悄悄展开了名为“学校教育政治中立性事态调查”，呼吁民\r                       众举报身边涉及违反”学校政治中立“原则的事件，并且采用了实名制。这一调查在日本引起巨大反响，网友质疑政府对”政治中立“的定义，更反感自民党采取的\r                       实名制举报方式，批评其为“告密论坛”，企图用政治监控教育，让人联想起战前的告密社会。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">此前由于日本国内声势浩大的反安保活动，安倍政府遭到了史无前例的质疑，其中高中生和大学生充当了反安保主力军。而今年7月的参院选举，日本首\r                       次将选举年龄下调至18周岁，这意味着许多高中生的选择也将影响选举结果。高中生的主要活动场所就是学校，教师的言行会对学生产生极深影响。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;尽管争议巨大，调查活动仍然按计划进行，并在参议院选举结束后结束调查，自民党党员称调查结果会提交文科省（相当于教育部）。不难推测，自民党此次动作很可能是为了7月的选举，给高校老师们一个警告。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">自民党：请</span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">“</span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">举报</span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">”</span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">反对安保法的教职人员</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">据自民党官网上的说明，这次调查由党文部科学部会负责，为了贯彻学校教育必须坚持政治中立的原则。他们指出，虽然教育追求的是不偏不党，但是实际上，常有老师违背这一原则，在教育过程中发表不恰当的言论，比如说“不能把孩子送去战场”之类的话。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;自民党呼吁大家“举报”身边违背政治中立原则的老师，由于采取了实名制，举报者需要填写具体的时间，地点，人物和事件详情。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">“不能把孩子送去战场”，这不是理所当然的事情吗？日本网友开始讨论这类言论是否违背政治中立，由于舆论讨论太热，调查网页一度崩溃。页面恢复后，“不能把孩子送去战场“也被更换成”应该废除安保法案。”</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">负责调查活动的是自民党文部科学部会长木原稔，他在接受采访时表示，选举权年龄下调至18周岁，又临近参议院选举，我们只是想调查学校里有没有发生混乱。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">不过早在今年5月，自民党就提出要修改《教育公务员特例法》，呼吁给违反规则参与政治活动的教职员工制定惩罚条例，最早在今年秋天的临时国会提\r                       出修正案。虽然现行法律明文禁止国家公务员“为政治或政党的目的，从事政治行为”，但是由于缺乏惩罚规范，自民党干部指出，事实上相当于没有约束。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">修正案预计提出，对违反规定的教职员工处以“三年以下监禁，及100万日元以下罚款”。同时还希望把约束范围从义务教育制公立学校扩大所有高校，包括日本数量众多的私立高校。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">自民党党员称调查结果会提交文科省，由于自民党是日本执政党，在国会拥有多数席位，又加上安倍政权控制了日本政府，此次调查对教育政策的影响必然不小。</span> \r  </p>\r  <p align=\"left\">\r   <br />\r  </p>\r  <p align=\"center\">\r   <img src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owNewsBackAction!getNewsTextImgByImgName.action?imgName=16544378-56e8-4790-a8df-cb1738bfdfea.jpeg\" alt=\"\" /> \r  </p>\r  <p align=\"left\">\r   <br />\r  </p>\r  <p style=\"text-align:center;\" align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">标语：安倍政权不可原谅</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">以中立之名干涉自由：日本重返告密社会？</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;按照日本《教育基本法》的规定，“校方不能开展支持或反对特定政党的政治教育与政治活动”，这也是所谓“教育政治中立”的由来。但该法监督的只是义务制教育范围内的公立学校教职员工，大学教师因非公务员身份，不在监督范围以内。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">在日本参议院审核安保法案前爆发的反安保游行期间，不少教职员工因发表反安保言论而被警告批评的事件，比如2015年7月，福冈教育大学副教授\r                       林崎和彦，因在课堂上批评安倍政权和安保法案，学生在推特上爆料后，该教授受到大学的停课处分。9月，北海道曾有某高中老师把反安倍政权标语牌放在了办公\r                       桌上，事后北海道教育委员会开始对公立学生展开调查，以确保教育的政治中立性。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">自民党这次调查让不少日本民众感觉不太舒服，首先调查采取的是实名揭发制，等于让学生直接检举身边的老师，让同事揭发身边的同事。其次，自民党\r                       会把调查结果报告日本文科省，目的是促进在秋季国会时讨论修改法律，加强对高校职工的惩罚条例。在选举进行时开展此次调查，简直就是给全国老师的警告，结\r                       果只是让全国老师们“自省”，甚至是追责地方教育委员会，让原本应该自由讨论的课堂陷入萎缩。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">甲南大学名誉教授熊泽诚发表评论说，二战前的日本，也曾像纳粹一样实行“告密”和言论控制。安倍政权的极权主义倾向很明显，这次的举动非常危险。</span> \r  </p>\r  <p align=\"left\">\r   <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">日本教职员工工会“日教组”，曾站出来批评教育委员会的调查行为，认为这是执政党控制下政府对教育的干预。但由于日教组有许多经历过二战的年长成员，并且与在野党的密切关系，日教组在日本常被批评为“偏左派系”。</span> \r  </p>\r  <p align=\"left\">\r   <br />\r  </p>\r  <div align=\"left\">\r   <p align=\"center\">\r    <img src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owNewsBackAction!getNewsTextImgByImgName.action?imgName=b5a6da24-e811-40c9-8e02-7736272dba79.jpeg\" alt=\"\" /> \r   </p>\r   <p>\r    <br />\r   </p>\r   <p style=\"text-align:center;\">\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">自民党官网上对调查的说明前后进行了修改</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">何为中立：教育不能成为洗脑工具</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;日本舆论对自民党的“揭发”调查活动表现出普遍不满，认为会让日本重返“告密社会”，但大家普遍认同，教育确实需要保持中立，向学生们宣传某一特定党派的思想的教师应该受到处罚，“洗脑教育”不可原谅。</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">只是何为中立，是需要社会共同讨论的，而非自民党自说自话。在日本下调选举年龄后，老师们肩负了更重的“政治启蒙”任务，政治中立不是指避免谈\r                       论政治，而是指老师们应该向学生提供多方面的思考。比如涉及安保法案时，老师们应同时提供支持者和反对者双方的看法，让学生们自由思考，自行选择。</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">日本《每日新闻》曾在今年5月下旬展开问卷调查，对自民党修改法律、惩罚违反“中立原则”的教职员工的计划进行询问。民调显示，接受采访的100人中，63人持反对态度，赞成的仅有5人</span><span style=\"font-family:Microsoft YaHei;\"></span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">。大家认为，惩罚制度会限制教育自由，而且政治中立的定义尚不明确。</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;在自民党官网最初的说明中，将“反对战争”也列为了违反中立的案例，但是不少评论认为，不想让孩子们上战场，不是理所当然的事情吗？难道我们应该期待战争吗？官网最终把这一句删除，但民众仍然认为</span><span style=\"font-family:Microsoft YaHei;\"></span><span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">这不能改变整个事件的性质。</span> \r   </p>\r   <p>\r    <span style=\"font-family:\'Microsoft YaHei\';color:#E56600;\">讽刺的是，网友找出2014年10月2日自民党木原稔的讲话，他提出“只有在文科省的指导下，通过学校教育，才能让孩子们正确理解修改宪法的必\r                       要性。”如果“废除安保法案”违背了中立原则的话，“支持安倍经济学”、“支持修宪”的发言是否也应该被举报呢？教育不能成为自民党巩固政权的“洗脑工\r                       具”。</span> \r   </p>\r   <p>\r    <br />\r   </p>\r  </div>\r </blockquote>', '2020-10-01 22:41:49', '2028-07-27 22:41:49', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('4165456', '习近平就做好当前防汛抗洪抢险救灾工作提出6点要求', '第一，切实落实防汛抗洪责任制。第二，科学精准预测预报。第三，突出防御重点。第四，全力保障人员安全。第五，强化军民联防联动机制。第六，抓紧谋划灾后水利建设。\r\n\r\n　　原标题：习近平对加强安全生产和汛期安全防范工作作出重要指示强调\r\n\r\n　　新华社北京7月20日电近日，中共中央总书记、国家主席、中央军委主席习近平在中共中央政治局常委会会议上发表重要讲话，对加强安全生产和汛 期安全防范工作作出重要指示，强调安全生产是民生大事，一丝一毫不能放松，要以对人民极端负责的精神抓好安全生产工作，站在人民群众的角度想问题，把重大 风险隐患当成事故来对待，守土有责，敢于担当，完善体制，严格监管，让人民群众安心放心。\r\n\r\n　　习近平指出，各级党委和政府特别是领导干部要牢固树立安全生产的观念，正确处理安全和发展的关系，坚持发展决不能以牺牲安全为代价这条红线。经济社会发展 的每一个项目、每一个环节都要以安全为前提，不能有丝毫疏漏。要严格实行党政领导干部安全生产工作责任制，切实做到失职追责。要把遏制重特大事故作为安全 生产整体工作的“牛鼻子”来抓，在煤矿、危化品、道路运输等方面抓紧规划实施一批生命防护工程，积极研发应用一批先进安防技术，切实提高安全发展水平。\r\n\r\n　　习近平强调，要加快完善安全生产管理体制，强化安全监管部门综合监管责任，严格落实行业主管部门监管责任、地方党委和政府属地管理责任，加强 基层安全监管执法队伍建设，制定权力清单和责任清单，督促落实到位。要发挥各级安委会指导协调、监督检查、巡查考核的作用，形成上下合力，齐抓共管。要改 革安全生产应急救援体制，提高组织协调能力和现场救援实效。要完善各类开发区、工业园区、港区、风景区等功能区安全监管体制，严格落实安全管理措施。要完 善安全生产许可制度，严把安全准入关。要健全安全生产法律法规和标准体系，统筹做好涉及安全生产的法律法规和标准的制定修订工作。\r\n\r\n　　习近平强调，要加强城市运行管理，增强安全风险意识，加强源头治理。要加强城乡安全风险辨识，全面开展城市风险点、危险源的普查，防止认不清、想不到、管不到等问题的发生。\r\n\r\n　　习近平指出，目前正值主汛期，一些地区出现了严重洪涝灾害，这是对我们的重大考验。各级党委和政府要坚持守土有责、履职尽责，做好防汛抗洪抢险各项工作，切实保护人民群众生命财产安全。\r\n\r\n　　中共中央政治局常委、国务院总理李克强作出批示指出，今年以来，在各方面共同努力下，全国安全生产形势总体稳定，但重特大事故多发势头仍未得 到有效遏制，造成的重大人员伤亡和损失令人痛心，也暴露出安全生产相关领域的工作仍存在诸多不足与隐患。各地区、各部门尤其是各级领导干部要深刻汲取教 训，坚持生命安全至上、人民利益至上，坚持安全发展理念，坚持依法治安、源头防范、系统治理，切实加强安全风险识别管控和隐患排查治理，切实加大安全基础 保障能力建设力度，切实落实安全生产责任制、强化工作考核，依法严惩违法违规和失职渎职行为。加快制定完善相关法律法规和标准，进一步深化安全监管体制改 革和机制创新。当前，要特别重视做好极端天气和重大灾害预警预报、检查督查和应急处置工作，强化各项安全防范措施，坚决遏制重特大事故发生，切实把保障人 民群众生命安全的承诺落到实处。\r\n\r\n　　国务院20日召开全国安全生产电视电话会议。中共中央政治局委员、国务院副总理马凯出席会议并讲话。他指出，各地区、各部门要认真贯彻落实习 近平总书记重要指示精神，按照国务院要求，扎实做好汛期和下半年安全生产重点工作。要高度警惕汛期灾害性天气带来的威胁，突出矿山、尾矿库、危化品、建筑 施工、交通运输、旅游等重点行业领域和易受灾害影响的重点部位，对汛期安全防范工作进行再检查再落实，确保灾害监测预警及时、风险隐患治理管控到位、应急 处置和保障有力。要在总结巩固上半年工作成效的基础上，保持工作连续性、增强工作预见性和实效性，继续紧紧抓住遏制重特大事故这个重点不放松，积极推进安 全生产领域改革创新、依法治安、专项治理等重点工作，全力维护安全生产形势的总体稳定，为经济发展和社会和谐稳定创造良好的安全生产环境。\r\n\r\n　　国务委员郭声琨在会上传达了习近平重要指示和李克强批示。国务委员王勇主持会议。\r\n\r\n　　公安部、交通运输部、安全监管总局负责同志在会上作交流发言。\r\n\r\n　　国务院安委会各成员单位、在京中央企业负责同志参加会议。各省区市、计划单列市、新疆生产建设兵团和市、县设分会场。（完）', '2016-07-21 18:13:33', '2016-07-29 18:13:35', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('4165456asda', '刚刚，华为又向美韩开了 一枪！举国沸腾！', '<div style=\"text-align:justify;\">\r  <span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">振奋人心！华为刚刚又出手了，这一枪打向了韩国，同时也把枪头对准了美国！众所周知，目前的南海中美局势紧张，而华为首先做出抗美的全面反击！\r   起诉，三星再上法庭\r   你没有看错，华为又一次把三星告上法庭！一个月前，华为打响第一</span><span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">枪，在</span><span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">美国、中国同时向三星起诉，要求三星立即停止侵权行为，并向华为进行赔偿，这是历史首次！\r   就在所有人都在等待最终结果，三星也正在准备反诉华为的时候，又是一枪打响了。7月7日，华为再次出手，把三星第二次告上法庭，共计16款手机涉嫌侵权，包括三星最新旗舰GalaxyS7！\r   三星在中国的三大命脉全被起诉！华为表示，惠州三星、天津三星、三星投资公司未经许可，以生产经营为目的，大量制作、使用、销售、许诺销售被控侵权产品！\r   从来不打无准备之仗，三星连续两次被华为起诉，一旦败诉，三星不仅仅是巨额赔偿，或还有最恐怖的禁售！最新数据，三星已从国内排行榜中消失，过去一年三星在华员工骤减上万人，这个韩国人眼中的“天下第一”正被中国企业搞得痛不欲生！\r   刚刚，华为又向美韩开了 </span><wbr style=\"line-height:1.5;\"><span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">一枪！举国沸腾！\r   反击，向美国开枪\r   禁售！制裁！调查！这是美国对中国企业最常用的伎俩，禁华为、制中兴、查钢企，一次又一次的欺人太甚！美国永远没想到，今天正把苹果逼上绝路的是一家中国企业，他更没想到今天将美国第四大运营商告上法庭的，还是这家中国企业！\r   没错，华为这次双管齐下，一枪打向韩国三星，另一枪打向美国第四大运营商！7月8日，华为把美国第四大运营商T-Mobile告上法庭，T-Mobile不但拒绝与华为达成专利授权协议，还继续肆意使用14项华为的4G LTE通信专利！\r   众所周知，华为在美国拥有9800件专利，但你不一定知道其中7400件都是通信技术专利，这次华为向美国开枪，不是手机，而是致命的4G LTE通信专利！如果T-Mobile继续肆意妄为，流血的将是整个美国的通信网络！\r   任正非，被告变原告\r   刚刚，华为又向美韩开了 </span><wbr style=\"line-height:1.5;\"><span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">一枪！举国沸腾！\r   鬓发苍白，仍在沙场的任正非\r   3年被告54次！曾经这个天天被告的任正非，如今却在他72岁的时候成了中国第一位起诉并接连起诉世界级巨头的原告！当韩国人认为这是中国山寨企业在博眼球的时候，他又把三星告上了法庭。\r   当美国频繁欺负中国企业，刚制裁中兴，再对华为下手的时候，他仍坚定表示“五年内全面超越苹果”！并放出狠话：“不要在乎一城一池的得失，我们要的是全世界”！\r   而就在今天，在南海问题中美博弈的背景下，任正非又一次出现在了原告席上，他说：不是我喜欢打官司，而是我必须打官司。我必须保护中国自己的知识产权，保护华为自己的科研成果！只有科技强，才能中国强！\r   我们相信随着华为、海尔、苏宁等一批中国企业的不断崛起，中华民族的伟大复兴不会太遥远，中华人民将屹立在世界的</span><span style=\"line-height:1.5;font-size:14px;font-family:\'Microsoft YaHei\';color:#E56600;\">东方！\r   卧薪尝胆，磨砺十年青锋！扬眉出鞘，为之中华而为！</span> \r </div>', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('4a65s4d56a4d65', '俄罗斯对中国在岛屿争议方面支持', '根据俄罗斯军工综合体7月19日报道，俄罗斯用苏霍伊的最新杰作---苏-35战机支持中国。根据《军事平衡》报道，中国空军即将有两型新型战机服役——俄罗斯的苏-35和中国自主研发的歼-20战机。\r\n　　海牙仲裁法庭否定中国对中国南海争议岛屿的拥有权，7月14日中国互联网有报道称，俄罗斯将对华交付第一架苏-35战机，借此对南海仲裁案的结果进行强力回应。根据中国媒体报道，当中国苏-35出现在争议岛屿时，局面将“非常有趣”。\r\n　　苏-35是“苏霍伊的最新杰作”。这是一种多用途的战斗机，可以执行包括空中打击、拦截敌机和攻击海上和地面目标的多种任务。该型战机拥有第五代战机技术，配备的雷达可以在“罕见的大范围内探测空中目标”。\r\n　　然而中国新一代战机歼-20的战斗状态给予了更有利的回应。该飞机能够对抗美国部署在亚太地区的F-22战机。歼-20的战斗力已经远超过日本的F-15D/J、F-2战机和越南的苏-30MKV战机，这些战机击败歼-20的机会几乎为零。\r\n　　消息人士同时认为，苏-35战机在中国空军的服役也间接展示了俄罗斯对于中国在岛屿争议方面的支持。', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('55471683-a876-46ee-b8ec-8719e223d4c2', '习近平：努力建设巩固国防和强大军队', '<p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平在中共中央政治局第三十四次集体学习时强调</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>多多学习java代码，比如</em></strong></span>\r </p>\r <p>\r  <br />\r </p>\r <pre class=\"prettyprint lang-js\"> \r \r <pre class=\"prettyprint lang-js\">afterBlur : function(){ //编辑器聚焦后，将编辑器的内容设置到原来的textarea控件里\r     this.sync();\r    } </pre>\r <br />\r </pre>\r <p>\r  <br />\r </p>\r <p>\r  <br />\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em></em></strong></span>\r </p>\r <p>\r  <br />\r </p>\r <p>\r  <br />\r </p>\r <p>\r  <img src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owNewsBackAction!getNewsTextImgByImgName.action?imgName=9c72b2a1-2101-49dc-994d-78cc8d7aecda.octet-stream\" alt=\"\" height=\"201\" width=\"562\" /> \r </p>\r <p>\r  <img src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owNewsBackAction!getNewsTextImgByImgName.action?imgName=74ad7062-235d-4a56-9233-95951c30d569.octet-stream\" alt=\"\" height=\"201\" width=\"561\" /> \r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>坚持党在新形势下的强军目标 努力建设巩固国防和强大军队</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>新华社北京7月27日电 \r     中共中央政治局7月26日下午就深化国防和军队改革进行第三十四次集体学习。中共中央总书记习近平在主持学习时强调，深化国防和军队改革是一场整体性、革\r     命性变革，要坚持以党在新形势下的强军目标为引领，贯彻新形势下军事战略方针，全面实施改革强军战略，着力解决制约国防和军队建设的体制性障碍、结构性矛\r     盾、政策性问题，推进军队组织形态现代化，进一步解放和发展战斗力，进一步解放和增强军队活力，建设同我国国际地位相称、同国家安全和发展利益相适应的巩\r     固国防和强大军队，为实现“两个一百年”奋斗目标、实现中华民族伟大复兴的中国梦提供坚强力量保证。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>中央军委深化国防和军队改革领导小组专家咨询组副组长蔡红硕同志就这个问题进行讲解，并谈了意见和建议。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>中共中央政治局各位同志认真听取了他的讲解，并就有关问题进行了讨论。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平在主持学习时发表了讲话。他指出，长期以来，在党的领导下，我军从小到大、从弱到强、从胜利走向胜利，改革创新步伐从来没有停止过。现\r     在，国防和军队建设处在新的历史起点上，纵观全局，审时度势，应对国际形势深刻复杂变化，坚持和发展中国特色社会主义，实现“两个一百年”奋斗目标，贯彻\r     落实党在新形势下的强军目标和新形势下军事战略方针，履行好军队使命任务，都要求我们以更大的智慧和勇气深化国防和军队改革。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平强调，党的十八大以来，党中央对深化国防和军队改革高度重视，坚持把这项重大改革摆在党和国家工作全局的突出位置，放在实现全面建成小康\r     社会奋斗目标、实现中华民族伟大复兴中国梦的战略高度来谋划和推进。党的十八届三中全会后，在党中央领导下，中央军委成立深化国防和军队改革领导小组和相\r     关工作机构，经过深入调研论证，集中全军智慧，形成了深化国防和军队改革总体方案及相关实施方案。我们相继成立陆军领导机构、火箭军、战略支援部队，把军\r     委机关由4个总部改为1厅、6部、3个委员会、5个直属机构共15个职能部门，把7大军区调整划设为东部、南部、西部、北部、中部5大战区，完成海军、空\r     军、火箭军、武警部队机关整编工作。通过这些大力度的改革，人民解放军突破了长期实行的总部体制、大军区体制、大陆军体制，建立了军委管总、战区主战、军\r     种主建的新格局，解决了一些多年来想解决但一直没有很好解决的问题，解决了许多过去认为不可能解决的问题，实现了军队组织架构的一次历史性变革。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平指出，根据改革总体方案确定的时间表，2020年前要在领导管理体制、联合作战指挥体制改革上取得突破性进展，在优化规模结构、完善政策\r     制度、推动军民融合发展等方面改革上取得重要成果，努力构建能够打赢信息化战争、有效履行使命任务的中国特色现代军事力量体系，完善中国特色社会主义军事\r     制度。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平强调，深化国防和军队改革势头很好，但后续任务依然艰巨繁重。我们要再接再厉，乘势而上，迎难而上，扎扎实实把深化国防和军队改革推向前\r     进。要进一步坚定改革信心，在国防和军队改革向纵深推进的关键当口，我们要有定力、有担当、有韧劲，继续蹄疾步稳向前走。要进一步把准改革方向，坚持正确\r     政治方向，坚持向打仗聚焦，坚持创新驱动，坚持体系设计，坚持法治思维，坚持积极稳妥。要进一步抓好改革落实，加强组织领导，抓铁有痕、踏石留印，确保各\r     项改革举措落实、落细、落稳。军队各级党委要把抓改革任务落实作为重大政治责任，着力提高精准理解、精准发力、精准落地能力，高标准完成好担负的改革任\r     务。要深化思想发动，引导广大官兵读懂改革、吃透改革，在解放思想中统一思想，为推进改革打下坚实思想认识基础。军队各级领导干部特别是高级干部要带头做\r     改革的促进派、实干家，自觉在大局下定位、思考、行动，把对党忠诚、听党指挥、向党看齐体现到落实改革任务上。</em></strong></span>\r </p>\r <p>\r  <span style=\"color:#9933E5;font-size:16px;\"><strong><em>习近平强调，深化国防和军队改革是全党全国共同的事业，中央和国家机关、地方各级党委和政府以及有关方面要强化国防意识，一如既往关心支持国防\r     和军队建设，积极配合完成跨军地的改革任务，自觉把经济布局调整同国防布局完善有机结合起来。深化国防和军队改革期间，军队转业安置干部比较多，中央和国\r     家机关有关部门、各地方要全面落实党中央决策部署，把军转干部安置好、使用好，确保军转安置工作圆满完成。</em></strong></span>\r </p>', '2016-07-27 22:27:34', '2016-07-27 22:27:34', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('9a43279b-7028-4f34-afc9-a7819327bbaa', '编辑的第一个业务信息', '<p align=\"center\">\r  <span style=\"color:#FF9900;font-size:16px;\"><strong><img src=\"/happyholiday_admin_officialwebsite_0.2/ow/back/owServiceBackAction!getServiceTextImgByImgName.action?imgName=d2268481-ac08-4b4f-8d0a-eaf09265cdb4.jpeg\" alt=\"\" /><br />\r </strong></span>\r </p>\r <p>\r  <span style=\"color:#FF9900;font-size:16px;\"><strong>“业务”更白话一些来说，就是各行业中需要处理的事务，但通常偏向指销售的事务，因为任何公司单位最终仍然是以销售产品、销售服务、销售技术等等为主。“业务”最终的目的是“售出产品，换取利润”。所以通常会把</strong></span><a target=\"_blank\" href=\"http://baike.baidu.com/view/87469.htm\"><span style=\"color:#FF9900;font-size:16px;\"><strong>业务员</strong></span></a><span style=\"color:#FF9900;font-size:16px;\"><strong>等于销售员，也就是这个</strong></span><a target=\"_blank\" href=\"http://baike.baidu.com/subview/580366/8045639.htm\"><span style=\"color:#FF9900;font-size:16px;\"><strong>原因</strong></span></a><span style=\"color:#FF9900;font-size:16px;\"><strong>，业务就是进行或处理商业上相关的活动。业务也是渠道就是指产家与销点之间关系是通过渠道之间建立起来的。而业务员在这中间起了重大的作用。业务员的工作直接影响到产家、销点、消费者这三者之间的关系。</strong></span>\r </p>\r <p>\r  <span style=\"color:#FF9900;font-size:16px;\"><strong><br />\r </strong></span>\r </p>', '2016-07-28 13:01:02', '2016-07-28 13:01:02', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('asd45a6d15a44sd56', '美国竟然迫切需要一场针对中国战争', '除台湾以外，中国地缘政治还有另外四个命门所在，得之则生，失之则死。他们分别是东北方向的朝鲜，西部方向的阿富汗，东南方向的越南，西南方向的缅甸。\r\n\r\n　　众所周知，美国借9.11事件攻克阿富汗，抢先得手中亚核心地带。现虽已大部撤军，但仍有两万部队长驻该国。对中国西部形成长期觊觑之势，扼住我西进要冲。他们一直在静候着中国东部或南部可能响起的枪声，准备随时策应。\r\n\r\n　　西南缅甸，本为我传统友好邻邦，但因中国改开以后，忙于赚钱发财，放弃经略这个唯一的印度洋通道，导致美日乘虚而入，特别是美帝对该国进行了长期的渗透和策反。拉拢军政府，培植所谓民主力量。功夫不负有心人，近年缅甸军政府几乎与中国全面翻脸，对其境内我华帮武装大打出手，悉数剿灭;前不久，昂山傀儡政权也得以成功上台执政。美国得手缅甸，中国就近前出印度洋之梦告破。不得不舍近求远，巨资打造巴基斯坦瓜达尔港。\r\n\r\n　　越南亦为我传统友邦，但因上世纪80年代为配合并服务美国全球对苏战略，换取西方世界对我开放(解除封锁)，我对越发动10年所谓“自卫战争“，从此友邦变恶邻。10年中越战争，我数以万计的军人生命只换来两个山头(老山，法卡山)，却在随后20年间丢失南海29个岛礁和数以亿桶计的石油资源。相反，近年来，美国却成功将越南化敌为友;越南成为美国新世纪反华先锋指日可待。一但越南投入美帝怀抱，将极有可能配合美帝封锁我南海黄金水道。扼杀我能源生命线。\r\n\r\n　　朝鲜本与我有浴血之盟，刎颈之交。也是我前出日本海的唯一通道。朝鲜战争后，我军本应长驻38线，一者拒强敌美帝于最前沿，二者可将金氏政权长期控于股掌之间。但因其时我为道义所困，忘记“兵者诡道”之古训。致使撤军以后，失去前沿阵地，而美帝则得以长期盘踞并经略半岛。不料金氏世袭政权随后也妄自尊大，渐行渐远，逐步失控。\r\n\r\n　　“改开”之后，我与南韩建交，但未对朝鲜作有效抚慰和引导。被朝鲜视为嫌贫爱富，形同背叛，几近翻脸。为求自保，朝鲜发奋图强，研发核弹。\r\n\r\n　　朝鲜拥核，兹事体大，关乎我华夏核心安全。初期，我本可站在朝鲜立场，同情其安全自保之诉求，以为其提供全面军事安全和核保护为条件，通过外交努力诱其弃核。可我们没有这样作，而是一开始就迎合美日立场，大肆谴责其拥核如何有害，如何不可接受，如何大逆不道，蛮横将其置于敌对一方。至此，朝鲜已对我完全绝望，一方面更加坚定开发核武，一方面寻求与美日和解，时时与美日暗通款曲。\r\n\r\n　　之后，美国本想对朝鲜核武进行外科手术式摘除，或对金氏政权作定点清除。这对我来说本应是求之不得的最佳解决方式，我们完全可以默认美帝亲缮牛刀，武力除之而后快。事成之后，我可立即主持缮后，控制局面。只要朝鲜不被美日军事占领或出现一面倒亲美政权，就算大功告成，何乐而不为?可事实上，天赐良机，我未及时把握;反而屡次硬充好汉，喝斥美帝，誓言“不许美帝在我家门口动武”。结果，两面不讨好，横竖是恶人。朝鲜骂我背信弃义，美帝责我助纣为虐。\r\n\r\n　　最终，还是美帝老辣,看出金氏政权反华底细，于是乎，一面对朝喊打，一面私下给糖，威逼利诱，暗中策反朝鲜。那么或许有人要问，现在美帝为防朝鲜核弹，已将萨德布署到朝鲜家门口，且已将金正恩列入制裁名单，还有可能策反朝鲜吗?\r\n\r\n　　这个问题，要从韩国身上找答案。韩国明知萨德并非针对自已的兄弟朝鲜，明知要得罪中俄，为何如此坚定果敢配合美国布署萨德呢?很显然，答案只有一个，韩国得到了美国和朝鲜的双重保证。也就是说美国、朝鲜、韩国早就成了一家人，他们布署萨德是为了共同对付中俄——当然主要是中国。可以肯定，萨德布署完成之时，就是美国与朝鲜建交之时。中国彻底失去朝鲜，意味着美帝对中国包围工程的最后完工。\r\n\r\n　　最后，我们谈一下台湾。美国防长卡特之所以敢在海军学院直截了当地向中国摊牌亮剑，太平洋司令哈里斯之所以敢对我叫嚣“今夜就开战”。这说明美帝如今的狂妄是有底气的。底气从何而来?很大程度来自于台湾。此话怎讲?\r\n\r\n　　如果说上述四个小国构成中国地缘政治的四个命门的话。那么台湾则是中国地缘政治命门中的罩门，是美帝合围中国包围圈上的一把大锁。\r\n\r\n　　30年来，我们对台只谈经济利益，不讲民族大义，只讲商贸往来，不作政治军事渗透。空喊寄希望于台湾人民，不认真培植政权和军事代理人。结果枉费国民党当政8年时机。导致台独思潮泛滥，政权一夜易手，再次落入台独魔爪。而美日则对台独代理人进行了长期耐心的哺育和培植，对台湾军政各部进行长期深入渗透。并愿意为台独分子随时撑腰打气，提供个人安全保证。而我对马英久之类的统派关键人物，却从未提供任何哪怕一句口头上的支持，更谈不上为他们提供个人或家庭的安全保障。\r\n\r\n　　现在看来，蔡英文为首的民进党强势归来，表明台独在美帝的悉心培育之下，终于瓜熟蒂落。美国对中国摊牌的时候也该到了。如今，他们正高歌猛进，大胆出牌。这不，一周之内，美帝与台独之间唱和有情，先有雄3导弹误射，后有太平岛撤舰，接着放风美帝接管太平岛。正如李敖所讲，美帝只要掌控了台湾，就等于抓住了中国的睾丸。同理，美帝一但占据太平岛，就意味着抓住了整个南中国海的睾丸。\r\n\r\n　　如此看来，中国地缘政治的五大命门已全部或接近全部落入美日掌控之中。难道我们只能坐以待毙吗?有没有破解之法?\r\n\r\n　　二、美国迫切需要一场针对中国的战争\r\n\r\n　　首先，我们要明白美帝处心积虑构筑对我包围圈，其动机意欲何为。总的说来，美国需要在东亚制造一场战争，而且是尽快制造一场战争，且这场战争必须是针对中国的战争。因为在美国看来，只有一场相当规模的战争才能立即终止世界工业中心向中国的转移。——因为历史已证明，世界工业中心意味着世界权力中心。\r\n\r\n　　这场战争的开局应在第三国(最好是日本)和中国之间发起。然后由美国积极参与，最后由美国主持分享成果。由第三国首先发起同中国的战争，最能符合美国对中国战争的构想。因为这样的战争，能给美国极大的操作空间。无论第双方输赢，只要中国陷入战争，投入或即将投入中国的全球资本就会一哄而散。而美国一方面可以名正言顺控制中国的周边的能源和粮食通道，逼迫中国就范。另一方面还可以气定神闲地组织指挥众多喽罗一哄而上，对中国实施群殴。而美国的军事力量可以始终以预备队的姿态，随时灵活自如地介入战争，保证能在战争中后期中国体力不支时给中国以致命一击，或者在双方持久胶着时出面要挟双方订立城下之盟，勒索双方利益。\r\n\r\n　　所以，让美国现在就直接面对面单挑中国，笑话——嚷嚷而已。\r\n\r\n　　三、国家和民族的竞争最终是要通过战争考试来分出优劣\r\n\r\n　　虽然我们不可能知道美国对中国战争的技术性构想，但上述的总体战略套路应该是不会有错的。明白这一点，我们再来看看有哪些破解之道。\r\n\r\n　　第一、美国既然要在东亚制造一场针对中国的战争，那么我们能不能在东亚以外的地区制造一场或几场针对美国的战争?沿着这个思路有三个落脚点。一是积极支持俄罗斯在乌克兰和叙利亚对美国的战争。即使不是直接针对美国而是针对美国代理人的战争也行。另一个落脚点是支持塔利班彻底赶走阿富汗的美军，重新执政。第三个落脚点是在广大的伊斯兰世界扶持壮大反美武装，开辟反美新战场。这是一个内线固守，在外线寻求突破的思路。\r\n\r\n　　第二、美国是要尽快地制造一场针对中国的战争。我们策略应该是尽量延后这场战争。但延后战争的前提必须是以最快的速度准备战争，战争准备得越快，战争才越有可能延后。紧急的战争准备有如下几点：\r\n\r\n　　1、 逐次加大战争动员力度，停止对内“和平崛起”的宣传，改为加强军事斗争准备，要准备打仗。\r\n\r\n　　2、加快粮食、能源、武器弹药储备，尤其是精确打击武器弹药。\r\n\r\n　　3、将核弹数量激增至1000枚以上，确保对敌互相摧毁。\r\n\r\n　　4、尽快与俄罗斯潜艇联合巡航美国西部海岸。\r\n\r\n　　5、 加快网络通讯自主系统的建设，加强网络防护。加快网络潜伏攻击病毒和程序的渗透。\r\n\r\n　　6、 加快对台军事情报人员，敌后特战人员，敌后临战组织指挥人员的培养和渗透。确保克里米亚回归模式的实现。\r\n\r\n　　7、加快对美军或敌对国军事基地或政战中心的情报和特战人员的渗透。\r\n\r\n　　8、 中学大学体育改革为军体，立即实施全面军事体育合一的教育政策，彻底解决后备兵源问题。\r\n\r\n　　第三、美国想要制造的是一场具有相当规模的战争。太小的战争不足以损耗中国的政治经济和军事实力。如果战争无法避免，那么我们就要想办法控制战争的规模。如何控制战争规模，有如下几点值得强调：\r\n\r\n　　1、 刚才所说尽量延后战争，不是说完全不能选择战争。相反，抓住时机，主动选择战争对象，打一场可控而有把握的战争是完全可能的。\r\n\r\n　　2、 认真主动选择战争对象。首先应避免选择日本这类有具大战争潜力或拥有核武的国家下手。在可控的时间和范围内，对菲越这样的国家进行短时间高强度的战争是完全可行的。打垮次要敌人，不仅可以震慑其他次要敌人，还可有效打乱主要敌人的战争计划，动摇其战争信心。\r\n\r\n　　3、 确立“杀鸡必须用牛刀”的现代战争观念。开战即用核武，一击必杀。在主要敌人还没有来得及反应之前，确保次要敌人已被击垮或已投降。常规战争久拖不决，就会落入主要敌人的车轮消耗的圈套。\r\n\r\n　　4、 严格控制战争时间，对时间控制无把握，不开战。特别是对台湾作战。主要战事必须3天结束。一周内全面占领到位。\r\n\r\n　　第四、最后，也是最重要的一点，那就是为政者须要从单纯的经济和科技兴国转变到政治和军事兴国上来。习惯用战争的观念来理解人性、认识世界。国家和民族的竞争最终是要通过战争考试来分出优劣的。', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('asd468a4d98a4ds89', ' 美国坐不住:乌克兰送给中国一份大礼', '2015年12月12日，美国就开始注意到东风41的发射，2016年4月12日中国又进行了一次测试。预计东风41导弹将在2020年左右服役。美国一直担心中国和乌克兰在此领域进行合作，因为东风41导弹与前苏联的“撒旦”导弹非常相似。\r\n　　而现在的乌克兰手中最值钱的洲际导弹技术，就是撒旦洲际导弹技术，这是全世界射程最远的洲际导弹，可以达到惊人的16000公里射程。撒旦导弹是世界上唯一的有10个弹头的核导弹，也是世界上体重最大的导弹。拥有多种独立锁定目标再进入载具，目前的反导系统对它无能为力。它有16个子平台，其中一个含有假目标系统。当进入高轨道时，所有弹头都隐藏到假目标中，因此雷达无法发现它的行踪。这种导弹的弹头还使用了高密度的重金属即使是激光武器也无法将其摧毁。\r\n　　据美国防务专家估计其精度也达到震撼的350米。这种导弹的核弹爆炸威力为550万吨，任何城市只要一枚就可以完全毁灭，800公里直径寸草不生。如果用150枚撒旦导弹对美国发动第一次打击，足以摧毁美国65%的陆基洲际导弹发射井，这对美国的陆基洲际弹道导弹构成了极大的威胁。此外，撒旦导弹可携带一枚两千万吨当量的氢弹或12枚以上的75万吨当量的氢弹，其最大威力约等于广岛原子弹的1600倍，也就是说两枚就能让城市圈密集的日本彻底亡国。美国一直担心这种导弹技术流入中国。\r\n　　到了2020年，正好中国全球卫星系统“北斗”也基本完成，全球卫星导航系统可以让中国核武器实现对敌方目标的精确打击。那么将可以使中国二炮部队洲际导弹得到质的飞跃。东风41导弹在理论上可以穿越一望无际的太平洋，对洛杉矶和旧金山进行打击，这可能是中国对美国发动报复性和先发制人性核打击的唯一现实途径。\r\n　　美国空军研究所研究员认为，中国核武库首要的战略目标是以美国的利益为要挟，反制美国领导人利用先进的常规或核力量来威胁中国，中国主要担心的问题就是解放军不具备可靠的核力量来发动报复性反击”。在许多方面，中国“一个世纪的屈辱”决定了其内政外交政策的制定。中国在18世纪和19世纪有遭西方侵略的历史教训，这继续左右着中国官员有关世界大国如何对待中国的观点。中国的领导者和军人希望翻过历史的这一页，下定决心绝不能让历史重演。中国的核武器计划体现了这种观念。', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('asd4a6d46a4d', ' 美核潜艇最近跑到中国黄海周边想干啥？', '近日，北海舰队组织某型核潜艇进行演习。而在7月13日，美国海军“俄亥俄”号巡航导弹核潜艇到达韩国釜山进行访问。这两件事如果单独来看，似乎都很正常，但是放在一起来看，就会发现意味深长。核潜艇由于具备水下隐蔽性好、航速快、机动性好、续航力大等特点，因此被各国海军视为极具威胁的海战装备。\r  　　特别是搭载着潜射洲际弹道导弹的战略核潜艇，被世界公认为最佳的核威慑力量。有些军事专家甚至评论说：“核潜艇是第二次世界大战之后海军军事技术上空前的大变革。”因此，世界上一些大国、强国都非常重视发展核潜艇。中国也不例外，很早就意识到核潜艇的战略作用，很清楚只有自己拥有核潜艇，才能以威慑对付威胁。所以，中国花了很大力气，克服了重重困难，最终研制成功了核潜艇。如今，中国的核潜艇已经发展了两代，技战术性能有了很大进步。\r  　　北海舰队是中国海军三大舰队中最早装备核潜艇的舰队，而且在相当长时间内也是唯一装备核潜艇的舰队。虽然随着形势的变化，核潜艇的部署重心现在移到了其他舰队，但是北海舰队仍旧保持着一支核潜艇力量，因为北海舰队有保护京、津等要害地区的责任，所以作战能力强大的核潜艇不能缺少。特别是在美中国所面临的战略压力剧增，所以北海舰队核潜艇的训练和演习越来越强化。\r  　　从美军亚太军力部署来看，不只是南方水域加强军力存在，在东北亚地区的军力也在持续增加，此次“俄亥俄”号巡航导弹核潜艇到韩国釜山就是加强美军在东北亚军力的举措之一。实际上，美军核潜艇在东北亚地区的活动一直没有消停过。自2013年12月起，“俄亥俄”号巡航导弹核潜艇的姊妹艇“密歇根”号就已经被部署到亚太，并在东海、南海以及菲律宾进行水下监视、训练以及其他秘密任务。美国海军军官本杰明·皮尔森甚至猖狂地说：“这些区域就像我们的后院。”“俄亥俄”号、“密歇根”号原先都属于美国海军的俄亥俄级战略核潜艇，后来被改装为巡航导弹核潜艇，每艘都搭载有154枚“战斧”巡航导弹，并且还能搭载2艘水下运输器和64名特战人员。\r  　　虽然俄亥俄级巡航导弹核潜艇体积和排水量庞大，不适合在海域狭窄且水深很浅的黄海活动，但是其搭载的“战斧”导弹的射程在1500公里以上，因此在第一岛链外就能对我沿海和浅近纵深目标实施打击。根据美国海军公开的信息，俄亥俄级巡航导弹核潜艇能在6分钟之内将其装备的154枚“战斧”巡航导弹全部发射完毕。\r  　　因此，俄亥俄级巡航导弹核潜艇在战时对我北部要害地区的威胁极大。此外，俄亥俄级巡航导弹核潜艇搭载的水下运输器和特战人员可以进入黄海，执行秘密的渗透侦察和破坏任务。除了俄亥俄级巡航导弹核潜艇，美国海军的洛杉矶级攻击核潜艇也不断到访日本和韩国，并在相关海域进行训练和演习活动。由此可见，美国海军针对中国北部海域的水下围堵兵力是比较强的。而我军北海舰队核潜艇不断强化作战能力，就是为了打破这种围堵。', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('asda5d1a51dsa', 'VR技术', 'VR技术可以让人仿佛置身比赛现场。 本专题撰文 广州日报记者黄维 欧洲杯决赛即将打响，在现场观赛固然激动，但有一部分球迷无需去到现场，利用VR技术，也可以获得类似的观感。据悉，欧足联确认，他们将在决赛中采取VR技术摄录技术，这无疑让人激动，实际上，他们并不是先行者，在全球化和商业化程度最好的NBA联盟中，VR的大门早已经打开。 VR亮相欧洲杯开幕式 售价起码五六万美元 就在本届欧洲杯的开幕式上，法国国宝级音乐人、有“世界第一DJ”之称的大卫·库塔和瑞典的19岁歌星萨拉·拉尔森一起演唱赛会的主题曲《为你而战》，相信不少观众会留意到，在他们的旁边有一个不起眼的黑色圆球——那就是VR摄录装置。 这个黑色圆球就是诺基亚打造的一款名为“OZO”的设备，OZO摄像机重约2.72公斤，球体四周分布着8个摄像头，可实现360度×180度的全景拍摄，分辨率2K×2K，所有摄像头可由用户通过统一的快门操控。在每个摄像头附近分别设有嵌入式麦克风，从而可以实现全方位音频录制。这一设备造价不菲，虽然没有公布售价，但据科技行业人士估计，一个起码得卖五六万美元，要完成一场VR直播，一个足球场地里起码要配备几十个OZO摄像机。 视频采集完成后，这一系列拍摄到的影像将在网上发布，用户借助虚拟现实头盔或眼镜，就可以享受身临其境的观感。不过欧足联在比赛中对这项技术的运用显得很谨慎，只有即将到来的决赛才使用这一技术进行摄录。 毫无疑问，今年是欧洲杯采用VR技术的元年，此后这一技术将得到更广泛的应用。 NBA球迷大赞感受真实 “我想靠在球场通道的墙上” 尽管足球在全球范围内的影响力远超篮球，但作为全球商业化和科技化开发最佳的联盟，NBA在很多方面已经走在了前面，VR技术同样如此。 截至目前，NBA已经为VR直播进行了长于18个月的实验，并且多次举行美国境内的直播试看活动。由于种种原因，联盟并没有大张旗鼓地对试播进行宣传，但体验者们在社交媒体和博客上的体验报告无疑让人更加向往。 和《财富》与《商业周刊》齐名的著名商业杂志《快公司》的一名雇员丹尼尔·特尔迪曼曾经体验这一技术，他说：“我用VR技术观看的那场比赛共有5个摄像头，其中一个的机位正好设在场边的摄影师的身边，当我戴上VR设备，把头往右转，就能近距离看到那个摄影师。”迪尔特曼这样评价那种真实的感觉，“我刚进入直播时，选的是场边通道的角度，而通道两边是水泥墙，我当时第一反应就是想靠在墙上。” 现在一直深耕于NBA之VR直播的是一家名为NextVR的公司，勇士的老板皮特·库伯是这家公司的投资人之一以及顾问团的成员，由于他的关系，刚刚过去的这个赛季勇士VS鹈鹕的揭幕战就进行了VR直播。尽管NBA官方没有透露试看这次VR直播的具体人数，NBA官方的初衷并不是把这一技术广泛宣扬出去，而是要寻找此项技术的种种缺陷，并加以完善。但不管如何，NBA已经走在了各个体育项目的前面。 球队也是VR受益者 战术研究在虚拟空间实现 大家为什么会爱VR？这个问题从浅层考虑，只关乎“钱”。科比在今年退役的比赛，门票的平均价格是2.65万美元一张，而NextVR为这场比赛开通了360度的全景直播，在家里用VR技术观看这场比赛的球迷纷纷表示，“我好像真的坐在湖人的替补席上，可以清楚地看到他的每一个动作，身临其境。如果真的想享受到这样一种待遇，估计到现场得花2万~10万美元。” NBA副总裁杰夫·马尔西利奥的观点是：“你通过场边VR感知到的第一件事是，球员的体型、运动能力和穿越这个赛场的速度是其他任何媒介都无法体现的。VR比任何技术平台更加强大，让你切身感受到自己是现场的一分子，它能够拉近球迷和在球场上庆祝的球员之间的距离。” 虚拟现实技术可以让球员在休赛期也能“聚”在一起进行战术分析和研究。现在华盛顿奇才的球员发展教练和相关训练人员，持续地向一个名为STRIVER的实验室录入战术，希望有朝一日能将球队战术手册的内容都以VR的方式变成数据。球员即便不在一个地方，戴上VR设备，就能和队友在一个虚拟的空间进行交流，同时模拟出比赛中任何可能发生的战术细节，让大家进行研究。这样，球员无需站在训练场上，只需要动动脑子即可，这比看战术录像更加生动。当然，训练场上的汗水依然需要挥洒，但新技术能让学习变得更便利。 从观众席到训练场，VR的可能性更多。 高科技不会影响票价 VR还无法代替现场观赛 话说回来，VR技术目前还并不成熟。接受试看体验的观众表示，比赛的气氛非常好，但好像他们没戴眼镜，画面看起来不够清晰。而有一点也难以达到，那就是在现场的互动，如果你真的在赛场坐着，喊出的加油声和嘘声可以对球员造成影响；而当你戴着VR眼镜坐在家里，你喊得大声一点，恐怕邻居就会报警。 小牛的老板、“科技大鳄”马克·库班对于新鲜事物从来不吝尝试，但他表示，这一技术不可能影响票价：“该来球馆的人，还是会来球馆看球，看VR直播代替不了你真正坐在球馆前排的体验。” 而在漫长的比赛时间中，一直戴着一个头盔一样的东西，也会让人感到不适。好在，这一切才刚刚开始。勇士老板皮特·库伯说得好，“这不是一切的终点，也算不上新生，而是萌芽之前刚开始的那么一点‘破土’。它不是积蓄的水洼，而是奔涌的海啸。这是平民和大师接触中的变革，它最终将席卷每个地方。” 扫一扫，分享到微信朋友圈 分享阅读品味，首次分享送2元红包 ', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('asdada', '深度：东风41可在太空多次变轨 美需用30枚导弹拦截', '中国的“东风-41”洲际弹道导弹是中国目前即将服役的最新的战略打击武器，主要担负着战略核反击任务。不过中国“东风-41”洲际弹道导弹是否真正能够承担起国之重器的战略打击重任呢？最近俄罗斯《生意人》《国际文传电讯社》对俄罗斯空天军副司令兼防空反导部队司令专访时承认，俄方对中国的“东风-41”弹道导弹技术高度认可，甚至其技术水平超乎的俄方的意料。\r\n中国东风41导弹水平究竟有多高？俄将领证实美国反导绝对拦不住\r\n\r\n　　根据俄防空反导部队司令维克多·古缅内伊中将在接受专访时称：中国在4月进行了一次“东风-41”洲际弹道导弹的实验。刚一升空俄罗斯空天军位于伊尔库斯克“沃罗涅日-M”雷达就捕捉到图像并进行了全程监控。监测的结果显示中国的“东风-41”导弹在进入太空后进行了数次大幅度变轨，甚至改变了弹头的飞行方向，原本射向东北方向的导弹，突然变成飞向南部方向，随后释放出两个具有独立飞行弹道的模拟分导弹头，这项技术让俄方感到颇为震惊。因为俄罗斯目前现役的“亚尔斯”弹道导弹也没有达到在太空中数次改变发射轨迹的能力，这是穿透美国反导系统的极佳手段。因为美国反导系统的雷达是需要连续跟踪，提前发射拦截弹进行拦截，如果飞行方向改变，反导系统就彻底失去效用了。\r\n中国东风41导弹水平究竟有多高？俄将领证实美国反导绝对拦不住\r\n\r\n　　部署在俄罗斯伊尔库茨克西北部米舍列夫卡镇的77Я6“沃罗涅日-М”雷达是专为监视太空和导弹来自的预警系统的组成部分，探测距离达6000公里，监控区域从美国西海岸一直到印度，扫描扇面可达240°，中国正好在这个覆盖区域的重点监控范围内。这部雷达的性能相当出众，被俄方赞许为太空中“一个足球大小的目标”都逃不过其追踪。这次“东风-41”试射从发射到变轨段完全都在其监控范围，由此可见其监测结果具备较权威的参考意义。\r\n中国东风41导弹水平究竟有多高？俄将领证实美国反导绝对拦不住\r\n\r\n　　由于中国的核力量并没有美国和俄罗斯那么强大，这两个国家都有7000枚以上的核弹头，并且中国没有高性能的战略核轰炸机和足够数量游弋大洋的弹道导弹核潜艇和潜射导弹，因此中国特别注重发展陆基洲际弹道导弹。也因为如此，中国在陆基弹道导弹的研发上取得了长足的进步，以至于美国现在考虑要承诺“不首先使用核武器”。来源《华盛顿邮报》引用美高层幕僚的爆料称，美国最高统帅计划在本月内做出最终决定：放弃首先对中俄使用核武器打击的权利。源有是美国尽管有7500枚弹头，但是也不确保能够在开战伊始摧毁中、俄的全部核武库，而美国的反导系统在面对类似于中国“东风-41”这类具备较强突防能力的洲际弹道导弹面前并不能做到有效拦截。\r\n中国东风41导弹水平究竟有多高？俄将领证实美国反导绝对拦不住\r\n\r\n　　美国目前对于拦截东风-41是头痛的，因为这种导弹能够携带最多10枚核弹头，并且解放军的火箭军会在导弹上加装突防装置使得美国反导系统无所适从。这意味着中国东风-41发射的每一枚核弹头都有独立的飞行弹道，可以自行调整轨迹攻击不同目标。美方的表态和俄罗斯的监控结果是相互印证的，证明中国的“东风-41”弹道导弹确实具备了出色的分导多弹头打击能力。按照美国反导系统目前0.3的拦截概率计算，为了拦击一枚“东风-41”弹道导弹上的10个分导弹头，美国至少要发射30到40枚拦截弹才能够确保拦截，已经让美国的反导拦截系统处于过饱和状态了。也就是说仅仅发射2枚“东风-41”导弹，美国的反导系统就会顾此失彼丧失对全部弹头的拦截能力。如果美国要继续扩建反导系统，成本上率先是美国无法承受，现有的200亿美元的预算需要成倍增加，这也迫使美国要放弃首先使用核武器的一个动因，运营成本确实太高了。（作者署名：无名高地）\r\n\r\n　　本栏目所有文章目的在于传递更多信息，并不代表本网赞同其观点和对其真实性负责。凡本网注明版权所有的作品，版权均属于新浪网，凡署名作者的，版权则属原作者或出版人所有，未经本网或作者授权不得转载、摘编或利用其它方式使用上述作品。\r\n\r\n　　新浪军事：最多军迷首选的军事门户！\r\n', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('asdadadad', '解放军火箭炮精度堪比导弹 命中直径30米靶标', '近日，央视新闻节目报道了西藏军区某炮兵团远火分队近日进行实战化条件下的综合演练，在确定目标信息后，远火分队18分钟内就完成了远程目标精确打击。首轮打击，直径30公里外的预定目标被成功摧毁。（环球网）', '2016-07-21 18:13:33', '2016-07-21 18:13:35', '0', '1');
INSERT INTO `officialwebsite_service` VALUES ('asdas465d4a65d4sa65', '经纪人:登巴巴或明年3月重返赛场 会更加强大', '新浪体育讯　　北京时间7月21日消息，上海申花外援登巴巴在中超联赛第17轮的上海德比中左小腿骨折，重伤离场，他的职业生涯是否会就此终结呢？如果登巴巴恢复的话需要多长时间呢？据《雅虎体育》报道，登巴巴的经纪人亚历山大-龚特翰在接受采访时表示登巴巴在10年前胫骨也有过同样的创伤，他并不担心，登巴巴重返赛场后会变得更加强大。相信登巴巴会在明年3月复出，随上海申花征战2017赛季的比赛。上帝会给予登巴巴力量，帮助他重返球场。\r\n\r\n　　北京时间7月17日19点35分，2016赛季中超联赛第17轮在上海虹口体育场展开一场较量，上海申花主场2-1逆转战胜上海上港。第63分钟，登巴巴拼抢中左小腿骨折变形，重伤离场。上海申花主教练曼萨诺称这次受伤可能会让登巴巴的职业生涯终结。登巴巴的伤情让很多球迷为之担心。不过，无论是登巴巴本人还是登巴巴的经纪人亚历山大-龚特翰都对登巴巴重返赛场充满信心。登巴巴表示：“这真的是一次严重的受伤，但我相信我一定能够克服。我的职业生涯还没有结束，这是肯定的。”\r\n\r\n　　在谈到这次受伤时，登巴巴的经纪人亚历山大-龚特翰表示：“现在，登巴巴已经感觉好些了，他已经意识到了这个问题。他十年前胫骨也受过伤，他并不担心，他只是需要时间来恢复，并且他回来之后会比以前更加强大。”\r\n\r\n　　亚历山大-龚特翰还表示登巴巴会在本周五上午做手术，相信登巴巴能在明年3月新赛季开始的时候复出，并对上海申花给予登巴巴无微不至的关照表示感谢，“本周五的上午会由法国的外科医生来做手术，我们相信并且希望登巴巴能够在明年3月、上海申花下赛季开始的时候复出。（上海申花）俱乐部竭尽所能的关照登巴巴，我们感谢他们。”\r\n\r\n　　亚历山大-龚特翰还表示登巴巴的意志力坚若磐石，上帝会帮助他重返球场，“他就像磐石一样坚强，人生有很多种方式可以考验一个人的意志。上帝会予登巴巴力量，帮助他重返球场。”\r\n\r\n　　本赛季，登巴巴个人状态极佳，目前以14个进球领跑中超射手榜。原本是本赛季中超联赛金靴的第一热门，但由于遭遇重伤，登巴巴很可能无缘这项荣誉。不过，能否夺得中超金靴相对于登巴巴的恢复来说并不重要，我们一起期待登巴巴重返赛场的那一天！\r\n\r\n　　（李哲）', '2016-07-21 18:13:33', '2016-07-06 18:13:35', '0', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `carId` varchar(36) NOT NULL,
  `rentCarUserId` varchar(36) DEFAULT NULL,
  `submitTime` datetime NOT NULL,
  `getCarAddress` varchar(255) NOT NULL,
  `returnCarAddress` varchar(255) NOT NULL,
  `getCarTime` datetime NOT NULL,
  `returnCarTime` datetime NOT NULL,
  `status` int(10) NOT NULL,
  `realGetCarTime` datetime DEFAULT NULL,
  `realReturnCarTime` datetime DEFAULT NULL,
  `realGetCarAddress` varchar(255) DEFAULT NULL,
  `realReturnCarAddress` varchar(255) DEFAULT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `userNote` varchar(255) DEFAULT NULL,
  `adminNote` varchar(255) DEFAULT NULL,
  `carPrice` double NOT NULL,
  `rentDayNumber` int(11) NOT NULL,
  `totalPrice` double(255,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_userPhone` (`userId`),
  KEY `order_rentCarUserId` (`rentCarUserId`),
  KEY `orders_carId` (`carId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`carId`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`rentCarUserId`) REFERENCES `rentcarusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('07a0137c-7818-4ed2-b167-c95576b4948d', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '91bc49f4-b39a-44ed-8236-9a7a73b54835', null, '2016-09-18 11:34:30', '中国/湖南/湖南市中店', '中国/湖南/张家界/张家界店铺', '2016-09-18 00:00:00', '2016-09-19 00:00:00', '-1', null, null, null, null, '0', null, null, '201', '1', '313');
INSERT INTO `orders` VALUES ('1258baa7-376c-4380-a3a7-0eb6ab726b88', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '91bc49f4-b39a-44ed-8236-9a7a73b54835', null, '2016-09-16 12:17:33', '中国/湖南/湖南市中店', '中国/湖南/张家界/张家界店铺', '2016-09-16 00:00:00', '2016-09-22 01:00:00', '0', null, null, null, null, '0', null, null, '201', '6', '1318');
INSERT INTO `orders` VALUES ('25ff7628-0de5-463f-9d9a-b647596161d2', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '892c11f1-b266-4178-b4e7-da1857ac31df', null, '2016-07-13 16:04:28', '中国/湖南/张家界/张家界店铺', '中国/四川/眉山/彭山/彭山东店', '2016-07-13 20:02:53', '2016-07-15 20:02:53', '1', '2016-07-13 20:02:53', null, '中国/湖南/张家界/张家界技术', null, '0', null, null, '991', '2', '2002');
INSERT INTO `orders` VALUES ('4534c035-bfdb-4aef-97e7-c99ca1e8fe91', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '91bc49f4-b39a-44ed-8236-9a7a73b54835', null, '2016-09-18 12:07:16', '中国/湖南/湖南市中店', '中国/湖南/张家界/张家界店铺', '2016-09-20 14:00:05', '2016-09-22 15:00:07', '0', null, null, null, null, '0', null, null, '201', '2', '514');
INSERT INTO `orders` VALUES ('5294e2c7-8992-4934-ac82-1ff39384cdab', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '91bc49f4-b39a-44ed-8236-9a7a73b54835', null, '2016-07-13 13:03:04', '中国/四川/眉山/彭山/彭山东店', '中国/四川/眉山/彭山/彭山东店', '2016-07-13 17:02:30', '2016-07-15 17:02:30', '2', '2016-07-13 17:02:30', '2016-07-15 17:02:30', '中国/四川/眉山/彭山/彭山东店', '中国/四川/眉山/彭山/彭山东店', '0', null, null, '201', '2', '422');
INSERT INTO `orders` VALUES ('85745882-78f1-4dab-bcea-f629d2e22b20', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '91bc49f4-b39a-44ed-8236-9a7a73b54835', null, '2016-09-18 11:50:21', '中国/湖南/湖南市中店', '中国/湖南/张家界/张家界店铺', '2016-09-18 00:00:00', '2016-09-20 00:00:00', '0', null, null, null, null, '0', null, null, '201', '2', '514');
INSERT INTO `orders` VALUES ('8e0000c1-ab12-4d98-9cd3-e2e6ca67e0db', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2544b53a-a3ca-4859-b840-f4093779f372', null, '2016-08-25 16:28:09', '中国/四川/眉山/彭山/彭山东店', '中国/眉山/彭山/彭山东店', '2016-08-25 00:00:00', '2016-08-26 00:00:00', '0', null, null, null, null, '0', null, null, '123', '1', '195');
INSERT INTO `orders` VALUES ('99b354f0-830e-43ac-85d4-19b911bd9bf8', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '892c11f1-b266-4178-b4e7-da1857ac31df', null, '2016-08-27 14:44:36', '中国/四川/眉山/彭山/彭山东店', '中国/张家界/张家界店铺', '2016-08-27 00:00:00', '2016-08-31 00:00:00', '0', null, null, null, null, '0', null, null, '991', '4', '4156');
INSERT INTO `orders` VALUES ('cd6eb8c0-44d8-4316-a1d4-8387d2c5c70a', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '892c11f1-b266-4178-b4e7-da1857ac31df', null, '2016-07-17 10:29:53', '中国/四川/眉山/彭山/彭山东店', '中国/四川/眉山/彭山/彭山东店', '2016-07-17 14:22:40', '2016-07-19 14:22:40', '0', null, null, null, null, '0', null, null, '991', '2', '1982');
INSERT INTO `orders` VALUES ('d2d9f237-6af0-4c89-a8a3-a2340419a552', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '892c11f1-b266-4178-b4e7-da1857ac31df', null, '2016-08-27 16:55:05', '中国/四川/眉山/彭山/彭山东店', '中国/张家界/张家界店铺', '2016-08-27 19:00:45', '2016-08-31 18:00:47', '0', null, null, null, null, '0', null, null, '991', '3', '3125');
INSERT INTO `orders` VALUES ('d50756d7-4b9c-429f-bc0d-bff7f2dc5613', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '892c11f1-b266-4178-b4e7-da1857ac31df', null, '2016-08-27 16:42:26', '中国/四川/眉山/彭山/彭山东店', '中国/张家界/张家界店铺', '2016-08-27 00:00:00', '2016-08-31 00:00:00', '0', null, null, null, null, '0', null, null, '991', '4', '4156');
INSERT INTO `orders` VALUES ('f7747ecf-4898-4ad1-9e63-a44f897ba86b', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '6ec26ebf-1160-41f9-8556-df0476e2ebdd', null, '2016-08-27 14:51:32', '中国/四川/眉山/彭山/彭山东店', '中国/张家界/张家界店铺', '2016-08-27 00:00:00', '2016-08-31 00:00:00', '-1', null, null, null, null, '0', null, null, '991', '4', '4156');
INSERT INTO `orders` VALUES ('fd80c3f1-5119-41c1-912d-6be923e07ffa', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '91bc49f4-b39a-44ed-8236-9a7a73b54835', null, '2016-09-18 11:37:14', '中国/湖南/湖南市中店', '中国/湖南/张家界/张家界店铺', '2016-09-20 00:00:00', '2016-09-20 00:00:00', '0', null, null, null, null, '0', null, null, '201', '1', '313');

-- ----------------------------
-- Table structure for powers
-- ----------------------------
DROP TABLE IF EXISTS `powers`;
CREATE TABLE `powers` (
  `id` varchar(36) NOT NULL,
  `parentId` varchar(36) DEFAULT NULL,
  `text` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `status` int(1) NOT NULL COMMENT '1代表是权限，非1代表非权限（树节点）',
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forkey_p_i_d` (`parentId`),
  CONSTRAINT `forkey_p_i_d` FOREIGN KEY (`parentId`) REFERENCES `powers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of powers
-- ----------------------------
INSERT INTO `powers` VALUES ('100', '999', '订单权限', null, null, '2016-07-11 12:44:23', '0', '0');
INSERT INTO `powers` VALUES ('1000', '999', '字典管理权限', null, null, '2016-07-12 10:55:15', '0', '0');
INSERT INTO `powers` VALUES ('1001', '1000', '增加字典', null, null, '2016-07-12 10:55:33', '1', '0');
INSERT INTO `powers` VALUES ('1002', '1000', '删除字典', null, null, '2016-07-12 10:56:03', '1', '0');
INSERT INTO `powers` VALUES ('1003', '1000', '查看字典', null, null, '2016-07-12 10:56:36', '1', '0');
INSERT INTO `powers` VALUES ('1004', '1000', '修改字典', null, null, '2016-07-12 10:56:47', '1', '0');
INSERT INTO `powers` VALUES ('101', '100', '订单查询', null, null, '2016-07-11 12:46:19', '1', '0');
INSERT INTO `powers` VALUES ('102', '100', '订单修改', null, null, '2016-07-11 15:11:15', '1', '0');
INSERT INTO `powers` VALUES ('1100', '999', '官网管理权限', null, null, '2016-10-15 17:06:58', '0', '0');
INSERT INTO `powers` VALUES ('1101', '1100', '增加成员', null, null, '2016-10-15 17:07:34', '1', '0');
INSERT INTO `powers` VALUES ('1102', '1100', '删除成员', null, null, '2016-10-15 17:07:56', '1', '0');
INSERT INTO `powers` VALUES ('1103', '1100', '查看成员', null, null, '2016-10-15 17:08:22', '1', '0');
INSERT INTO `powers` VALUES ('1104', '1100', '修改成员', null, null, '2016-10-15 17:08:44', '1', '0');
INSERT INTO `powers` VALUES ('1200', '999', '官网轮播管理权限', null, null, '2016-10-15 18:06:30', '0', '0');
INSERT INTO `powers` VALUES ('1201', '1200', '增加轮播', null, null, '2016-10-15 18:07:03', '1', '0');
INSERT INTO `powers` VALUES ('1202', '1200', '删除轮播', null, null, '2016-10-15 18:07:31', '1', '0');
INSERT INTO `powers` VALUES ('1203', '1200', '查找轮播', null, null, '2016-10-15 18:07:47', '1', '0');
INSERT INTO `powers` VALUES ('1204', '1200', '修改轮播', null, null, '2016-10-15 18:08:06', '1', '0');
INSERT INTO `powers` VALUES ('1300', '999', '官网用户意见权限', null, null, '2016-10-15 18:08:36', '0', '0');
INSERT INTO `powers` VALUES ('1301', '1300', '增加用户意见', null, null, '2016-10-15 18:09:05', '1', '0');
INSERT INTO `powers` VALUES ('1302', '1300', '删除用户权限', null, null, '2016-10-15 18:09:22', '1', '0');
INSERT INTO `powers` VALUES ('1303', '1300', '查找用户意见', null, null, '2016-10-15 18:09:42', '1', '0');
INSERT INTO `powers` VALUES ('1304', '1300', '修改用户权限', null, null, '2016-10-15 18:10:01', '1', '0');
INSERT INTO `powers` VALUES ('1400', '999', '新闻管理权限', null, null, '2016-10-15 18:10:29', '0', '0');
INSERT INTO `powers` VALUES ('1401', '1400', '增加乐闻', null, null, '2016-10-15 18:10:46', '1', '0');
INSERT INTO `powers` VALUES ('1402', '1400', '删除新闻', null, null, '2016-10-15 18:11:02', '1', '0');
INSERT INTO `powers` VALUES ('1403', '1400', '查看新闻', null, null, '2016-10-15 18:11:22', '1', '0');
INSERT INTO `powers` VALUES ('1404', '1400', '修改新闻', null, null, '2016-10-15 18:11:35', '1', '0');
INSERT INTO `powers` VALUES ('1500', '999', '官网日常管理权限', null, null, '2016-10-15 18:12:07', '0', '0');
INSERT INTO `powers` VALUES ('1501', '1500', '增加日常', null, null, '2016-10-15 18:12:26', '1', '0');
INSERT INTO `powers` VALUES ('1502', '1500', '删除日常', null, null, '2016-10-15 18:12:44', '1', '0');
INSERT INTO `powers` VALUES ('1503', '1500', '查看日常', null, null, '2016-10-15 18:12:59', '1', '0');
INSERT INTO `powers` VALUES ('1504', '1500', '修改日常', null, null, '2016-10-15 18:13:13', '1', '0');
INSERT INTO `powers` VALUES ('1600', '999', '官网业务管理权限', null, null, '2016-10-15 18:15:02', '0', '0');
INSERT INTO `powers` VALUES ('1601', '1600', '增加业务', null, null, '2016-10-15 18:15:19', '1', '0');
INSERT INTO `powers` VALUES ('1602', '1600', '删除业务', null, null, '2016-10-15 18:15:34', '1', '0');
INSERT INTO `powers` VALUES ('1603', '1600', '查看业务', null, null, '2016-10-15 18:15:52', '1', '0');
INSERT INTO `powers` VALUES ('1604', '1600', '修改业务', null, null, '2016-10-15 18:16:13', '1', '0');
INSERT INTO `powers` VALUES ('1700', '999', '景区介绍管理权限', null, null, '2016-10-15 18:16:46', '0', '0');
INSERT INTO `powers` VALUES ('1701', '1700', '增加景区介绍', null, null, '2016-10-15 18:17:04', '1', '0');
INSERT INTO `powers` VALUES ('1702', '1700', '删除景区介绍', null, null, '2016-10-15 18:17:28', '1', '0');
INSERT INTO `powers` VALUES ('1703', '1700', '查看景区介绍', null, null, '2016-10-15 18:17:58', '1', '0');
INSERT INTO `powers` VALUES ('1704', '1700', '修改景区介绍', null, null, '2016-10-15 18:18:20', '1', '0');
INSERT INTO `powers` VALUES ('1800', '999', '景区列表', null, null, '2016-10-15 18:18:47', '0', '0');
INSERT INTO `powers` VALUES ('1801', '1800', '增加景区列表', null, null, '2016-10-15 18:19:06', '1', '0');
INSERT INTO `powers` VALUES ('1802', '1800', '删除景区列表', null, null, '2016-10-15 18:19:23', '1', '0');
INSERT INTO `powers` VALUES ('1803', '1800', '查看景区列列表', null, null, '2016-10-15 18:19:49', '1', '0');
INSERT INTO `powers` VALUES ('1804', '1800', '修改景区列列表', null, null, '2016-10-15 18:20:08', '1', '0');
INSERT INTO `powers` VALUES ('1900', '999', '景区门票订单管理权限', null, null, '2016-10-15 18:20:42', '0', '0');
INSERT INTO `powers` VALUES ('1901', '1900', '增加景区门票订单', null, null, '2016-10-15 18:21:01', '1', '0');
INSERT INTO `powers` VALUES ('1902', '1900', '删除景区门票订单', null, null, '2016-10-15 18:21:24', '1', '0');
INSERT INTO `powers` VALUES ('1903', '1900', '查看景区门票订单', null, null, '2016-10-15 18:22:40', '1', '0');
INSERT INTO `powers` VALUES ('1904', '1900', '修改景区门票订单', null, null, '2016-10-15 18:23:03', '1', '0');
INSERT INTO `powers` VALUES ('200', '999', '管理员权限', null, null, '2016-07-11 15:14:50', '0', '0');
INSERT INTO `powers` VALUES ('2000', '999', '景点门票列表管理权限', null, null, '2016-10-15 18:24:10', '0', '0');
INSERT INTO `powers` VALUES ('2001', '2000', '增加景区门票', null, null, '2016-10-15 18:24:55', '1', '0');
INSERT INTO `powers` VALUES ('2002', '2000', '删除景区门票', null, null, '2016-10-15 18:25:11', '1', '0');
INSERT INTO `powers` VALUES ('2003', '2000', '查看景区门票', null, null, '2016-10-15 18:25:26', '1', '0');
INSERT INTO `powers` VALUES ('2004', '2000', '修改景区门票', null, null, '2016-10-15 18:25:47', '1', '0');
INSERT INTO `powers` VALUES ('201', '200', '删除管理员', null, null, '2016-07-11 15:15:23', '1', '0');
INSERT INTO `powers` VALUES ('202', '200', '增加管理员', null, null, '2016-07-11 15:15:07', '1', '0');
INSERT INTO `powers` VALUES ('203', '200', '查看管理员', null, null, '2016-07-11 15:15:38', '1', '0');
INSERT INTO `powers` VALUES ('204', '200', '修改管理员', null, null, '2016-07-11 15:15:53', '1', '0');
INSERT INTO `powers` VALUES ('2100', '999', '景区轮播', null, null, '2016-10-15 18:26:08', '0', '0');
INSERT INTO `powers` VALUES ('2101', '2100', '增加景区轮播', null, null, '2016-10-15 18:26:25', '1', '0');
INSERT INTO `powers` VALUES ('2102', '2100', '删除景区轮播', null, null, '2016-10-15 18:26:45', '1', '0');
INSERT INTO `powers` VALUES ('2103', '2100', '查看景区轮播', null, null, '2016-10-15 18:27:02', '1', '0');
INSERT INTO `powers` VALUES ('2104', '2100', '修改景区轮播', null, null, '2016-10-15 18:27:22', '1', '0');
INSERT INTO `powers` VALUES ('300', '999', '用户管理权限', null, null, '2016-07-11 15:16:57', '0', '0');
INSERT INTO `powers` VALUES ('301', '300', '查看用户', null, null, '2016-07-11 15:17:14', '1', '0');
INSERT INTO `powers` VALUES ('302', '300', '删除用户', null, null, '2016-07-11 15:17:37', '1', '0');
INSERT INTO `powers` VALUES ('303', '300', '增加用户', null, null, '2016-07-11 15:17:51', '1', '0');
INSERT INTO `powers` VALUES ('304', '300', '修改用户', null, null, '2016-07-11 15:18:03', '1', '0');
INSERT INTO `powers` VALUES ('400', '999', '公告管理权限', null, null, '2016-07-11 15:20:15', '0', '0');
INSERT INTO `powers` VALUES ('401', '400', '增加公告', null, null, '2016-07-11 15:24:03', '1', '0');
INSERT INTO `powers` VALUES ('402', '400', '删除公告', null, null, '2016-07-11 15:24:17', '1', '0');
INSERT INTO `powers` VALUES ('403', '400', '修改公告', null, null, '2016-07-11 15:24:32', '1', '0');
INSERT INTO `powers` VALUES ('404', '400', '查看公告', null, null, '2016-07-11 15:23:40', '1', '0');
INSERT INTO `powers` VALUES ('500', '999', '租车费用管理权限', null, null, '2016-07-11 15:27:03', '0', '0');
INSERT INTO `powers` VALUES ('501', '500', '增加租车费用', null, null, '2016-07-11 15:27:21', '1', '0');
INSERT INTO `powers` VALUES ('502', '500', '删除租车费用', null, null, '2016-07-11 15:27:39', '1', '0');
INSERT INTO `powers` VALUES ('503', '500', '查看租车费用', null, null, '2016-07-11 15:28:01', '1', '0');
INSERT INTO `powers` VALUES ('504', '500', '修改租车费用', null, null, '2016-07-11 15:28:29', '1', '0');
INSERT INTO `powers` VALUES ('600', '999', '首页汽车推荐权限', null, null, '2016-07-11 15:29:23', '0', '0');
INSERT INTO `powers` VALUES ('601', '600', '增加汽车推荐', null, null, '2016-07-11 15:29:47', '1', '0');
INSERT INTO `powers` VALUES ('602', '600', '删除汽车推荐', null, null, '2016-07-11 15:30:03', '1', '0');
INSERT INTO `powers` VALUES ('603', '600', '查看汽车推荐', null, null, '2016-07-11 15:30:19', '1', '0');
INSERT INTO `powers` VALUES ('604', '600', '修改汽车推荐', null, null, '2016-07-11 15:30:43', '1', '0');
INSERT INTO `powers` VALUES ('700', '999', '首页轮播管理权限', null, null, '2016-07-11 15:33:32', '0', '0');
INSERT INTO `powers` VALUES ('701', '700', '查看首页轮播', null, null, '2016-07-11 15:33:54', '1', '0');
INSERT INTO `powers` VALUES ('702', '700', '删除首页轮播', null, null, '2016-07-11 15:34:09', '1', '0');
INSERT INTO `powers` VALUES ('703', '700', '修改首页轮播', null, null, '2016-07-11 15:34:23', '1', '0');
INSERT INTO `powers` VALUES ('704', '700', '增加首页轮播', null, null, '2016-07-11 15:34:42', '1', '0');
INSERT INTO `powers` VALUES ('800', '999', '日志管理权限', null, null, '2016-07-11 15:35:41', '0', '0');
INSERT INTO `powers` VALUES ('801', '800', '查看管理员登陆日志', null, null, '2016-07-11 15:36:28', '1', '0');
INSERT INTO `powers` VALUES ('802', '800', '查看管理员更新日志', null, null, '2016-07-11 15:36:59', '1', '0');
INSERT INTO `powers` VALUES ('803', '800', '查看用户登录日志', null, null, '2016-07-11 15:37:32', '1', '0');
INSERT INTO `powers` VALUES ('804', '800', '查看用户更新日志', null, null, '2016-07-11 15:37:52', '1', '0');
INSERT INTO `powers` VALUES ('900', '999', '汽车管理权限', null, null, '2016-08-27 12:40:30', '0', '0');
INSERT INTO `powers` VALUES ('901', '900', '增加汽车', null, null, '2016-07-11 12:42:28', '1', '0');
INSERT INTO `powers` VALUES ('902', '900', '删除汽车', null, null, '2016-07-11 12:41:46', '1', '0');
INSERT INTO `powers` VALUES ('903', '900', '查看汽车', null, null, '2016-07-11 12:29:08', '1', '0');
INSERT INTO `powers` VALUES ('904', '900', '修改汽车', null, null, '2016-07-11 12:40:54', '1', '0');
INSERT INTO `powers` VALUES ('999', null, '全部权限', null, null, '2016-07-11 12:45:34', '0', '0');

-- ----------------------------
-- Table structure for recommendcars
-- ----------------------------
DROP TABLE IF EXISTS `recommendcars`;
CREATE TABLE `recommendcars` (
  `id` varchar(36) NOT NULL,
  `carId` varchar(36) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forkey_car_Id` (`carId`) USING BTREE,
  CONSTRAINT `forkey_car_Id` FOREIGN KEY (`carId`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommendcars
-- ----------------------------
INSERT INTO `recommendcars` VALUES ('0d3cd947-4270-435d-9018-975157928e93', '91bc49f4-b39a-44ed-8236-9a7a73b54835', '', '2016-10-13 14:06:02');
INSERT INTO `recommendcars` VALUES ('1c926077-20d7-4aea-8a2a-03e73a07aa10', '2544b53a-a3ca-4859-b840-f4093779f372', '', '2016-10-17 21:54:03');
INSERT INTO `recommendcars` VALUES ('3873346a-39f5-4c0f-8dd1-4fa86e4b0a21', '892c11f1-b266-4178-b4e7-da1857ac31df', '', '2016-07-13 21:24:13');
INSERT INTO `recommendcars` VALUES ('87348b42-27c3-422b-a17f-335d3947c88c', '6ec26ebf-1160-41f9-8556-df0476e2ebdd', '', '2016-10-17 21:54:11');
INSERT INTO `recommendcars` VALUES ('cf512c7d-25dc-4ac5-9a47-0d7d159eecca', '23cfeec7-7d7a-4eae-ac24-0f48c5bbdb7c', '', '2016-10-17 21:53:56');

-- ----------------------------
-- Table structure for rentcarcost
-- ----------------------------
DROP TABLE IF EXISTS `rentcarcost`;
CREATE TABLE `rentcarcost` (
  `id` varchar(36) NOT NULL,
  `orderId` varchar(36) NOT NULL,
  `costId` varchar(36) NOT NULL,
  `number` int(11) NOT NULL,
  `price` double NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rentcarcostId` (`costId`),
  KEY `forkey_order_id` (`orderId`),
  CONSTRAINT `forkey_cost_id` FOREIGN KEY (`costId`) REFERENCES `cost` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `forkey_order_id` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rentcarcost
-- ----------------------------

-- ----------------------------
-- Table structure for rentcarusers
-- ----------------------------
DROP TABLE IF EXISTS `rentcarusers`;
CREATE TABLE `rentcarusers` (
  `id` varchar(36) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `realName` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cardClazz` varchar(255) NOT NULL,
  `cardNumber` varchar(255) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `getCarsUsers_cardClazz` (`cardClazz`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rentcarusers
-- ----------------------------
INSERT INTO `rentcarusers` VALUES ('0cedfb18-921f-43bf-b7b3-e23ae4f67cb3', '18874490135', 'zk', '1138829222@qq.com', '身份证', '513823199512171930', '0');

-- ----------------------------
-- Table structure for systemddl
-- ----------------------------
DROP TABLE IF EXISTS `systemddl`;
CREATE TABLE `systemddl` (
  `id` varchar(36) NOT NULL,
  `iconCls` varchar(50) DEFAULT NULL,
  `text` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parentId` varchar(36) DEFAULT NULL,
  `currtHigh` int(255) NOT NULL COMMENT '当前的节点深度，以根结点为参考，根节点为0',
  `high` int(255) NOT NULL COMMENT '从根节点开始的深度，根节点为0，子节点不断累加',
  PRIMARY KEY (`id`),
  KEY `forkey_P_id` (`parentId`),
  CONSTRAINT `forkey_P_id` FOREIGN KEY (`parentId`) REFERENCES `systemddl` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemddl
-- ----------------------------
INSERT INTO `systemddl` VALUES ('0', null, '性别', null, 'root', '1', '2');
INSERT INTO `systemddl` VALUES ('001', null, '女', null, '0', '2', '2');
INSERT INTO `systemddl` VALUES ('002', null, '男', null, '0', '2', '2');
INSERT INTO `systemddl` VALUES ('0167e4f8-aaf4-472a-a38d-ac5822b3151a', null, '长沙', null, '183580fa-f03c-4a0a-8cdb-e7d6695d08cc', '4', '5');
INSERT INTO `systemddl` VALUES ('02cf23d5-5eeb-4b56-a9c1-fd256db3ec44', null, '小型车', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('06d4f320-91e9-4bf7-b4ea-d2af5f423a57', null, '高级车型', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('071369e6-61a7-4733-a3cf-04ec955847b2', null, '张家界', null, '10102', '4', '6');
INSERT INTO `systemddl` VALUES ('0bfa2d35-4e7c-45ca-aa3d-92f1b50102cf', null, '莲花', null, '10103', '4', '6');
INSERT INTO `systemddl` VALUES ('1', null, '店铺地址', null, 'root', '1', '6');
INSERT INTO `systemddl` VALUES ('10', '', '支付方式', '', 'root', '1', '2');
INSERT INTO `systemddl` VALUES ('101', null, '中国', null, '1', '2', '6');
INSERT INTO `systemddl` VALUES ('10101', null, '四川', null, '101', '3', '6');
INSERT INTO `systemddl` VALUES ('1010101', null, '眉山', null, '10101', '4', '6');
INSERT INTO `systemddl` VALUES ('101010101', null, '彭山', null, '1010101', '5', '6');
INSERT INTO `systemddl` VALUES ('10101010101', null, '彭山东店', null, '101010101', '6', '6');
INSERT INTO `systemddl` VALUES ('10101010102', null, '彭山南店', null, '101010101', '6', '6');
INSERT INTO `systemddl` VALUES ('101010102', '', '丹棱', '', '1010101', '5', '6');
INSERT INTO `systemddl` VALUES ('1010102', null, '资阳', null, '10101', '5', '6');
INSERT INTO `systemddl` VALUES ('10102', '', '湖南', '', '101', '3', '6');
INSERT INTO `systemddl` VALUES ('10103', '', '台湾', '', '101', '3', '6');
INSERT INTO `systemddl` VALUES ('13db9b7c-abae-478f-9c61-5b5bebfed9c4', null, '奥尔良', null, '64b7f6fb-2ac9-4713-b4ed-54aadf20cbe8', '3', '6');
INSERT INTO `systemddl` VALUES ('1549b57b-adbf-4e23-bcc6-31a7c2c4d51b', null, 'SUV等车型', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('178e341d-66d8-4412-a4c7-7cc9207501a5', null, '豪华车型', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('183580fa-f03c-4a0a-8cdb-e7d6695d08cc', null, '湖南', null, '9a0e05a3-3067-4c63-bd1a-c7487efb108e', '3', '5');
INSERT INTO `systemddl` VALUES ('1ab78046-c3dc-464e-b1e7-1bc0d98077e1', null, '龙山东店', null, '886f706f-34e7-41cc-a1c8-3c255b50bef4', '6', '6');
INSERT INTO `systemddl` VALUES ('1ae930b7-d438-4e72-8bb2-5416e980444a', null, '新竹', null, '10103', '4', '6');
INSERT INTO `systemddl` VALUES ('2', null, '车辆品牌', null, 'root', '1', '2');
INSERT INTO `systemddl` VALUES ('24e70a7b-729f-406e-8565-fb7cf98efac8', null, '三厢车型', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('2ba2e116-4e89-4d27-bff2-90d54af26578', null, '3A', null, '8', '2', '2');
INSERT INTO `systemddl` VALUES ('2f91af0d-56fb-406d-9867-edcf7e761e07', null, '门票', null, '7', '2', '2');
INSERT INTO `systemddl` VALUES ('3', null, '车型', null, 'root', '1', '2');
INSERT INTO `systemddl` VALUES ('336390a6-da2c-4873-bbf1-e4d35e2c7cde', null, '临时身份证', null, '4', '2', '2');
INSERT INTO `systemddl` VALUES ('38fcf45e-172a-4f90-92f1-beb650f25d13', null, '湖南市中店', null, '10102', '4', '6');
INSERT INTO `systemddl` VALUES ('395a827a-73f6-4b8b-aae0-3a872d04e6cd', null, '名胜古迹', null, '9', '2', '2');
INSERT INTO `systemddl` VALUES ('4', null, '证件类型', null, 'root', '1', '2');
INSERT INTO `systemddl` VALUES ('42bf4483-3520-4404-858d-74a7fa7d05c6', null, '吉首', null, '183580fa-f03c-4a0a-8cdb-e7d6695d08cc', '4', '5');
INSERT INTO `systemddl` VALUES ('4cc91393-f134-4e06-b95b-f265d92e2b65', null, '紧凑车型', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('5', null, '景点地址', null, 'root', '1', '5');
INSERT INTO `systemddl` VALUES ('5896e60c-5596-4c60-9e15-a2b94c2cc442', null, '4A', null, '8', '2', '2');
INSERT INTO `systemddl` VALUES ('6', null, '景点票型', null, 'root', '1', '2');
INSERT INTO `systemddl` VALUES ('64b7f6fb-2ac9-4713-b4ed-54aadf20cbe8', null, '美国', null, '1', '2', '6');
INSERT INTO `systemddl` VALUES ('6572fea7-1f33-4598-9d6b-05a852761990', null, '成人票', null, '6', '2', '2');
INSERT INTO `systemddl` VALUES ('675b5f46-c3ab-46a9-b7e4-38109a022f2c', null, '张家界店铺', null, '071369e6-61a7-4733-a3cf-04ec955847b2', '5', '6');
INSERT INTO `systemddl` VALUES ('7', null, '景点票种', null, 'root', '1', '2');
INSERT INTO `systemddl` VALUES ('7ef4c3b4-b41a-46af-912c-5b19072927bb', null, '在线支付', null, '10', '2', '2');
INSERT INTO `systemddl` VALUES ('8', '', '景区等级', '', 'root', '1', '2');
INSERT INTO `systemddl` VALUES ('86a49d21-9374-4177-88dd-cda5ad13f9b2', null, '山水风光', null, '9', '2', '2');
INSERT INTO `systemddl` VALUES ('886f706f-34e7-41cc-a1c8-3c255b50bef4', null, '龙山', null, 'f1f6dc6b-4e57-45a7-a49b-62985d760a09', '5', '6');
INSERT INTO `systemddl` VALUES ('9', '', '景区风格', '', 'root', '1', '2');
INSERT INTO `systemddl` VALUES ('9a0e05a3-3067-4c63-bd1a-c7487efb108e', null, '中国', null, '5', '2', '5');
INSERT INTO `systemddl` VALUES ('9ab96ef1-de0e-4367-b449-2c0ec35b7241', null, '华盛顿', null, '64b7f6fb-2ac9-4713-b4ed-54aadf20cbe8', '3', '6');
INSERT INTO `systemddl` VALUES ('9c858f70-4e28-4782-8a91-dc649665a040', null, '中等车型', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('9d1c383b-fbb3-43ce-b297-97d92bf96c4d', null, '本田', null, '2', '2', '2');
INSERT INTO `systemddl` VALUES ('9d4c04bc-6aef-4d43-a3de-05cbc046c700', null, '联票', null, '7', '2', '2');
INSERT INTO `systemddl` VALUES ('9f412c3a-6ed7-4d53-bc15-8bebca5129d2', null, '货到付款', null, '10', '2', '2');
INSERT INTO `systemddl` VALUES ('a5964d20-4458-4628-b8b5-58bface5d6be', null, '龙山北店', null, '886f706f-34e7-41cc-a1c8-3c255b50bef4', '6', '6');
INSERT INTO `systemddl` VALUES ('a79290a2-c0cc-4c4e-a2bb-086eed9b0691', null, '5A', null, '8', '2', '2');
INSERT INTO `systemddl` VALUES ('ac0a4368-a576-48da-a0f4-c97f9e79114f', null, '梅赛德斯奔驰', null, '2', '2', '2');
INSERT INTO `systemddl` VALUES ('b88fd9ce-8b0f-41af-b5c9-c2f5d64b11fc', null, '一汽', null, '2', '2', '2');
INSERT INTO `systemddl` VALUES ('bacf1f80-aa21-4397-8bc5-dcbe7fee6060', null, '学生票', null, '6', '2', '2');
INSERT INTO `systemddl` VALUES ('c07e5e81-5c29-495b-b5e1-44e8e261100d', null, '护照', null, '4', '2', '2');
INSERT INTO `systemddl` VALUES ('c2f04cdb-e34e-4771-9509-0acd3af87549', null, '微型车', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('d00b0eee-9982-46f2-b453-80215f8eef6e', null, '紧凑车型', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('d2c13794-c2d8-4d7e-b32a-f8103c9bf1a3', null, '奇瑞qq', null, '2', '2', '2');
INSERT INTO `systemddl` VALUES ('d37a455c-9e76-4cf1-88ab-1417092e1e7e', null, '沃尔沃', null, '2', '2', '2');
INSERT INTO `systemddl` VALUES ('d71ee114-4b3f-41b9-9141-53a3405fba5d', null, '户口本', null, '4', '2', '2');
INSERT INTO `systemddl` VALUES ('de911548-58ef-4192-8470-d99c697772da', null, '未知', null, '0', '2', '2');
INSERT INTO `systemddl` VALUES ('e1463b45-b938-4fe5-a564-01e14e347344', null, '洛杉矶', null, '64b7f6fb-2ac9-4713-b4ed-54aadf20cbe8', '3', '6');
INSERT INTO `systemddl` VALUES ('e36b18f1-fe44-4b3e-a000-e4dd26dad650', null, 'CDV车型', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('e518331b-00ab-4798-acf3-95219ddd8a6f', null, '张家界', null, '183580fa-f03c-4a0a-8cdb-e7d6695d08cc', '4', '5');
INSERT INTO `systemddl` VALUES ('e5dfba99-11b6-4730-901d-d8274a0508ff', null, '奥拓', null, '2', '2', '2');
INSERT INTO `systemddl` VALUES ('e731378f-e4cf-4d27-8454-97d275748d9b', null, '成都', null, 'ebd1b950-9608-426e-b5df-0758f60a0bd6', '4', '5');
INSERT INTO `systemddl` VALUES ('e7e2235f-ad9b-442f-9e8c-af599879b5c4', null, '吉利', null, '2', '2', '2');
INSERT INTO `systemddl` VALUES ('ebd1b950-9608-426e-b5df-0758f60a0bd6', null, '四川', null, '9a0e05a3-3067-4c63-bd1a-c7487efb108e', '3', '5');
INSERT INTO `systemddl` VALUES ('eea2ae82-9676-439e-bdea-b6a79cba0e5c', null, '儿童票', null, '6', '2', '2');
INSERT INTO `systemddl` VALUES ('f05cd698-6612-433a-ab7f-80f1017ba92b', null, 'MPV车型', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('f1f6dc6b-4e57-45a7-a49b-62985d760a09', null, '怀化', null, '10102', '4', '6');
INSERT INTO `systemddl` VALUES ('f365a0ef-63ab-4c3b-8e69-b72b7c33301e', null, '丰田', null, '2', '2', '2');
INSERT INTO `systemddl` VALUES ('f3bbccd4-7fc3-45f8-a38a-389feb0d547e', null, '通票', null, '7', '2', '2');
INSERT INTO `systemddl` VALUES ('fad31aa4-712a-45b3-ae1e-ee3e81541b33', null, '身份证', null, '4', '2', '2');
INSERT INTO `systemddl` VALUES ('fc5bcc44-46f4-48e8-bdfe-7e8f5df918c7', null, '奥迪', null, '2', '2', '2');
INSERT INTO `systemddl` VALUES ('fed8d97a-db5f-416a-b670-1b4bb8b80098', null, '房车', null, '3', '2', '2');
INSERT INTO `systemddl` VALUES ('root', null, '字典', null, null, '0', '-1');

-- ----------------------------
-- Table structure for systemddl_bak
-- ----------------------------
DROP TABLE IF EXISTS `systemddl_bak`;
CREATE TABLE `systemddl_bak` (
  `seqID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(20) DEFAULT NULL,
  `ddlCode` int(11) DEFAULT NULL,
  `ddlName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`seqID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemddl_bak
-- ----------------------------
INSERT INTO `systemddl_bak` VALUES ('1', '性别', '1', '男');
INSERT INTO `systemddl_bak` VALUES ('2', '性别', '2', '女');
INSERT INTO `systemddl_bak` VALUES ('3', '星级', '1', '一星级');
INSERT INTO `systemddl_bak` VALUES ('4', '星级', '2', '二星级');
INSERT INTO `systemddl_bak` VALUES ('5', '星级', '3', '三星级');
INSERT INTO `systemddl_bak` VALUES ('6', '星级', '4', '四星级');
INSERT INTO `systemddl_bak` VALUES ('7', '星级', '5', '五星级');
INSERT INTO `systemddl_bak` VALUES ('8', '房间类型', '1', '单人间');
INSERT INTO `systemddl_bak` VALUES ('9', '房间类型', '2', '双人间');
INSERT INTO `systemddl_bak` VALUES ('10', '证件类型', '1', '身份证');
INSERT INTO `systemddl_bak` VALUES ('11', '证件类型', '2', '护照');
INSERT INTO `systemddl_bak` VALUES ('12', '汽车品牌', '1', '本田');
INSERT INTO `systemddl_bak` VALUES ('13', '汽车品牌', '2', '桑塔啦');

-- ----------------------------
-- Table structure for useradvices
-- ----------------------------
DROP TABLE IF EXISTS `useradvices`;
CREATE TABLE `useradvices` (
  `id` varchar(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useradvices
-- ----------------------------

-- ----------------------------
-- Table structure for userloginrecord
-- ----------------------------
DROP TABLE IF EXISTS `userloginrecord`;
CREATE TABLE `userloginrecord` (
  `loginRecordId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `loginTime` datetime NOT NULL,
  `logoffTime` datetime NOT NULL,
  `loginAddress` varchar(255) NOT NULL,
  `loginIP` varchar(255) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`loginRecordId`),
  KEY `aid` (`userId`),
  KEY `adminId` (`userId`),
  CONSTRAINT `userid` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userloginrecord
-- ----------------------------
INSERT INTO `userloginrecord` VALUES ('027c720d-4d7d-47b2-8e2e-b3ad577f5bd4', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-12 10:10:44', '2016-08-12 10:10:44', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('0429302d-ea6c-4ff4-83ae-336b8922a483', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-11 13:07:30', '2016-08-11 13:07:30', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('057245b2-bc5e-4469-8c6c-673a0668ef09', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-13 11:45:50', '2016-08-13 11:46:10', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('063ab9f4-a262-4971-b006-2daa2816034a', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-11 13:16:48', '2016-08-11 13:29:42', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('0f666321-b826-4258-9098-d12479d85340', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-07 20:43:13', '2016-09-07 20:43:13', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('1071ca23-7ea7-4b6f-abc1-b189615e22fa', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-11 13:31:50', '2016-08-11 13:31:50', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('110e7b5a-e6ac-40aa-962b-d227e3c266fc', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-27 18:38:00', '2016-08-27 18:38:00', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('1495936d-b736-4ef1-9735-ab75602693a0', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 11:05:18', '2016-08-08 11:05:18', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('1627a5d4-0a24-490f-ab76-03a06aac71ef', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 11:11:12', '2016-08-08 11:11:12', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('1a279a76-1800-4f0b-a6fe-534e991d3aeb', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-28 22:14:46', '2016-08-28 22:14:46', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('1fe975a3-d0db-4561-a325-f28613ec08c1', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '2016-07-13 13:43:22', '2016-07-13 13:43:22', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('2048200a-3190-4312-8e51-7f81196b75bb', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-11 13:05:40', '2016-08-11 13:10:58', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('255648a7-f232-49f5-992f-f4373d2421b7', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-25 16:27:18', '2016-08-25 16:27:18', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('267093e4-b12c-40db-94d5-f5d7880b20c1', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-16 12:17:06', '2016-09-16 12:17:06', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('2832167a-6664-49c6-86e5-7988f24bd5dd', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '2016-07-13 16:01:45', '2016-07-13 16:01:45', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('2bd5dc66-b471-4d5f-9b4f-73f9ce3b211f', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-27 12:08:02', '2016-08-27 12:08:02', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('2c97d985-b9e6-4b14-a005-0f6c40f76fb2', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-10-16 16:51:43', '2016-10-16 16:51:43', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('341fd053-9338-4985-bfc1-4d742a8537a2', '0d98150a-6076-431c-acef-16b2776cd952', '2016-09-07 20:37:52', '2016-09-07 20:38:12', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('36aa3612-8bab-4d97-9e13-4565cb691b83', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-27 13:40:56', '2016-08-27 13:40:56', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('3c3e9945-bd75-45b6-8a69-1a0a0753a1a0', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-13 11:52:11', '2016-08-13 11:52:18', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('3d04be4c-9c22-42e7-ac4f-d283e995bfa1', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 11:04:56', '2016-08-08 11:05:06', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('40377c63-b384-40b7-a7fc-4eed3c5b0e0b', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-27 20:13:07', '2016-08-27 20:13:07', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('41fb1cd8-e53a-47cb-a819-9d3d6200fcba', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-07 20:31:01', '2016-09-07 20:31:01', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('46c8a5e9-0fa1-4dbc-a1e7-3aee0690dcc7', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-28 22:19:50', '2016-08-28 22:29:34', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('4afcee91-04b6-421d-af2c-213335fabc08', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-13 12:18:36', '2016-08-13 12:18:38', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('4d501ad9-2cf0-486f-8355-b5a52a524f31', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 11:19:06', '2016-08-08 11:19:06', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('4e385b29-30e3-414e-82ba-a10e4024b2dc', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-18 09:49:26', '2016-09-18 09:49:26', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('53039624-7e96-4996-965c-214dbf9e8775', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-27 10:40:08', '2016-08-27 10:40:08', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('53d63629-e375-4eea-a0aa-dc9fccae028e', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '2016-07-13 12:53:50', '2016-07-13 12:53:50', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('5574fe96-7b63-4c93-9baa-9d2ebaee5548', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '2016-07-13 16:02:04', '2016-07-13 16:02:04', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('564cdad5-f637-488d-a622-b2d2d1eedef4', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '2016-10-15 15:02:18', '2016-10-15 15:02:18', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('599d6360-3609-49ba-9fae-54d039d44da7', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-11 13:13:32', '2016-08-11 13:16:38', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('5f3bc895-f5f8-4c14-a2a0-71c54fde2128', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '2016-07-13 16:02:18', '2016-07-13 16:10:05', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('6326d7e0-46e7-47af-bd12-5c28bc24155b', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 11:18:37', '2016-08-08 11:18:37', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('64b3147d-a828-4aa1-a701-fda7fcd7f95c', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 11:11:45', '2016-08-08 11:11:45', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('6a964058-5eaa-43a5-b37e-70613e83d113', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-27 16:39:10', '2016-08-27 16:39:10', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('7405a48f-43f0-47e0-bb66-507f8e185103', '9362236f-9b10-4342-83c5-2faa939ed5b5', '2016-07-13 16:17:05', '2016-07-13 16:17:05', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('7857979a-9c3b-41e8-8e08-338151b40b6b', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '2016-07-13 13:09:12', '2016-07-13 13:09:12', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('7ac45abf-b889-4613-a29e-8d85e51b2b73', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 10:59:50', '2016-08-08 10:59:50', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('7add6c30-5e72-4a4f-b677-f2ec63bd9a67', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 11:04:24', '2016-08-08 11:04:24', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('7bebdafd-309a-4463-ac28-b2695779985f', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-07 20:32:49', '2016-09-07 20:32:52', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('7cb38e3d-9692-4b93-8089-5daa70b2e244', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '2016-07-17 10:22:35', '2016-07-17 10:22:35', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('85129e2b-9b96-43ec-8723-8597ccc237ce', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-11 13:00:51', '2016-08-11 13:05:28', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('8542bc2b-36b6-4440-a8be-0dbb4be49c60', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '2016-07-13 12:58:47', '2016-07-13 12:58:47', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('86920844-c10d-4ec6-b782-af48ad83f37f', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-13 12:21:04', '2016-08-13 12:21:11', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('8753a358-742a-4049-b928-b4c7210cd431', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-22 11:33:27', '2016-08-22 11:33:29', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('885eca2e-c2c5-434c-a137-67f37411c557', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-18 11:16:36', '2016-09-18 11:16:36', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('8cc510cc-8969-4afa-b41c-7fb639d7dadd', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-10-16 17:07:46', '2016-10-16 17:07:46', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('8cf32a62-e2a4-4cd1-a867-d3431336917c', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 11:18:12', '2016-08-08 11:18:12', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('9031a48d-6b74-455b-b3d7-355e7cc84060', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-07 19:40:09', '2016-09-07 19:40:09', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('90878860-b2a2-4155-99aa-06f5df48d410', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-22 11:50:37', '2016-08-22 11:53:31', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('989101a1-c860-45c8-acc9-f9eb71d6a743', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-22 11:53:48', '2016-08-22 11:55:00', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('9c74b2b5-99ae-43c2-9876-f3be86f57ee3', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-27 11:23:29', '2016-08-27 11:23:29', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('9ca2d34d-fc7b-4a32-98af-711af443934d', 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '2016-07-13 21:24:35', '2016-07-13 21:24:35', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('a8e9c3d2-4020-4109-9c8f-66d6f59814dc', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-13 12:16:53', '2016-08-13 12:16:55', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('a9bef49c-4d47-4a7e-8b76-f1e613a93f75', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-22 11:33:39', '2016-08-22 11:33:41', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('aa248930-f4f3-4a35-bb94-1c67a54604f3', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-13 11:45:21', '2016-08-13 11:45:37', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('aa920aeb-22df-4891-b13b-06618e58523e', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 11:17:46', '2016-08-08 11:17:46', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('ac3bd850-f6ff-4bb7-ab9a-a56dc3630ef4', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-07 19:41:12', '2016-09-07 19:41:12', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('addba9ba-afd4-496c-b6c1-dd0af04d58aa', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-18 11:34:02', '2016-09-18 11:34:02', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('b042b34c-f9ae-42cc-b878-f0da7519ed12', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 11:04:19', '2016-08-08 11:04:19', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('b435388e-2762-42eb-a402-1c30f2411adb', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-07 19:42:40', '2016-09-07 19:45:07', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('b64dfbb9-5d49-4315-a4c0-73556ebb6da4', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-08 10:51:06', '2016-08-08 10:51:06', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('b78a6128-7f46-4e5d-beb5-7b299f748823', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-10-16 17:03:13', '2016-10-16 17:03:13', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('bb510082-cf02-4b8d-bdd8-d31bb41db384', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-10-16 16:57:09', '2016-10-16 16:57:09', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('be371de8-c8d7-4a20-a798-f5dc8ac298d7', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-22 11:34:24', '2016-08-22 11:50:26', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('c0d32c0e-23cc-40a2-92d5-ee2b4ff14b3d', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-13 12:15:11', '2016-08-13 12:15:28', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('c3ba02db-0d01-4bbc-92c5-a27a4c9a9d5e', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-28 21:39:38', '2016-08-28 21:39:38', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('c4403a7a-b951-429b-8b3f-236e187855da', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-22 10:54:26', '2016-08-22 10:54:34', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('c65f2ff1-318c-46e2-bd64-66ab5285bbc4', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-22 11:32:46', '2016-08-22 11:33:18', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('cd177b95-7b6a-43d4-85a3-7900eead238a', '70c625f4-e469-4570-bc77-b03637f783b7', '2016-08-22 12:08:31', '2016-08-22 12:08:31', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('cf913aab-bcbe-4a93-8322-843788412f4c', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-19 20:00:58', '2016-08-19 20:00:58', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('d5215941-a802-4cac-943e-b695d77e70ac', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-10-16 17:02:22', '2016-10-16 17:02:22', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('d96a9ac0-8131-4485-8895-7aee617ec3de', '0d98150a-6076-431c-acef-16b2776cd952', '2016-09-07 20:38:23', '2016-09-07 20:38:25', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('da066bd5-d55d-4bc7-9387-39c6d896bdc4', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-07 20:48:40', '2016-09-07 20:48:40', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('da8bd0e3-aca9-4235-ba22-5d3c04e8c368', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-13 12:41:45', '2016-08-13 12:45:39', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('dd42d1e5-ebbf-48ea-9d53-e40004b5841f', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-09-18 11:22:49', '2016-09-18 11:22:49', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('de93cc76-1eec-4498-adb9-e90651c26792', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-10-16 16:53:38', '2016-10-16 16:53:38', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('e436e779-3655-4535-ad9e-cc762109ddde', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-11 12:32:09', '2016-08-11 13:00:39', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('e5de8573-d703-4d72-bf97-183126adc6e5', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-27 13:50:41', '2016-08-27 13:50:41', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('ebf14109-bfff-4d36-b791-af517a6507a4', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-10-16 16:18:43', '2016-10-16 16:18:43', '本机', '0:0:0:0:0:0:0:1', '0');
INSERT INTO `userloginrecord` VALUES ('f01e786b-7d81-42b3-9de1-0bf142272f52', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-28 22:07:34', '2016-08-28 22:14:38', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('f5eaa2cf-eae8-4fab-811f-14ae4bbab581', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-27 18:34:03', '2016-08-27 18:37:50', '未知', '127.0.0.1', '0');
INSERT INTO `userloginrecord` VALUES ('ff21568d-3420-4760-81d9-3bfc13473c6b', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '2016-08-11 13:11:19', '2016-08-11 13:13:21', '未知', '127.0.0.1', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `password` varchar(36) NOT NULL,
  `status` int(1) NOT NULL,
  `role` int(1) NOT NULL COMMENT 'role分为普通用户和导游，<=0代表普通用户，1代表申请导游，2代表导游，-1代表申请导游被拒绝',
  `email` varchar(255) DEFAULT NULL,
  `cardClazz` varchar(255) DEFAULT NULL,
  `cardNumber` varchar(255) DEFAULT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `head` varchar(255) NOT NULL,
  `guideVerifyImgId` varchar(36) DEFAULT NULL COMMENT '导游验证时上传的导游证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `PHONE` (`phone`) USING BTREE,
  KEY `forkey_guideVerifyImgId` (`guideVerifyImgId`),
  CONSTRAINT `forkey_guideVerifyImgId` FOREIGN KEY (`guideVerifyImgId`) REFERENCES `imgs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('0d98150a-6076-431c-acef-16b2776cd952', '18874489606', null, null, 'e10adc3949ba59abbe56e057f20f883e', '1', '0', null, null, null, '0', 'default.png', null);
INSERT INTO `users` VALUES ('70c625f4-e469-4570-bc77-b03637f783b7', '18874489576', null, null, 'e10adc3949ba59abbe56e057f20f883e', '1', '0', null, null, null, '0', 'default.png', null);
INSERT INTO `users` VALUES ('9362236f-9b10-4342-83c5-2faa939ed5b5', '15874437661', null, '阿三', '12345', '1', '2', null, null, null, '0', '5245d189-2552-417f-8e26-03c6c6598d51.jpeg', null);
INSERT INTO `users` VALUES ('d823363b-078a-4fc2-b949-b9fb3ba2ac41', '18874490135', '咳咳', '章大可', '123456', '1', '-1', null, '身份证', '513823199512171930', '0', 'd250ff11-a376-43c1-a0b1-a5778f2a01a9.jpeg', null);
INSERT INTO `users` VALUES ('e4a5a6f0-1214-4eca-9a69-d68de422b747', '18874489675', '小成23', '熊铖', 'bca379bfed2eb121ce7b7dab13e94cf2', '1', '0', null, '临时身份证', '431124199710191234', '0', 'default.png', null);

-- ----------------------------
-- Table structure for userupdaterecord
-- ----------------------------
DROP TABLE IF EXISTS `userupdaterecord`;
CREATE TABLE `userupdaterecord` (
  `updateRecordId` varchar(36) NOT NULL,
  `doAdminId` varchar(36) DEFAULT NULL COMMENT '进行操作的adminId',
  `doneUserId` varchar(36) NOT NULL COMMENT '被操作的adminId',
  `item` varchar(255) NOT NULL,
  `updateTime` datetime NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`updateRecordId`),
  KEY `doneAId` (`doneUserId`),
  KEY `doAId` (`doAdminId`),
  CONSTRAINT `userupdaterecord_ibfk_1` FOREIGN KEY (`doAdminId`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userupdaterecord_ibfk_2` FOREIGN KEY (`doneUserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userupdaterecord
-- ----------------------------
INSERT INTO `userupdaterecord` VALUES ('05a2385c-a653-4371-8572-dd5f047650b1', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:09:28', '0');
INSERT INTO `userupdaterecord` VALUES ('16da763b-1a0f-4ebe-a1c6-128e02ca695b', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改个人信息', '2016-08-11 13:29:30', '0');
INSERT INTO `userupdaterecord` VALUES ('1a2f656a-292f-4df9-b3c0-4f8cb4560f59', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改个人信息', '2016-08-11 13:26:15', '0');
INSERT INTO `userupdaterecord` VALUES ('31fcc045-7956-4c49-96d7-183f95172a9d', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 12:35:55', '0');
INSERT INTO `userupdaterecord` VALUES ('3427bb6f-444f-4626-a9c2-85b13549d976', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:17:40', '0');
INSERT INTO `userupdaterecord` VALUES ('508c234e-f6a2-43ae-94b7-b360d80c1d5b', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:23:22', '0');
INSERT INTO `userupdaterecord` VALUES ('51eff75e-ef03-46d9-bcae-3ad5a7bdd1f9', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改个人信息', '2016-08-11 13:24:34', '0');
INSERT INTO `userupdaterecord` VALUES ('62d95bcb-f2e9-48fd-871b-0d4c42d84817', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 12:59:26', '0');
INSERT INTO `userupdaterecord` VALUES ('6a7691d5-aa39-4d1d-b46e-173d3e199f5d', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:18:39', '0');
INSERT INTO `userupdaterecord` VALUES ('706caff7-88e1-4c3f-891b-018e9c3879e9', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:14:03', '0');
INSERT INTO `userupdaterecord` VALUES ('73c00201-aa9a-4716-b51f-c4b0f6aba34f', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:19:38', '0');
INSERT INTO `userupdaterecord` VALUES ('74260e31-6040-4318-94e4-c812b82fe7b3', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改个人密码!', '2016-08-12 10:43:39', '0');
INSERT INTO `userupdaterecord` VALUES ('74e727dd-b02a-44b2-a8e6-f693b3f97d53', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:21:11', '0');
INSERT INTO `userupdaterecord` VALUES ('7705557d-f6ca-4d2e-8754-75510802d4db', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:17:09', '0');
INSERT INTO `userupdaterecord` VALUES ('7b41d2c2-3843-4231-af4e-e6beb81033bb', null, 'd823363b-078a-4fc2-b949-b9fb3ba2ac41', '修改用户信息', '2016-07-13 12:55:58', '0');
INSERT INTO `userupdaterecord` VALUES ('8c285983-10fc-4ccd-92f7-e01746d0e650', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:12:22', '0');
INSERT INTO `userupdaterecord` VALUES ('8f482e76-000e-4b83-bd80-180e378c7ae2', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改个人信息', '2016-08-22 11:50:48', '0');
INSERT INTO `userupdaterecord` VALUES ('9378fd60-d021-4e58-87b7-088ea034f897', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改个人信息', '2016-08-22 11:54:09', '0');
INSERT INTO `userupdaterecord` VALUES ('973d7c82-e68f-4138-8256-520ec43209f6', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改个人信息', '2016-08-11 13:29:37', '0');
INSERT INTO `userupdaterecord` VALUES ('a4b5a39f-af0e-43a3-9db3-c7d14ecc553b', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改个人信息', '2016-08-11 13:26:23', '0');
INSERT INTO `userupdaterecord` VALUES ('adafc1bf-8678-417f-aa6f-e034ea644d16', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 12:35:43', '0');
INSERT INTO `userupdaterecord` VALUES ('b6ab5987-fe22-474a-9d96-2f351c56e4d5', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改个人密码!', '2016-08-12 11:23:21', '0');
INSERT INTO `userupdaterecord` VALUES ('bc7dd6e4-2995-4417-8189-c4f3c5c0ac98', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:06:00', '0');
INSERT INTO `userupdaterecord` VALUES ('c3454570-a893-47f8-818e-f1ec82432829', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改个人信息', '2016-08-22 11:53:57', '0');
INSERT INTO `userupdaterecord` VALUES ('c7265577-39bb-4bfb-ac98-a5ef14daa645', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改个人密码!', '2016-08-12 10:43:22', '0');
INSERT INTO `userupdaterecord` VALUES ('cdc59172-35a0-4a1d-84b7-eaa699fa3686', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:17:28', '0');
INSERT INTO `userupdaterecord` VALUES ('d2201dc5-27b1-4ce0-be28-9358eb041e85', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:02:44', '0');
INSERT INTO `userupdaterecord` VALUES ('df4382de-d825-4705-a328-bad5c8fe7340', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改密码', '2016-09-07 20:59:11', '0');
INSERT INTO `userupdaterecord` VALUES ('e093c4d7-0daf-43f4-a5a5-faf82cb739f5', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-09-07 20:58:55', '0');
INSERT INTO `userupdaterecord` VALUES ('e6790d5c-d0a7-457b-a18c-eb224486cbc3', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:08:36', '0');
INSERT INTO `userupdaterecord` VALUES ('feceee3e-2284-4354-ada3-bbf09ebb5487', null, 'e4a5a6f0-1214-4eca-9a69-d68de422b747', '修改用户信息', '2016-08-11 13:22:32', '0');

-- ----------------------------
-- Table structure for viewticket_carousels
-- ----------------------------
DROP TABLE IF EXISTS `viewticket_carousels`;
CREATE TABLE `viewticket_carousels` (
  `id` varchar(36) NOT NULL,
  `imgId` varchar(36) NOT NULL,
  `createTime` datetime NOT NULL,
  `intro` text,
  PRIMARY KEY (`id`),
  KEY `imgId2222` (`imgId`),
  CONSTRAINT `imgId2222` FOREIGN KEY (`imgId`) REFERENCES `imgs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of viewticket_carousels
-- ----------------------------
INSERT INTO `viewticket_carousels` VALUES ('2bbc33ae-3127-443e-a18a-4a8d692cf856', 'f6e81d0b-b79e-402a-9857-e3bddec35ec6', '2016-10-16 10:43:18', null);
INSERT INTO `viewticket_carousels` VALUES ('3ecd4a87-5632-43f1-aca3-ae3265be287f', 'a1acf09a-ab9c-4fb0-a3b4-bce0b79cf4d8', '2016-07-28 13:29:27', null);
INSERT INTO `viewticket_carousels` VALUES ('6b1b129f-0bb9-411d-8fa8-4032c0999a3f', 'fe9cc34f-a48f-4119-a992-e0bf7bc14b03', '2016-07-28 13:29:20', null);
INSERT INTO `viewticket_carousels` VALUES ('bb0c2df3-1afb-4fab-ae7e-018a7e802fdd', 'a7a4fde9-c2a2-4fd5-a413-f924c055239f', '2016-07-28 13:29:31', null);

-- ----------------------------
-- Table structure for viewticket_orders
-- ----------------------------
DROP TABLE IF EXISTS `viewticket_orders`;
CREATE TABLE `viewticket_orders` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `ticketId` varchar(36) NOT NULL,
  `travelTime` datetime NOT NULL,
  `price` int(11) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `getTicketName` varchar(255) NOT NULL,
  `getTicketPhone` varchar(11) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `createTime` datetime NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order-ticketId` (`ticketId`),
  KEY `order-userId` (`userId`),
  CONSTRAINT `order-ticketId` FOREIGN KEY (`ticketId`) REFERENCES `viewticket_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order-userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of viewticket_orders
-- ----------------------------
INSERT INTO `viewticket_orders` VALUES ('0fa7c875-0958-4b6a-8067-2251160bdeff', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', 'a45413a2-e523-43b4-a723-260d7d754e56', '2016-08-02 00:00:00', '105', '210', '2', '熊铖', '18874489675', '0', '2016-08-01 12:42:05', '3');
INSERT INTO `viewticket_orders` VALUES ('640a1aa0-4255-4105-99b2-b32268c479f0', 'e4a5a6f0-1214-4eca-9a69-d68de422b747', 'ac89eb13-c0d2-4c05-98f3-56a0b8b793fd', '2016-08-12 00:00:00', '297', '891', '3', '熊铖', '18874489675', '0', '2016-08-01 12:43:51', '1');

-- ----------------------------
-- Table structure for viewticket_recommendviews
-- ----------------------------
DROP TABLE IF EXISTS `viewticket_recommendviews`;
CREATE TABLE `viewticket_recommendviews` (
  `id` varchar(36) NOT NULL,
  `viewId` varchar(36) NOT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `asdsd` (`viewId`),
  CONSTRAINT `asdsd` FOREIGN KEY (`viewId`) REFERENCES `viewticket_views` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of viewticket_recommendviews
-- ----------------------------
INSERT INTO `viewticket_recommendviews` VALUES ('0c55da6d-7e48-4fec-8948-3ecc010fea4a', '6eb88fe2-df47-473e-bbb7-03c60e646881', '', '2016-10-17 21:33:05');
INSERT INTO `viewticket_recommendviews` VALUES ('39dc26c0-b6e7-4ff6-bd18-b1ee7efc5b5c', 'c593bfc2-a49d-44fa-b49e-937f003316a9', '', '2016-10-17 20:46:41');
INSERT INTO `viewticket_recommendviews` VALUES ('6f73d8ab-39b7-4ee2-9550-126e25e10273', '8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', '', '2016-10-17 20:46:37');
INSERT INTO `viewticket_recommendviews` VALUES ('80c0e743-8d07-465e-a7f8-de63a6bd3b63', 'fcb23b48-be53-46e6-8494-6b8add8d4b49', '', '2016-10-17 22:01:38');
INSERT INTO `viewticket_recommendviews` VALUES ('860a4b00-798f-4407-a42b-efafcc307abd', '17662e89-5b7e-4271-b39c-0a99ee71cb2c', '', '2016-10-17 21:33:10');
INSERT INTO `viewticket_recommendviews` VALUES ('ae6f59ea-2f2f-4e73-8135-680775358ea6', 'f80e05d0-94b7-4e08-bdc1-6cf5f5eb663b', '', '2016-10-17 22:01:13');
INSERT INTO `viewticket_recommendviews` VALUES ('c334a2b2-69ea-4295-a8b9-9a8f953d60ed', 'f36a12b5-f0a6-4ecd-bcf0-980c06542773', '', '2016-10-17 22:01:17');
INSERT INTO `viewticket_recommendviews` VALUES ('c9d580ca-4939-4926-835f-c7951d25b081', '9a68acbf-5471-467b-8645-15fcd9d5a477', '', '2016-10-17 21:33:42');
INSERT INTO `viewticket_recommendviews` VALUES ('d56b65d1-d2df-4b1a-a0e9-583aeb9ddec9', '28b21776-1e43-4f9b-9d64-a8071a7e37ca', '', '2016-10-17 21:33:27');
INSERT INTO `viewticket_recommendviews` VALUES ('dddfa262-6f75-445b-9d94-639b0b7859f9', 'ceedaec3-2800-4ea3-858f-bed2ee6d6812', '', '2016-10-17 22:01:22');
INSERT INTO `viewticket_recommendviews` VALUES ('e0a5b8b2-e5cb-4afc-89b3-83635c49b724', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', '', '2016-10-17 22:01:32');

-- ----------------------------
-- Table structure for viewticket_tickets
-- ----------------------------
DROP TABLE IF EXISTS `viewticket_tickets`;
CREATE TABLE `viewticket_tickets` (
  `id` varchar(36) NOT NULL,
  `viewId` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '票种',
  `style` varchar(255) NOT NULL COMMENT '票型',
  `orderTime` varchar(255) NOT NULL,
  `marketPrice` int(255) NOT NULL,
  `happyPrice` int(255) NOT NULL,
  `payType` varchar(255) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `creatTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `viewid` (`viewId`),
  CONSTRAINT `viewid` FOREIGN KEY (`viewId`) REFERENCES `viewticket_views` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of viewticket_tickets
-- ----------------------------
INSERT INTO `viewticket_tickets` VALUES ('12810e50-fec9-4679-82f4-493056c67951', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', '石牛寨成人票', '门票', '成人票', '游玩前1天22:00前', '118', '104', '在线支付', '0', '2016-07-30 19:34:29');
INSERT INTO `viewticket_tickets` VALUES ('24630014-deeb-46f1-8468-e090d7a70b90', '28b21776-1e43-4f9b-9d64-a8071a7e37ca', '《天门狐仙》普通席成人票', '门票', '成人票', '当天16:00前', '238', '170', '在线支付', '0', '2016-07-30 19:58:12');
INSERT INTO `viewticket_tickets` VALUES ('28c8950b-6c75-42c3-bfa1-822ca3db206a', 'f36a12b5-f0a6-4ecd-bcf0-980c06542773', '张家界大峡谷成人票', '门票', '成人票', '玩前1天22:00前', '118', '84', '在线支付', '0', '2016-07-28 11:11:37');
INSERT INTO `viewticket_tickets` VALUES ('29fbc684-046b-4ba6-acf1-815be7e66627', 'fcb23b48-be53-46e6-8494-6b8add8d4b49', '长沙世界之窗学生票', '门票', '学生票', '游玩前1天22:00前', '120', '96', '在线支付', '0', '2016-07-30 19:15:05');
INSERT INTO `viewticket_tickets` VALUES ('349d76c5-900e-4a1a-9072-d19d218469d5', 'f80e05d0-94b7-4e08-bdc1-6cf5f5eb663b', '黄龙洞成人票（含游船）', '门票', '成人票', '游玩前1天22:00前', '100', '80', '在线支付', '0', '2016-07-30 19:44:03');
INSERT INTO `viewticket_tickets` VALUES ('38c1b621-1c9c-4870-b156-6e790aaf9956', '9a68acbf-5471-467b-8645-15fcd9d5a477', '宝峰湖成人票', '门票', '成人票', '游玩前1天22:00前', '100', '80', '在线支付', '0', '2016-07-30 19:51:49');
INSERT INTO `viewticket_tickets` VALUES ('5a9da258-47eb-4c53-921c-f44878aaa79f', 'c593bfc2-a49d-44fa-b49e-937f003316a9', '天门山成人票（B线）（公路上山-索道下山）', '门票', '成人票', '游玩前1天22:00前', '258', '235', '在线支付', '0', '2016-07-28 10:26:51');
INSERT INTO `viewticket_tickets` VALUES ('6cb0be22-8a69-431c-b904-4a0bbe0989e0', 'c593bfc2-a49d-44fa-b49e-937f003316a9', '天门山成人票（A线）（索道上山-公路下山）', '门票', '成人票', '游玩前1天22:00前', '258', '235', '在线支付', '0', '2016-07-28 10:17:37');
INSERT INTO `viewticket_tickets` VALUES ('7304ee5b-b448-451b-8ae6-a0e29e6cf82b', '6eb88fe2-df47-473e-bbb7-03c60e646881', '黄石寨单程索道成人票', '门票', '成人票', '游玩前1天22:00前', '60', '55', '在线支付', '0', '2016-07-30 20:07:54');
INSERT INTO `viewticket_tickets` VALUES ('786c24bc-4773-48c8-82d9-573fe08afd0a', 'fcb23b48-be53-46e6-8494-6b8add8d4b49', '长沙世界之窗成人票', '门票', '成人票', '游玩前1天22:00前', '150', '130', '在线支付', '0', '2016-07-30 19:14:27');
INSERT INTO `viewticket_tickets` VALUES ('a45413a2-e523-43b4-a723-260d7d754e56', '17662e89-5b7e-4271-b39c-0a99ee71cb2c', '生态动物园一票通成人票', '门票', '成人票', '游玩前1天22:00前', '130', '105', '在线支付', '0', '2016-07-30 19:23:03');
INSERT INTO `viewticket_tickets` VALUES ('ac89eb13-c0d2-4c05-98f3-56a0b8b793fd', '8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', '张家界国家森林公园+袁家寨子联票', '联票', '成人票', '游玩前1天22:00前', '356', '297', '在线支付', '0', '2016-07-28 10:31:43');
INSERT INTO `viewticket_tickets` VALUES ('b2844286-49f7-404e-a83a-859a0d021bd4', 'ceedaec3-2800-4ea3-858f-bed2ee6d6812', '凤凰古城九景联票+凤凰篝火晚会门票', '门票', '成人票', '当天16:00前', '236', '177', '在线支付', '0', '2016-07-28 10:55:53');
INSERT INTO `viewticket_tickets` VALUES ('c69422e7-3c5e-48d3-82eb-ba315a17e574', '8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', '张家界国家森林公园+黄石寨双程索道联票', '联票', '成人票', '游玩前1天22:00前', '366', '348', '在线支付', '0', '2016-07-28 10:28:29');
INSERT INTO `viewticket_tickets` VALUES ('c784ea40-0503-47e8-b9c2-1c3a767553e6', 'ceedaec3-2800-4ea3-858f-bed2ee6d6812', '凤凰古城风景名胜区九景联票', '联票', '成人票', '当天16:00前', '148', '133', '在线支付', '0', '2016-07-28 10:49:33');
INSERT INTO `viewticket_tickets` VALUES ('cafa1eab-b6aa-419a-aabb-56df1ef9a1fe', '8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', '张家界国家森林公园', '门票', '成人票', '游玩前1天22:00前', '313', '299', '在线支付', '0', '2016-07-28 10:25:58');
INSERT INTO `viewticket_tickets` VALUES ('cb34ddfa-3faf-4f00-bf31-85e052a4172b', '6eb88fe2-df47-473e-bbb7-03c60e646881', '黄石寨往返索道成人票', '门票', '成人票', '游玩前1天22:00前', '118', '102', '在线支付', '0', '2016-07-30 20:07:06');

-- ----------------------------
-- Table structure for viewticket_views
-- ----------------------------
DROP TABLE IF EXISTS `viewticket_views`;
CREATE TABLE `viewticket_views` (
  `id` varchar(36) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  `name` varchar(36) NOT NULL,
  `grade` varchar(36) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `feature` varchar(255) DEFAULT NULL,
  `opentime` varchar(255) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `creatTime` datetime NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasIntro` tinyint(1) NOT NULL,
  `salesNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of viewticket_views
-- ----------------------------
INSERT INTO `viewticket_views` VALUES ('17662e89-5b7e-4271-b39c-0a99ee71cb2c', '中国', '湖南', '长沙', '长沙生态动物园', '3A', '湖南省长沙市长沙县暮云镇西湖村道芙蓉南路', '亲近动物和自然，市民百姓旅游最佳目的地', '早上9点', '0', '2016-10-15 13:39:00', '名胜古迹', '1', '112');
INSERT INTO `viewticket_views` VALUES ('28b21776-1e43-4f9b-9d64-a8071a7e37ca', '中国', '湖南', '张家界', '天门狐仙', '4A', '湖南省张家界市永定区天门山天门狐仙峡谷', '人与妖的惊天爱情', '每天20:15~21:50', '0', '2016-10-15 13:39:20', '名胜古迹', '1', '222');
INSERT INTO `viewticket_views` VALUES ('2a252d17-ade6-4cdd-a4fe-baf1b9698395', '中国', '湖南', '长沙', '岳阳平江石牛寨 ', '3A', '湖南省岳阳市平江县大坪乡', '享有“天下第一寨”之美誉', '早上8点半', '0', '2016-07-30 19:30:11', '名胜古迹', '1', '321');
INSERT INTO `viewticket_views` VALUES ('6eb88fe2-df47-473e-bbb7-03c60e646881', '中国', '湖南', '张家界', '黄石寨索道', '4A', '湖南省张家界市张家界国家森林公园内', '空中观看武陵仙境', '每天07:00~18:00', '0', '2016-07-30 20:05:49', '山水风光', '1', '134');
INSERT INTO `viewticket_views` VALUES ('8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', '中国', '湖南', '张家界', '张家界国家森林公园', '5A', '湖南省张家界市武陵源区', '三千奇峰，八百秀水', '早上7点', '0', '2016-07-28 11:08:24', '山水风光', '1', '134');
INSERT INTO `viewticket_views` VALUES ('9a68acbf-5471-467b-8645-15fcd9d5a477', '中国', '湖南', '张家界', '宝峰湖', '4A', '湖南省张家界市武陵源区索溪镇宝峰路8号', '高峡平湖，风光旖旎，是山水风景杰作', '早上7点', '0', '2016-10-15 13:39:25', '山水风光', '1', '556');
INSERT INTO `viewticket_views` VALUES ('c593bfc2-a49d-44fa-b49e-937f003316a9', '中国', '湖南', '张家界', '天门山国家森林公园', '5A', '湖南省张家界市永定区天门山索道站', '穿越云霄的旅行', '早上8点', '0', '2016-07-28 11:08:14', '名胜古迹', '1', '3245');
INSERT INTO `viewticket_views` VALUES ('ceedaec3-2800-4ea3-858f-bed2ee6d6812', '中国', '湖南', '吉首', '凤凰古城（凤凰）', '5A', '湖南省湘西土家族苗族自治州凤凰县凤凰古城', '邂逅数个人，偶遇一座城', '上午7点', '0', '2016-07-28 10:59:15', '名胜古迹', '0', '4575');
INSERT INTO `viewticket_views` VALUES ('f36a12b5-f0a6-4ecd-bcf0-980c06542773', '中国', '湖南', '张家界', '张家界大峡谷', '5A', '湖南省张家界市慈利县三官寺', '世界最高蹦极，最高最长玻璃桥', '上午7点半', '0', '2016-07-28 11:03:15', '山水风光', '0', '3456');
INSERT INTO `viewticket_views` VALUES ('f80e05d0-94b7-4e08-bdc1-6cf5f5eb663b', '中国', '湖南', '张家界', '黄龙洞', '4A', '湖南省张家界市武陵源区索溪峪镇河口村', '中国最美的旅游溶洞', '早上7点', '0', '2016-07-30 19:39:41', '名胜古迹', '1', '3345');
INSERT INTO `viewticket_views` VALUES ('fcb23b48-be53-46e6-8494-6b8add8d4b49', '中国', '湖南', '长沙', '长沙世界之窗', '4A', '湖南省长沙市开福区三一大道485号', '将刺激的游乐项目和各国的历史遗迹融为一体', '早点8点半', '0', '2016-07-30 19:09:52', '名胜古迹', '1', '9866');

-- ----------------------------
-- Table structure for viewticket_views_imgs
-- ----------------------------
DROP TABLE IF EXISTS `viewticket_views_imgs`;
CREATE TABLE `viewticket_views_imgs` (
  `id` varchar(36) NOT NULL,
  `viewId` varchar(36) NOT NULL,
  `imgId` varchar(36) NOT NULL,
  `main` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `viewid2` (`viewId`),
  KEY `imgid2` (`imgId`),
  CONSTRAINT `imgid2` FOREIGN KEY (`imgId`) REFERENCES `imgs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `viewid2` FOREIGN KEY (`viewId`) REFERENCES `viewticket_views` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of viewticket_views_imgs
-- ----------------------------
INSERT INTO `viewticket_views_imgs` VALUES ('07c560a8-e784-4ea0-bdb0-958d17b5e782', 'f36a12b5-f0a6-4ecd-bcf0-980c06542773', '3101edd8-d524-4b79-a692-cf7b09f1f192', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('07dc0281-82bc-4505-a043-ea91246f1b83', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', 'c519501a-118c-4054-815f-bd808983d672', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('0896c845-5002-4f18-99c4-97438d6f75df', 'fcb23b48-be53-46e6-8494-6b8add8d4b49', 'c92668bb-1dcd-4459-90dd-4737534aec0e', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('0a96b218-ca06-4893-a4fb-d126bbb4362c', 'ceedaec3-2800-4ea3-858f-bed2ee6d6812', '243b4abd-f732-479a-8339-2cbd729e32ed', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('1261ed3b-4d99-4f49-949d-0126ef23082e', 'f36a12b5-f0a6-4ecd-bcf0-980c06542773', 'b19cbfed-c5ef-4cfd-8546-dedb0fde7a58', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('14827ba3-309a-4202-8755-4ae336acbe41', 'ceedaec3-2800-4ea3-858f-bed2ee6d6812', 'fdd24451-1d3f-4c13-aa8e-1de58300b841', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('150c87d2-f1a7-4aef-b4e6-cc937d7aa2da', '9a68acbf-5471-467b-8645-15fcd9d5a477', '160b67fe-9dc5-4d73-89e0-87ce7cc4430f', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('15a7bfbb-2802-4e5d-887f-2bd0fb7e346a', '6eb88fe2-df47-473e-bbb7-03c60e646881', '0f963c98-ffe8-44e4-9cb3-b62f6ecce77d', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('16c74c5d-c80b-410b-952d-e1028289d44a', 'f80e05d0-94b7-4e08-bdc1-6cf5f5eb663b', '7d9161f7-0ba1-44ee-9d8f-327fb53129eb', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('1cdf93be-8412-40e7-889e-4a9389bb4154', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', '2ebb66dc-a1a7-45c9-aa37-136b45cfaae3', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('1d6eabc1-5123-436b-a1c7-3ea1e2680628', 'fcb23b48-be53-46e6-8494-6b8add8d4b49', 'd61c76b3-8332-44b8-bceb-c487c3203628', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('1e71c254-d0a9-4270-89ef-68fb3911a5c0', 'c593bfc2-a49d-44fa-b49e-937f003316a9', 'f5afaeb2-93b6-41e1-88b7-8f519d56d812', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('1f9ac55b-f3ff-4ab6-bbbe-62406f580c1a', 'f36a12b5-f0a6-4ecd-bcf0-980c06542773', '0840fec4-693f-4df8-a624-f865a268db2c', '1');
INSERT INTO `viewticket_views_imgs` VALUES ('1fc61042-e23e-460c-a1a1-1489bc21a180', 'ceedaec3-2800-4ea3-858f-bed2ee6d6812', '1371815a-ae30-4849-b192-2da5614d6e69', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('2071aafe-ed56-4efd-8f63-e0d31c497a5e', '17662e89-5b7e-4271-b39c-0a99ee71cb2c', '34f2d675-40e4-4aa7-955d-9c73695ed9af', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('20f27246-2e47-4847-ba00-b2c17bfde6c5', '9a68acbf-5471-467b-8645-15fcd9d5a477', '75146e15-4163-4311-a854-b6f478a87149', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('26645cd0-e673-4841-a743-6e3c9d363570', '17662e89-5b7e-4271-b39c-0a99ee71cb2c', '3ab46fe6-4a03-416b-8c2d-6cbc0e41d22f', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('26fed10e-255c-45e8-bdd1-29e2f5c6eec7', 'f36a12b5-f0a6-4ecd-bcf0-980c06542773', '4fe94806-9e07-4967-92ce-efde2575dc7c', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('29f3790a-672b-4c92-8292-a1cb1656ad7d', '8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', 'a4d2196a-ec55-4396-8368-50e36a100f88', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('30873808-2b62-4340-9b53-e7931fc826e2', 'c593bfc2-a49d-44fa-b49e-937f003316a9', 'a128600b-8947-41ed-9e00-ea632c7d343b', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('394e509f-ee77-4d7b-b323-4bba0f96d648', '6eb88fe2-df47-473e-bbb7-03c60e646881', 'c31113ba-0ac0-4bfb-b209-4cbe87e44273', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('3abe8056-75c4-4d4c-a113-608173bf20f2', 'ceedaec3-2800-4ea3-858f-bed2ee6d6812', '79dc872b-f7b6-4433-a3d1-e62b3c2cdb21', '1');
INSERT INTO `viewticket_views_imgs` VALUES ('3ef57a28-a46a-45d3-b1ef-ac2838736c25', 'f80e05d0-94b7-4e08-bdc1-6cf5f5eb663b', '6e4fb3db-d2dc-4f68-a047-07890223a8db', '1');
INSERT INTO `viewticket_views_imgs` VALUES ('4444560c-f75c-4a2b-bee3-9761eafdac0a', 'c593bfc2-a49d-44fa-b49e-937f003316a9', 'b150e40f-f89f-4323-ba10-0512a797f1a1', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('4c098136-701d-4b31-a1e6-0467d9fdd360', 'c593bfc2-a49d-44fa-b49e-937f003316a9', '15d8b7f9-86c7-4aec-9045-b765ef8ac3ab', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('538dfcb6-9dd7-47e5-8a08-7d92905e46ad', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', 'cbcaa446-00e9-4b8f-be47-5231c01301dd', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('54f0d1de-55e6-4c0f-bd73-eff3e4f37746', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', '084b6831-fb83-42b2-aa97-dbe41194f96c', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('5bf289e7-3d48-4b45-bbf6-2bc07ff1a179', '28b21776-1e43-4f9b-9d64-a8071a7e37ca', '3a2a3959-e44a-4471-9b44-697f0a78a527', '1');
INSERT INTO `viewticket_views_imgs` VALUES ('5ea01532-fb20-49c8-919d-450f08bcb088', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', 'a6d228ba-8ede-4ec2-ad0d-308063427ef7', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('6041a952-0cc0-4536-8057-34fa82ddb7f6', '6eb88fe2-df47-473e-bbb7-03c60e646881', 'a19cd05a-0724-401c-917b-db71a6d2c4fa', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('64e8b8be-b16a-4c76-91b7-84e2ad78f9b7', 'f80e05d0-94b7-4e08-bdc1-6cf5f5eb663b', '275c8c59-90ce-4be5-affe-cae3bb143132', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('65c809bc-af11-4456-9d11-bdfa8eb3ea5c', '17662e89-5b7e-4271-b39c-0a99ee71cb2c', '958267b0-5a79-490f-b5ee-5a6200ad1060', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('747b7e67-ea09-465e-9e83-5e9860a62728', '8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', 'aa4cb800-3d2d-431a-8095-f726e2ed886f', '1');
INSERT INTO `viewticket_views_imgs` VALUES ('75b91eaf-cd08-4033-9b8e-76a72fb5badc', '17662e89-5b7e-4271-b39c-0a99ee71cb2c', 'f97b2a64-8178-411b-805d-d160c3aeef3e', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('773ed613-ce35-47f9-b5be-db08583b7ca4', 'f80e05d0-94b7-4e08-bdc1-6cf5f5eb663b', 'c81b3936-958b-472b-b8df-06828cb22768', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('77e3577a-7d2c-41f1-a0a3-d8ee4b0524da', '17662e89-5b7e-4271-b39c-0a99ee71cb2c', '9253a6c1-cd8c-47fc-824d-b092bd0b0574', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('7bdb7b56-2c3a-4ad3-80d5-6555b4a328ba', 'c593bfc2-a49d-44fa-b49e-937f003316a9', 'a41ae7cc-7eb5-487c-8fd6-8f9480431048', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('7cc5e14e-06ec-4e01-addd-f00f7080b4f5', 'fcb23b48-be53-46e6-8494-6b8add8d4b49', 'e1fb5cae-b4a2-4b4a-9a26-1d708023c914', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('830a4dbe-5101-494a-9321-ae2f1478d731', 'ceedaec3-2800-4ea3-858f-bed2ee6d6812', 'a429b22f-52ef-4775-bd59-0f5ca9f1d8ec', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('86251dd0-b1b8-449c-ad1d-4ac577b98292', '9a68acbf-5471-467b-8645-15fcd9d5a477', 'd8dac7f7-2b0e-478f-9ccd-b125a236482b', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('87709767-d417-48b7-b939-453f2d313c0a', '6eb88fe2-df47-473e-bbb7-03c60e646881', 'ab3ea00b-9179-4bef-94f6-47593f8c23e9', '1');
INSERT INTO `viewticket_views_imgs` VALUES ('8cad0680-852b-4da0-a9be-96413385ff9b', 'f36a12b5-f0a6-4ecd-bcf0-980c06542773', 'd71adf23-0170-49b0-8a47-025cbbe64855', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('8f0961e0-4b0c-42c3-9940-0435d86d3cc3', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', '8cf97e16-5b4d-405c-a6e3-c85063f7157d', '1');
INSERT INTO `viewticket_views_imgs` VALUES ('9664d8cb-aa4d-4b75-b3d4-d26b85a165fd', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', '39aaa26b-6601-4a24-bda1-77308db614c7', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('985ecd5d-e363-4a2d-a6c7-88391dbed57c', 'fcb23b48-be53-46e6-8494-6b8add8d4b49', '345e3be8-e016-4642-a1e6-8872464671d8', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('a56446b9-4e1b-4620-861e-be3eb5624477', '8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', 'f090c3e7-b1e1-4869-8ab2-5c720f629f7f', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('ab990e15-d03a-4454-b4aa-816c8514793a', 'c593bfc2-a49d-44fa-b49e-937f003316a9', '17172572-304a-4d2a-8147-ac51673f76bc', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('adbf8dfa-a5f8-4ba3-a16f-bc878226453a', 'fcb23b48-be53-46e6-8494-6b8add8d4b49', '17cda138-261c-4e1a-8d8f-66e0ec8e3b06', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('aed4114e-861b-47ed-8ccf-72539867f029', 'fcb23b48-be53-46e6-8494-6b8add8d4b49', '0ced188c-d5b7-477c-b4c4-f869693fd857', '1');
INSERT INTO `viewticket_views_imgs` VALUES ('b66422cf-a2f2-4c91-bd72-1ece9f064f9a', '6eb88fe2-df47-473e-bbb7-03c60e646881', '62f1df1d-3aca-4b60-95e6-a15921d47ca3', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('bfc79d18-074b-4fdb-bb2a-f33d4addfcb5', '17662e89-5b7e-4271-b39c-0a99ee71cb2c', '0fa16a51-bd89-47c7-8a4d-1a208499c7ce', '1');
INSERT INTO `viewticket_views_imgs` VALUES ('c22f7824-fcdc-4fba-903d-057b3f886b8d', 'f80e05d0-94b7-4e08-bdc1-6cf5f5eb663b', 'ee1db32b-833b-4ab5-bcdb-52d2a2995cd9', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('c5da54a7-24a0-4e39-ae24-8b6c84794b0a', 'f80e05d0-94b7-4e08-bdc1-6cf5f5eb663b', '38e1042a-5efd-4ad0-8c2d-b11f8717e139', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('c97ca315-3811-4503-b6ae-7e5a8dd730d5', '28b21776-1e43-4f9b-9d64-a8071a7e37ca', '41911f5a-936a-411a-a251-c968c9cb5c79', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('ce3c489c-7ec4-48ba-adb6-7ee3adaeb75d', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', '37ba4d17-7dc7-437a-960a-1efb16d1d6c5', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('d2371d55-9b86-40cc-a385-1f5e4a4fc27c', 'f36a12b5-f0a6-4ecd-bcf0-980c06542773', '7ab802f1-f653-4052-aa45-865bd38c8c32', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('d5b32e70-8228-4c68-8ed0-d38e37aacbc6', '6eb88fe2-df47-473e-bbb7-03c60e646881', '511e6186-4e2e-4d1a-89ce-5a989ae7d9bc', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('d5c03649-e979-4f9e-b733-7f8cc68e47c8', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', 'fa815a02-171b-487d-933e-6428af2fe346', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('d7780015-406a-4839-b626-ff642b5edc5c', 'ceedaec3-2800-4ea3-858f-bed2ee6d6812', '318247d0-f2e4-4399-9efb-59c1a794bd69', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('db9f03d7-3ec4-447b-9b1c-b3de4182aee1', 'ceedaec3-2800-4ea3-858f-bed2ee6d6812', 'a42ee897-925a-4bbc-9aad-4e24525d5258', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('dd460ba6-82a3-428e-b13b-29176b342b2b', '9a68acbf-5471-467b-8645-15fcd9d5a477', '3fe48ccd-88c0-45f7-9071-122d33f53238', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('e3ecba79-4f96-47af-9d98-349f54b67ab7', '6eb88fe2-df47-473e-bbb7-03c60e646881', '81b46d84-2f1d-41cb-b467-2298ed9b8805', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('e4abe1b1-4f35-4ea4-b3cc-69bf4baa9c80', 'c593bfc2-a49d-44fa-b49e-937f003316a9', '36b00c11-75bc-4d5f-96c3-6e2ac168a6fa', '1');
INSERT INTO `viewticket_views_imgs` VALUES ('e534c1ed-e83d-4571-ae56-d59523dee9ba', '8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', '18c8e83f-85a7-4905-9401-afb7eb522aa4', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('e7e1cf30-901f-4664-8068-8b84c099f73e', '8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', 'bc842ccd-7333-44e5-bcfe-80c27f11a2eb', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('ecf5ff07-618e-4fef-a6ae-4bac7b0dd924', 'fcb23b48-be53-46e6-8494-6b8add8d4b49', '8957b08a-9aff-489b-8f65-bbd8f3635e95', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('ee3c2636-1080-4e28-bf23-158dd9428a02', 'f36a12b5-f0a6-4ecd-bcf0-980c06542773', 'f24953e9-6a9c-4f21-b27d-c2f7bd3463d2', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('ee6f6fe4-0026-44f1-9039-11b356255f95', '17662e89-5b7e-4271-b39c-0a99ee71cb2c', '303adb82-663f-4642-b592-7791bf1c0554', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('f3fd6db4-54bd-4f38-95b8-b25abdf44f42', '8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', 'd1ebc87a-78c6-43e3-b285-849e7513c6ea', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('f46cab20-1d75-489e-b012-66d7f2a15c9d', 'f80e05d0-94b7-4e08-bdc1-6cf5f5eb663b', 'ea56a464-ed4a-4939-b8a7-e3e028e3f4df', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('f795c62d-2f89-4db6-add1-cab659781780', '9a68acbf-5471-467b-8645-15fcd9d5a477', '64662319-6cac-4753-81fb-1b1b3ed28228', '0');
INSERT INTO `viewticket_views_imgs` VALUES ('fe2ae771-7c69-4cb6-8f13-a8b893d27979', '9a68acbf-5471-467b-8645-15fcd9d5a477', 'a8b26488-f01f-4b2e-92c6-83bdd1354932', '1');
INSERT INTO `viewticket_views_imgs` VALUES ('fed1689a-8e14-43b5-ba22-9460d000180b', '9a68acbf-5471-467b-8645-15fcd9d5a477', '6307d916-c73c-4a45-b433-105c4f24c895', '0');

-- ----------------------------
-- Table structure for viewticket_views_introductions
-- ----------------------------
DROP TABLE IF EXISTS `viewticket_views_introductions`;
CREATE TABLE `viewticket_views_introductions` (
  `id` varchar(36) NOT NULL,
  `viewId` varchar(36) NOT NULL,
  `textDescription` text NOT NULL,
  `textDescriptionTwo` text,
  `textDescriptionThree` text,
  `introduction` text NOT NULL,
  `introductionTwo` text,
  `introductionThree` text,
  `isDelete` tinyint(1) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `viewid_intro` (`viewId`),
  CONSTRAINT `viewid_intro` FOREIGN KEY (`viewId`) REFERENCES `viewticket_views` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of viewticket_views_introductions
-- ----------------------------
INSERT INTO `viewticket_views_introductions` VALUES ('2c2bd4a6-75e6-493e-8857-930487f1763a', 'c593bfc2-a49d-44fa-b49e-937f003316a9', '张家界天门山国家森林公园是国家5A级旅游区！', '张家界天门山“天门吐雾”，“天门灵光”，被认为天界祥瑞之象，闻名遐迩！', '自然景观与人文景观的完美结合，古朴农耕与现代文明的交相辉映，视觉的震撼和感官的欣悦，尽在张家界之魂—天门山！', '张家界天门山国家森林公园是国家5A级旅游区，位于张家界市城区南郊8公里，是山岳型自然景区。张家界天门山国家森林公园总面积96平方公里，山顶面积达2平方公里，其主峰海拔 1518.6米，属典型的喀斯特地貌。', '张家界天门山，巍然耸立于张家界市区边沿，距市区仅8公里，宛然张家界的天然画屏，天门山成为张家界代表性的自然景观之一。长久以来，张家界天门山不仅以其神奇独特的地质外貌、秀美无比的自然风景令人瞩目，更因其深远博大的文化内涵、异彩纷呈的人文胜迹闻名遐迩，被尊为张家界的文化之魂、精神之魂。张家界天门山的山顶部分相对平坦，面积达到2平方公里，发育着典型的中山岩溶台地峰林地貌，溶丘石芽遍布，宛然一片神奇的空中石林。此外，天门山山顶还保存着完整的原始次生林，拥有世界罕见的高山珙桐群落，一年四季野趣盎然，遍地青苔覆盖，野藤缠绕，古树参天，奇石秀木结伴而生，处处皆是天成的盆景，犹如神仙造就的盆景大观园，可以令游客尽情领略自然奇趣，感受造化神奇。一九九二年七月，张家界天门山被国家林业部批准为张家界的第二个国家森林公园。', '张家界天门山国家森林公园四面绝壁，雄伟壮丽。保存着完整的原始次生林，植物资源丰富，有世界罕见的高山珙桐群落。张家界天门山文化底蕴深厚，留有大量赞咏天门山的诗词，更有众多神闻传说，被誉为“张家界之魂”。山顶天门山寺自唐朝建成以来香火鼎盛，寺外有七级浮屠，掩映于青枝绿叶中，古雅幽清。善男信女入寺拜佛，撞钟响彻天际，击鼓震动山岳，香烟袅袅如云。明万历年间南岳僧在此传经授戒，从此闻名遐迩，朝山拜佛者达周边四郡十余县，信士遍及湘西北。', '0', '2016-07-28 09:55:26');
INSERT INTO `viewticket_views_introductions` VALUES ('54aa3d1b-a757-4946-acd9-f49cd09ca849', 'ceedaec3-2800-4ea3-858f-bed2ee6d6812', '凤凰古城—如诗如画，如梦如歌，让多少人心驰神往！', '世界上有三个凤凰：一个在湘西，一个在沈从文的笔下，而第三个则在黄永玉的画里！', '静谧清幽的小城风光！', '凡是遥远的地方，对我们都有一种诱惑，不是诱惑于美丽，就是诱惑于传说，即使远方的风景，并不尽人意，我们也无需在乎，因为这实在是一个迷人的错。”。沈从文一本《边城》，将他魂牵梦萦的故土描绘得如诗如画，如梦如歌，让多少人心驰神往。有人说，世界上有三个凤凰：一个在湘西，一个在沈从文的笔下，而第三个则在黄永玉的画里。', '凤凰古城：是国家历史文化名城，凤凰古城风景秀丽，名胜古迹甚多，石板小街，古代城楼，明清古院。凤凰古城内沱江蜿蜒，河水清冽，浆声舟影，山歌互答，好一派静谧清幽的小城风光。', '沈从文故居：位于凤凰古城南中营街，为一南方典型的四合院。故居所有木质建筑，无雕龙刻凤，但显得小巧精致，古色古香。特别是那些带有湘西风味的雕花木窗，琢工精良，格外引人注目。\r\n熊希龄故居：环境幽静安谧，建筑古老质朴，四方形布局，中有一天井宽坪。进入宅门，左侧是一个约十平方米宽的前室，又称会客室，天井东侧为专门的柴房，内有石磨、石碓等食用家具装置，充分显示了这家主人当时勤俭持家的良好风范。', '0', '2016-07-28 10:46:19');
INSERT INTO `viewticket_views_introductions` VALUES ('63906407-7dde-4574-9b86-3dae4099d8a7', 'f80e05d0-94b7-4e08-bdc1-6cf5f5eb663b', '不看黄龙洞，枉游天下洞！', '张家界黄龙洞一只石猴和定海神针的永恒话题！', '高阔的洞天、幽深的暗河、悬空的瀑布、密集的石笋，被誉为世界溶洞的“全能冠军”！', '“不看黄龙洞，枉游天下洞”，黄龙洞目前已探明总面积10万平方米，全长11.7公里，垂直高度140米，内分两层旱洞两层水洞，整个溶洞犹如一株古木错节盘根散发开来，洞中有洞，洞中有河，洞中有山。', '溶洞内现已开放的龙舞厅、响水河、天仙水、天柱街、龙宫、迷宫六大游览区紧密相连，各有特色，由石灰质溶液凝结而成的石钟乳、石笋、石柱、石花、石幔、石枝、石管、石珍珠、石珊瑚等各种洞穴景观遍布其中， 仿佛一座神奇的地下“魔宫”。', '著名文学评论家冯牧参观黄龙洞后称赞“琼楼玉宇、异境天开”；剧作家曹禺参观黄龙洞后盛赞“洞天别有、世界奇迹”；香港特别行政区首任行政长官董建华考察黄龙洞后赞美：“黄龙奇洞，叹为观止。”泰国公主诗琳通游览黄龙洞后欣然题词：梦幻世界。前外交部长李肇星考察黄龙洞后即兴挥毫：三湘的黄龙，中国的骄傲。', '0', '2016-07-30 19:42:45');
INSERT INTO `viewticket_views_introductions` VALUES ('903914f1-2676-4bb7-b61e-0995ec82c642', '2a252d17-ade6-4cdd-a4fe-baf1b9698395', '百里丹霞，千年古寨！', '它是由怪石、奇峰、石洞组成的石的世界，鬼斧神工，千姿百态，美不胜收！', '一牛二龟三关险，四桥五寨六线天，七奇石八寺庙，四十八岩景无边！', '石牛寨景区，景色奇异。面对风门口行风播雨，飞溅瀑布凌空直下百岩潭，乱石迷宫俨似摆下八阵图，蟒蛇口、石豹洞、紫龙洞、石蛙口把守入口。连心洞、真人洞、莲花洞、夕照双珠洞，四十余洞如蜂窝群集。蒸谷甑、牛口、试剑石、取鼓石、鼓架石、思策台、望月台、议事亭、牛角涧、牛背石、古战场等数十处景点衬托如画。', '古木参天、气候宜人、清静幽雅、古迹重叠、形龙似凤、雄伟逼真，朝霞夕照、雨露风晴、飞禽走兽常集，鸟语花香迷人，引四方来客，游山玩水随你便，采花酿蜜任蜂忙。\r\n石牛寨西部有一巨石，形如黄牛，故名石牛山。这里历为军事要地，元末农民首领汤旷率兵驻山设寨，后志书记载名这石牛寨。石牛寨寨上风光无限，寨下景色诱人。它是由怪石、奇峰、石洞组成的石的世界，鬼斧神工，千姿百态，美不胜收。', '石牛寨地势险峻，群仞壁立，窄径悬天，奇险程度让人咱舌，人称“小华山”。浅红色的顶部，深褐色的石壁，显出几分神秘。尤其是风门口以上为花风岩石地质的武陵风光，而门外屏风石北偏东的凤凰山、风门口、金石山一线巨型山体旁，形似老牛跟夫。余下三方皆平卧视野之下，纵横阡陌，冉冉炊烟，十分开阔壮美。牛头接近凤凰山脚，造成峡谷北高南低开阔坡地。坡地北边的高坡上，散落许多花岗岩巨石，远看似喂老牛的千年草垛。一旦走入巨石之间，让人遐思万千，流连忘返。', '0', '2016-07-30 19:32:17');
INSERT INTO `viewticket_views_introductions` VALUES ('90fef207-d75f-41cb-8e9c-5bb430a14db1', '9a68acbf-5471-467b-8645-15fcd9d5a477', '风光旖旎，是山水风景杰作！', '宝峰湖是一座罕见的高峡平湖，四面青山，一泓碧水！', '宝峰湖景区以奇秀的高峡平湖绝景、“飞流直下三千尺”的宝峰飞瀑、神秘的深山古寺闻名！', '宝峰湖景点由宝峰湖和鹰窝寨两大块组成。其中宝峰湖、宝峰飞瀑、鹰窝寨、一线天被称为武陵源“四绝”。其位于武陵源区城南1.5公里处，是武陵源风景名胜中的精品景点。它是一座罕见的高峡平湖，四面青山，一泓碧水，风光旖旎，是山水风景杰作。', '湖中有两座叠翠小岛，近岸奇峰屹立，峰回水转。泛舟漫游，只见一湖绿水半湖倒影，充满诗情画意。“云梯万丈上天台，高峡平湖一鉴开，王母瑶池金扶，浣沙仙女下凡来”游宝峰湖，你就会欣赏到这样的诗情画意。群峰拥抱的宝峰湖，长约2.,5公里，湖犹如一面宝镜，四面青山，一泓碧水，荡桨温游，格外惬意。坐在船上，环顾四周，千山耸翠，俯视水中，倒影慢移，碧水照相馆得群峰绿，人面桃花水映红。真是静极了，美极了！', '宝峰湖水深72米，长2.5米公里，以其秀丽的湖光水色与幽野的洞天情趣成为武陵源水景风光的代表之作，电视剧《西游记》中花果山水帘洞外景就拍摄于“奇峰飞瀑”', '0', '2016-07-30 19:50:48');
INSERT INTO `viewticket_views_introductions` VALUES ('9dbe8a78-d546-485e-af98-5939ee85f4a2', '8e1a28ec-5765-4e6b-8cc6-8a9f17c2e9e7', '张家界核心景区《阿凡达》取景处！', '武陵源独特的石英砂岩峰林在国内外均属罕见，素有“奇峰三千”之称！', '武陵源水绕山转，素有“秀水八百”之称！', '公园自然风光以峰称奇、以谷显幽、以林见秀。其间有奇峰3000多座，这些石峰如人如兽、如器如物，形象逼真，气势壮观。峰间峡谷，溪流潺潺，浓荫蔽日。有“三千奇峰，八百秀水”之美称。公园不仅自然风光壮美绝伦，而且森林植物和野生动物资源极为丰富，森林覆盖率达98%，是一座巨大的生物宝库和天然氧吧，被称为“自然博物馆和天然植物园”。草木禽兽与奇山异水，同生共荣，形成完美的自然生态系统。', '武陵源的石英砂岩峰林在国内外均属罕见，素有“奇峰三千”之称。在217.2平方公里的核心景区中，有石英砂岩山峰3103座，峰体分布在海拔500-1100米，高度由几十米至400米不等。峰林造型若人、若神、若仙、若禽、若兽、若物，变化万千，这些突兀的岩壁峰石，连绵万顷。武陵源水绕山转，素有“秀水八百”之称。众多的瀑、泉、溪、潭、湖各呈其妙。金鞭溪是一条十余公里长的溪流，从张家界沿溪一直可以走到索溪峪，两岸峰林对峙，倒映溪间，别具风味。', '武陵源有珍奇的地质遗迹景观。包容了砂岩峰林、方山台原、天桥石门、岩溶峡谷、岩溶洞穴、沉积构造、地层剖面、古生物化石等丰富多彩的地质遗迹。其千姿百态，变幻莫测的地貌景观，包存几乎没被扰动的原始自然状态的生态环境与生态系统。因此从科学的角度和美学的角度评价，张家界砂岩峰林地貌与石林地貌、丹霞地貌以及美国的丹佛地貌相比，其景观、特色更胜一筹，是世界上极其特殊的、珍贵的地质遗迹景观。', '0', '2016-07-28 10:24:38');
INSERT INTO `viewticket_views_introductions` VALUES ('b26598ba-5485-44e8-a2e9-c25393391ded', '6eb88fe2-df47-473e-bbb7-03c60e646881', '不到黄石寨，枉到张家界！', '黄石寨索道集观光、代步于一体，乘坐索道可免去攀登辛劳，又可细细品味画中游的乐趣！', '黄石寨著名景点：天书宝匣、定海神针、南天一柱、前花园、金龟探海等。黄石寨日出，又是另一大奇观！', '黄石寨是张家界世界自然遗产的核心景区，是石英砂岩峰林地貌中的凌空观景台，被誉为“放大的盆景，缩小的仙境”，素有“不上黄石寨，枉到张家界”、“不看前花园，枉上黄石寨”之说。登临寨顶，四周可俯瞰张家界国家森林公园全貌。电影《阿凡达》、电视剧《西游记》、《血色湘西》等先后在此拍摄取景。', '黄石寨索道具有“新”、  “快”、“稳”、“趣”特色：采用国际最新索道进技是为“新”；每小时运量达2000人以上，5分钟到达寨顶，旺季排队不超过20分钟，是为“快”；脱挂抱索器为最新技术，运行平稳、舒适、安全，是为“稳”；大陆境内独有的5个透明水晶吊厢，增添有惊无险的乐趣，是为“趣”。', '  黄石寨索道集观光、代步于一体，乘坐索道可免去攀登辛劳，又可细细品味画中游的乐趣。', '0', '2016-07-30 20:09:20');
INSERT INTO `viewticket_views_introductions` VALUES ('b4618b3a-cef3-405e-be6a-efd2fd83de56', 'fcb23b48-be53-46e6-8494-6b8add8d4b49', '长沙世界之窗，超乎想象！', '高科技的动感电影、水幕电影和激光音乐喷泉，更使您流连忘返！', '景区内100多个景点建筑采用不同比例，为游客创造出一个多层次、高品位、有韵味的游览空间！', '长沙世界之窗将世界各国的今古奇观、历史遗迹、风光名胜、建筑民居、各种形式的艺术杰作以及风土人情和歌舞表演汇集于一园。', '景区内100多个景点建筑采用不同比例，为游客创造出一个多层次、高品位、有韵味的游览空间。这里有异域风格建筑与现代商业文化交融的国际商业街，有世界名胜古迹与人类经典建筑荟萃的文明山及文明河，有“惟楚有材”百人群雕与鳞次而立吊脚楼交相辉映的湘江谷，有美国西部风光与印地安文化尽现的欢乐谷，有典雅的欧式建筑与美丽爱情故事联姻的爱情谷，有绚丽多彩、风姿各异的亚洲诸国文化相互浸润的神秘谷，有童趣盎然的娱乐城堡与妙趣横生的超大比例玩具组合而成的儿童乐园。既有微缩景观的精巧别致，又有大比例的艺术夸张，集娱乐性、趣味性、刺激性与浓厚文化内涵于一身。', '长沙世界之窗的室内环境、民居陈饰、民俗风情、体育经济、中外民间杂技、杂耍、绝技、魔术、戏剧、曲艺、歌舞以定点表演、流动表演、广场巡游等多种表演形式展现在游人面前。高科技的动感电影、水幕电影和激光音乐喷泉，更使您流连忘返。', '0', '2016-07-30 19:12:45');
INSERT INTO `viewticket_views_introductions` VALUES ('bf2738e4-f4d7-4512-b254-66263eb80189', '17662e89-5b7e-4271-b39c-0a99ee71cb2c', '交通便利，适合家庭亲子游！', '筹建“中国大熊猫研究所华中基地”！', '长沙生态动物园是湖南省专业野生动物饲养和展示单位！', '长沙生态动物园于2010年10月建成开放，其前身为连续开放54年的长沙动物园，现园区面积1500亩，由中日著名设计师参照世界知名动物园标准联合设计，共分为步行圈养区、车行放养区、科教育区、生态景观区、休闲娱乐区、后勤服务区、建有动物笼舍区和驯化场37个，饲养动物300余种类、约5000余只（羽）。', '车行草食区分为高山食草区、非洲食草区以及亚洲食草区。在高山食草区，生活的都是国家一级保护动物,有岩羊、野马、金毛羚牛、盘羊、骆驼、牦牛。非洲食草区布置在较为干燥的草地上，这里展示了斑马、大型羚羊角马和长颈鹿等十多种动物，此区地势平坦，体现了非洲大草原的壮阔。', '百鸟乐园占地1186平方米，园内有鸟艺驯化馆、人鸟交流广场、鸟类竞技场、猛禽廊舍、观鸟塔、鸟语长廊和天鹅湖，是一座集科普、娱乐、驯养于一体的大型鸟类观赏园。园区四面环山、莺声燕语，园内尽展群鸟风姿。为了达到观赏鱼休闲相结合的目的，园内设置了休闲中心，供游客休闲歇息之用。', '0', '2016-07-30 19:22:01');
INSERT INTO `viewticket_views_introductions` VALUES ('d4c1dac4-9ebe-4f52-97fb-b4fdf64d4383', '28b21776-1e43-4f9b-9d64-a8071a7e37ca', '交通方便，性价比高的演出！', '峡谷内芳草遍地，溪流潺潺，时有云雾自谷内溢出，宛若现世桃源！', '纵深数公里、横宽和高差均逾千米的一座高山峡谷大舞台！', '《天门狐仙——新刘海砍樵》剧情来源于湖南民间故事和花鼓戏《刘海砍樵》，以此基础进行了艺术再创造，悲伤、欢乐、笑容、泪水交合成一个曲折动人的故事。整场演出体现人物细节，以个性化的叙事结构给人以亲近感和头尾呼应的完整感。汲取丰富的音乐文化元素和表现形式，辅之以现代的舞台特效技术，是对世界音乐歌舞剧的一次成功的创新，成为中国山水实景演出的划时代巨献。是一台有完整故事情节的山水实景音乐歌舞剧。舞台选址在天门山风景区山门口内至天门山顶的整条峡谷，总投资达到1.2亿元，演员队伍达530多人。主舞台以10000平米的玻璃钢打造的全景玻璃钢舞台。', '这幕剧由中国山水实景演出创始人、《印象·刘三姐》的总制作人梅帅元担任总导演，获得奥斯卡音乐大奖的华人作曲家谭盾担当音乐艺术总监，著名舞蹈家杨丽萍舞担任蹈总监。以高山奇峰为舞台背景、以山涧峡谷为表演舞台、有完整故事情节的音乐歌舞剧，该剧的特色是把山水树木情感化，做到人与自然合一，全剧共分为四幕。', '《天门狐仙--新刘海砍樵》狐王选妃，选中修炼千年的白狐仙，向往人间的生活，爱上贫穷快乐的樵夫刘海，两人在张家界天门山不期而遇，一段感天动地的人狐之恋就此开始。魔界与凡间的抗衡、道与情的取舍、仙与俗的矛盾如同大山重重阻隔着两颗相爱的心。悲伤、欢乐、笑容、泪水交合成一个曲折动人的故事。剧中，山寨吊脚楼的木门在晨曦里推开，劳作的汉子、打情骂俏的婆娘、快乐单纯的樵夫猎人、美丽多情的洗衣少女、动听的桑植民歌，一幅幅男耕女织的生活画面等构成美丽湘西的风情画卷，使观众恍若身临其境，融入其中。整场演出体现人物细节，以个性化的叙事结构给人以亲近感和头尾呼应的完整感。', '0', '2016-07-30 20:00:15');
INSERT INTO `viewticket_views_introductions` VALUES ('d904734a-9ee7-4785-8ef4-ebb645fad126', 'f36a12b5-f0a6-4ecd-bcf0-980c06542773', '云集三朝数代的历史人文景观！', '大峡谷中的飞瀑神泉比比皆是，植被繁茂，空气清新，凉爽舒适！', '峡谷内的栈道绵延数里，其上漫步，体会沧海桑田、领悟平淡人生、怡然自得！', '张家界大峡谷集山、水、洞于一身，是张家界地貌的博物馆，在这里可观赏到北温带喀斯特地形的全部风景！谷中猴群欢跃，百鸟争鸣，湖水清澈、群山倒蘸 ，鸳鸯戏水、空气清新。形态各异的瀑布群，把生命之源倾泻得淋漓尽致；随海拔变化的植物带，将四季更替演绎得如诗如歌；数条彩虹，百米梭板，千年风情，万米长廊，把峡谷内装扮得如画似锦。张家界大峡谷历史悠久，传说甚多，乃历代兵家必争之地，景区内有吴三桂和李自成残部李过指挥部的旧址，清兵入关以后，吴三桂率清兵和李过在此决战，每当下雨打雷天气，峡谷内便杀声震天、战马长啸、锣鼓齐鸣。中华第一保镖杜心武大侠自幼在此采药练武。峡谷内的栈道绵延数里，其上漫步，体会沧海桑田、领悟平淡人生、怡然自得。', '', '', '0', '2016-07-28 11:06:25');
