/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : onlineexam

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 24/11/2018 10:29:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `Status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 1正常0禁用',
  `CreateDate` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '10c4981bb793e1698a83aea43030a388', 1, 0);
INSERT INTO `admin` VALUES (2, 'ksadmin', 'e10adc3949ba59abbe56e057f20f883e', 1, 0);

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试名称',
  `Type` int(11) NOT NULL DEFAULT 0 COMMENT '考试类型，0为公共考试，不限题型',
  `IP` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP段',
  `Tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `Start` int(11) NOT NULL COMMENT '考试开始时间',
  `End` int(11) NOT NULL COMMENT '考试结束时间',
  `Org` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举办机构',
  `Description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试描述',
  `Status` smallint(2) NOT NULL DEFAULT 0 COMMENT '状态 0未发布 1发布',
  `Identifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识符密码',
  `Option` int(11) NOT NULL COMMENT '选择题个数',
  `Multiple` int(11) NOT NULL COMMENT '多选题个数',
  `Judge` int(11) NOT NULL COMMENT '判断题',
  `CreateDate` int(11) NOT NULL,
  `UploadExcel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'null' COMMENT '导入考生信息文件路径',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (1, '测试考试', 0, '', '15579135898', 1540256400, 1540263600, '江西聚才测评有限公司', '公共考试', 1, 'k4nldjvq', 2, 2, 2, 1540256779, 'Public/Upload/2018-10-23/5bceda49e1190.xls');

-- ----------------------------
-- Table structure for exam_record
-- ----------------------------
DROP TABLE IF EXISTS `exam_record`;
CREATE TABLE `exam_record`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ExamID` int(11) NOT NULL,
  `ExamineeID` int(11) NOT NULL,
  `Score` int(11) NOT NULL COMMENT '分数',
  `Status` int(11) NOT NULL DEFAULT 1,
  `CreateDate` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试记录' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of exam_record
-- ----------------------------
INSERT INTO `exam_record` VALUES (13, 1, 35, 6, 1, 0);
INSERT INTO `exam_record` VALUES (12, 1, 26, 2, 1, 0);
INSERT INTO `exam_record` VALUES (11, 1, 33, 6, 1, 0);
INSERT INTO `exam_record` VALUES (10, 1, 5, 0, 1, 0);

-- ----------------------------
-- Table structure for examination_pager
-- ----------------------------
DROP TABLE IF EXISTS `examination_pager`;
CREATE TABLE `examination_pager`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ExamID` int(11) NOT NULL COMMENT '考试ID',
  `Questions` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目',
  `Answers` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案',
  `Status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 0未发布 1发布',
  `CreateDate` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examination_pager
-- ----------------------------
INSERT INTO `examination_pager` VALUES (12, 1, '[{\"ID\":\"6\",\"Title\":\"1+2=?\",\"Options\":\"[\\\"A.3\\\",\\\"B.4\\\",\\\"C.2\\\",\\\"D.1\\\"]\",\"Type\":\"1\"},{\"ID\":\"5\",\"Title\":\"1+1=?\",\"Options\":\"[\\\"A.3\\\",\\\"B.4\\\",\\\"C.2\\\",\\\"D.1\\\"]\",\"Type\":\"1\"},{\"ID\":\"7\",\"Title\":\"\\u4ee5\\u4e0b\\u54ea\\u4e2a\\u7b49\\u5f0f\\u662f\\u6b63\\u786e\\u7684\",\"Options\":\"[\\\"A.1+1=2\\\",\\\"B.2+2=4\\\",\\\"C.4+1=1\\\",\\\"D.1+3=2\\\"]\",\"Type\":\"2\"},{\"ID\":\"8\",\"Title\":\"\\u4ee5\\u4e0b\\u54ea\\u4e2a\\u7b49\\u5f0f\\u662f\\u6b63\\u786e\\u7684\",\"Options\":\"[\\\"A.2+1=2\\\",\\\"B.6+2=4\\\",\\\"C.4-1=3\\\",\\\"D.3-2=1\\\"]\",\"Type\":\"2\"},{\"ID\":\"9\",\"Title\":\"3*3=8\",\"Options\":\"[\\\"A.\\\\u6b63\\\\u786e\\\",\\\"B.\\\\u9519\\\\u8bef\\\"]\",\"Type\":\"3\"},{\"ID\":\"10\",\"Title\":\"3\\/3=1\",\"Options\":\"[\\\"A.\\\\u6b63\\\\u786e\\\",\\\"B.\\\\u9519\\\\u8bef\\\"]\",\"Type\":\"3\"}]', '[{\"ID\":\"6\",\"Answer\":\"A\",\"Type\":\"1\"},{\"ID\":\"5\",\"Answer\":\"C\",\"Type\":\"1\"},{\"ID\":\"7\",\"Answer\":\"A,B\",\"Type\":\"2\"},{\"ID\":\"8\",\"Answer\":\"C,D\",\"Type\":\"2\"},{\"ID\":\"9\",\"Answer\":\"B\",\"Type\":\"3\"},{\"ID\":\"10\",\"Answer\":\"A\",\"Type\":\"3\"}]', 1, 1539944420);
INSERT INTO `examination_pager` VALUES (13, 4, '[{\"ID\":\"6\",\"Title\":\"1+2=?\",\"Options\":\"[\\\"A.3\\\",\\\"B.4\\\",\\\"C.2\\\",\\\"D.1\\\"]\",\"Type\":\"1\"},{\"ID\":\"5\",\"Title\":\"1+1=?\",\"Options\":\"[\\\"A.3\\\",\\\"B.4\\\",\\\"C.2\\\",\\\"D.1\\\"]\",\"Type\":\"1\"},{\"ID\":\"7\",\"Title\":\"\\u4ee5\\u4e0b\\u54ea\\u4e2a\\u7b49\\u5f0f\\u662f\\u6b63\\u786e\\u7684\",\"Options\":\"[\\\"A.1+1=2\\\",\\\"B.2+2=4\\\",\\\"C.4+1=1\\\",\\\"D.1+3=2\\\"]\",\"Type\":\"2\"},{\"ID\":\"8\",\"Title\":\"\\u4ee5\\u4e0b\\u54ea\\u4e2a\\u7b49\\u5f0f\\u662f\\u6b63\\u786e\\u7684\",\"Options\":\"[\\\"A.2+1=2\\\",\\\"B.6+2=4\\\",\\\"C.4-1=3\\\",\\\"D.3-2=1\\\"]\",\"Type\":\"2\"},{\"ID\":\"9\",\"Title\":\"3*3=8\",\"Options\":\"[\\\"A.\\\\u6b63\\\\u786e\\\",\\\"B.\\\\u9519\\\\u8bef\\\"]\",\"Type\":\"3\"},{\"ID\":\"10\",\"Title\":\"3\\/3=1\",\"Options\":\"[\\\"A.\\\\u6b63\\\\u786e\\\",\\\"B.\\\\u9519\\\\u8bef\\\"]\",\"Type\":\"3\"}]', '[{\"ID\":\"6\",\"Answer\":\"A\",\"Type\":\"1\"},{\"ID\":\"5\",\"Answer\":\"C\",\"Type\":\"1\"},{\"ID\":\"7\",\"Answer\":\"A,B\",\"Type\":\"2\"},{\"ID\":\"8\",\"Answer\":\"C,D\",\"Type\":\"2\"},{\"ID\":\"9\",\"Answer\":\"B\",\"Type\":\"3\"},{\"ID\":\"10\",\"Answer\":\"A\",\"Type\":\"3\"}]', 1, 1540187288);
INSERT INTO `examination_pager` VALUES (14, 4, '[{\"ID\":\"70\",\"Title\":\"\\u201c\\u56db\\u5b63\\u4e94\\u8865\\u201d\\u4e2d\\uff0c\\u201c\\u6ecb\\u8865\\u201d\\u662f\\u5728\\u54ea\\u4e2a\\u5b63\\u8282\\uff1f\",\"Options\":\"[\\\"A.\\\\u6625\\\\u5929\\\",\\\"B.\\\\u590f\\\\u5929\\\",\\\"C.\\\\u79cb\\\\u5929\\\",\\\"D.\\\\u51ac\\\\u5929\\\"]\",\"Type\":\"1\"},{\"ID\":\"71\",\"Title\":\"\\u4ec0\\u4e48\\u6811\\u88ab\\u79f0\\u4e3a\\u201c\\u6d3b\\u5316\\u77f3\\u201d\\uff1f\",\"Options\":\"[\\\"A.\\\\u94c1\\\\u6811\\\",\\\"B.\\\\u68a7\\\\u6850\\\\u6811\\\",\\\"C.\\\\u6768\\\\u6811\\\",\\\"D.\\\\u94f6\\\\u674f\\\\u6811\\\"]\",\"Type\":\"1\"},{\"ID\":\"66\",\"Title\":\"\\u4ee5\\u4e0b\\u5c5e\\u4e8e\\u56db\\u5ddd\\u81ea\\u7136\\u6587\\u5316\\u53cc\\u9057\\u5740\\u7684\\u662f\\uff1f\",\"Options\":\"[\\\"A.\\\\u9752\\\\u57ce\\\\u5c71-\\\\u90fd\\\\u6c5f\\\\u5830\\\",\\\"B.\\\\u4e5d\\\\u5be8\\\\u6c9f\\\",\\\"C.\\\\u9ec4\\\\u9f99\\\",\\\"D.\\\\u5ce8\\\\u7709\\\\u5c71-\\\\u4e50\\\\u5c71\\\\u5927\\\\u4f5b\\\"]\",\"Type\":\"1\"},{\"ID\":\"67\",\"Title\":\"\\u5df1\\u6240\\u4e0d\\u6b32\\u52ff\\u65bd\\u4e8e\\u4eba\\uff0c\\u51fa\\u81ea\\uff1f\",\"Options\":\"[\\\"A.\\\\u8bba\\\\u8bed\\\",\\\"B.\\\\u5b5f\\\\u5b50\\\",\\\"C.\\\\u8340\\\\u5b50\\\",\\\"D.\\\\u6625\\\\u79cb\\\"]\",\"Type\":\"1\"},{\"ID\":\"72\",\"Title\":\"\\u201c\\u95ed\\u6708\\u7f9e\\u82b1\\u201d\\u4e2d\\u7684\\u201c\\u95ed\\u6708\\u201d\\u662f\\u5173\\u4e8e\\u54ea\\u4f4d\\u7f8e\\u5973\\u7684\\u6545\\u4e8b\\uff1f\",\"Options\":\"[\\\"A.\\\\u897f\\\\u65bd\\\",\\\"B.\\\\u738b\\\\u662d\\\\u541b\\\",\\\"C.\\\\u8c82\\\\u8749\\\",\\\"D.\\\\u6768\\\\u8d35\\\\u5983\\\"]\",\"Type\":\"1\"},{\"ID\":\"69\",\"Title\":\"\\u6211\\u4eec\\u901a\\u5e38\\u8bf4\\u7684\\u201c\\u77e5\\u5929\\u547d\\u201d\\u6307\\u7684\\u662f\\u591a\\u5c11\\u5c81\\uff1f\",\"Options\":\"[\\\"A.30\\\",\\\"B.40\\\",\\\"C.50\\\",\\\"D.60\\\"]\",\"Type\":\"1\"},{\"ID\":\"68\",\"Title\":\"\\u5367\\u9f99\\u5148\\u751f\\u6307\\u7684\\u662f\\uff1f\",\"Options\":\"[\\\"A.\\\\u5218\\\\u5907\\\",\\\"B.\\\\u66f9\\\\u64cd\\\",\\\"C.\\\\u8bf8\\\\u845b\\\\u4eae\\\",\\\"D.\\\\u5f20\\\\u98de\\\"]\",\"Type\":\"1\"},{\"ID\":\"65\",\"Title\":\"\\u4e94\\u5cb3\\uff0c\\u662f\\u4e2d\\u56fd\\u4e94\\u5927\\u540d\\u5c71\\u7684\\u603b\\u79f0\\uff0c\\u4ee5\\u4e0b\\u54ea\\u4e2a\\u9009\\u9879\\u4e0d\\u5c5e\\u4e8e\\u4e94\\u5cb3\\uff1f\",\"Options\":\"[\\\"A.\\\\u5ce8\\\\u7709\\\",\\\"B.\\\\u6052\\\\u5c71\\\",\\\"C.\\\\u8861\\\\u5c71\\\",\\\"D.\\\\u6cf0\\\\u5c71\\\"]\",\"Type\":\"1\"},{\"ID\":\"63\",\"Title\":\"\\u4e0b\\u5217\\u8282\\u6c14\\u4e0d\\u5728\\u6625\\u5b63\\u7684\\u662f\\uff1f\",\"Options\":\"[\\\"A.\\\\u8c37\\\\u96e8\\\",\\\"B.\\\\u60ca\\\\u86f0\\\",\\\"C.\\\\u6e05\\\\u660e\\\",\\\"D.\\\\u767d\\\\u9732\\\"]\",\"Type\":\"1\"},{\"ID\":\"64\",\"Title\":\"\\u6c11\\u95f4\\u6545\\u4e8b\\u300a\\u6881\\u795d\\u300b\\u7a81\\u51fa\\u53cd\\u6620\\u4e86\\u6211\\u56fd\\u73b0\\u884c\\u300a\\u5a5a\\u59fb\\u6cd5\\u300b\\u7684\\u54ea\\u4e9b\\u5236\\u5ea6\\uff1f\",\"Options\":\"[\\\"A.\\\\u7537\\\\u5973\\\\u5e73\\\\u7b49\\\",\\\"B.\\\\u4e00\\\\u592b\\\\u4e00\\\\u59bb\\\",\\\"C.\\\\u5a5a\\\\u59fb\\\\u81ea\\\\u7531\\\",\\\"D.\\\\u4fdd\\\\u62a4\\\\u5987\\\\u5973\\\"]\",\"Type\":\"1\"}]', '[{\"ID\":\"70\",\"Answer\":\"D\",\"Type\":\"1\"},{\"ID\":\"71\",\"Answer\":\"D\",\"Type\":\"1\"},{\"ID\":\"66\",\"Answer\":\"D\",\"Type\":\"1\"},{\"ID\":\"67\",\"Answer\":\"A\",\"Type\":\"1\"},{\"ID\":\"72\",\"Answer\":\"C\",\"Type\":\"1\"},{\"ID\":\"69\",\"Answer\":\"C\",\"Type\":\"1\"},{\"ID\":\"68\",\"Answer\":\"C\",\"Type\":\"1\"},{\"ID\":\"65\",\"Answer\":\"A\",\"Type\":\"1\"},{\"ID\":\"63\",\"Answer\":\"A\",\"Type\":\"1\"},{\"ID\":\"64\",\"Answer\":\"C\",\"Type\":\"1\"}]', 1, 1540256629);
INSERT INTO `examination_pager` VALUES (15, 1, '[{\"ID\":\"70\",\"Title\":\"\\u201c\\u56db\\u5b63\\u4e94\\u8865\\u201d\\u4e2d\\uff0c\\u201c\\u6ecb\\u8865\\u201d\\u662f\\u5728\\u54ea\\u4e2a\\u5b63\\u8282\\uff1f\",\"Options\":\"[\\\"A.\\\\u6625\\\\u5929\\\",\\\"B.\\\\u590f\\\\u5929\\\",\\\"C.\\\\u79cb\\\\u5929\\\",\\\"D.\\\\u51ac\\\\u5929\\\"]\",\"Type\":\"1\"},{\"ID\":\"71\",\"Title\":\"\\u4ec0\\u4e48\\u6811\\u88ab\\u79f0\\u4e3a\\u201c\\u6d3b\\u5316\\u77f3\\u201d\\uff1f\",\"Options\":\"[\\\"A.\\\\u94c1\\\\u6811\\\",\\\"B.\\\\u68a7\\\\u6850\\\\u6811\\\",\\\"C.\\\\u6768\\\\u6811\\\",\\\"D.\\\\u94f6\\\\u674f\\\\u6811\\\"]\",\"Type\":\"1\"}]', '[{\"ID\":\"70\",\"Answer\":\"D\",\"Type\":\"1\"},{\"ID\":\"71\",\"Answer\":\"D\",\"Type\":\"1\"}]', 1, 1540257972);
INSERT INTO `examination_pager` VALUES (16, 1, '[{\"ID\":\"70\",\"Title\":\"\\u201c\\u56db\\u5b63\\u4e94\\u8865\\u201d\\u4e2d\\uff0c\\u201c\\u6ecb\\u8865\\u201d\\u662f\\u5728\\u54ea\\u4e2a\\u5b63\\u8282\\uff1f\",\"Options\":\"[\\\"A.\\\\u6625\\\\u5929\\\",\\\"B.\\\\u590f\\\\u5929\\\",\\\"C.\\\\u79cb\\\\u5929\\\",\\\"D.\\\\u51ac\\\\u5929\\\"]\",\"Type\":\"1\"},{\"ID\":\"71\",\"Title\":\"\\u4ec0\\u4e48\\u6811\\u88ab\\u79f0\\u4e3a\\u201c\\u6d3b\\u5316\\u77f3\\u201d\\uff1f\",\"Options\":\"[\\\"A.\\\\u94c1\\\\u6811\\\",\\\"B.\\\\u68a7\\\\u6850\\\\u6811\\\",\\\"C.\\\\u6768\\\\u6811\\\",\\\"D.\\\\u94f6\\\\u674f\\\\u6811\\\"]\",\"Type\":\"1\"}]', '[{\"ID\":\"70\",\"Answer\":\"D\",\"Type\":\"1\"},{\"ID\":\"71\",\"Answer\":\"D\",\"Type\":\"1\"}]', 1, 1540258162);
INSERT INTO `examination_pager` VALUES (17, 1, '[{\"ID\":\"70\",\"Title\":\"\\u201c\\u56db\\u5b63\\u4e94\\u8865\\u201d\\u4e2d\\uff0c\\u201c\\u6ecb\\u8865\\u201d\\u662f\\u5728\\u54ea\\u4e2a\\u5b63\\u8282\\uff1f\",\"Options\":\"[\\\"A.\\\\u6625\\\\u5929\\\",\\\"B.\\\\u590f\\\\u5929\\\",\\\"C.\\\\u79cb\\\\u5929\\\",\\\"D.\\\\u51ac\\\\u5929\\\"]\",\"Type\":\"1\"},{\"ID\":\"71\",\"Title\":\"\\u4ec0\\u4e48\\u6811\\u88ab\\u79f0\\u4e3a\\u201c\\u6d3b\\u5316\\u77f3\\u201d\\uff1f\",\"Options\":\"[\\\"A.\\\\u94c1\\\\u6811\\\",\\\"B.\\\\u68a7\\\\u6850\\\\u6811\\\",\\\"C.\\\\u6768\\\\u6811\\\",\\\"D.\\\\u94f6\\\\u674f\\\\u6811\\\"]\",\"Type\":\"1\"}]', '[{\"ID\":\"70\",\"Answer\":\"D\",\"Type\":\"1\"},{\"ID\":\"71\",\"Answer\":\"D\",\"Type\":\"1\"}]', 1, 1540258809);
INSERT INTO `examination_pager` VALUES (18, 3, '[{\"ID\":\"70\",\"Title\":\"\\u201c\\u56db\\u5b63\\u4e94\\u8865\\u201d\\u4e2d\\uff0c\\u201c\\u6ecb\\u8865\\u201d\\u662f\\u5728\\u54ea\\u4e2a\\u5b63\\u8282\\uff1f\",\"Options\":\"[\\\"A.\\\\u6625\\\\u5929\\\",\\\"B.\\\\u590f\\\\u5929\\\",\\\"C.\\\\u79cb\\\\u5929\\\",\\\"D.\\\\u51ac\\\\u5929\\\"]\",\"Type\":\"1\"},{\"ID\":\"71\",\"Title\":\"\\u4ec0\\u4e48\\u6811\\u88ab\\u79f0\\u4e3a\\u201c\\u6d3b\\u5316\\u77f3\\u201d\\uff1f\",\"Options\":\"[\\\"A.\\\\u94c1\\\\u6811\\\",\\\"B.\\\\u68a7\\\\u6850\\\\u6811\\\",\\\"C.\\\\u6768\\\\u6811\\\",\\\"D.\\\\u94f6\\\\u674f\\\\u6811\\\"]\",\"Type\":\"1\"},{\"ID\":\"66\",\"Title\":\"\\u4ee5\\u4e0b\\u5c5e\\u4e8e\\u56db\\u5ddd\\u81ea\\u7136\\u6587\\u5316\\u53cc\\u9057\\u5740\\u7684\\u662f\\uff1f\",\"Options\":\"[\\\"A.\\\\u9752\\\\u57ce\\\\u5c71-\\\\u90fd\\\\u6c5f\\\\u5830\\\",\\\"B.\\\\u4e5d\\\\u5be8\\\\u6c9f\\\",\\\"C.\\\\u9ec4\\\\u9f99\\\",\\\"D.\\\\u5ce8\\\\u7709\\\\u5c71-\\\\u4e50\\\\u5c71\\\\u5927\\\\u4f5b\\\"]\",\"Type\":\"1\"},{\"ID\":\"67\",\"Title\":\"\\u5df1\\u6240\\u4e0d\\u6b32\\u52ff\\u65bd\\u4e8e\\u4eba\\uff0c\\u51fa\\u81ea\\uff1f\",\"Options\":\"[\\\"A.\\\\u8bba\\\\u8bed\\\",\\\"B.\\\\u5b5f\\\\u5b50\\\",\\\"C.\\\\u8340\\\\u5b50\\\",\\\"D.\\\\u6625\\\\u79cb\\\"]\",\"Type\":\"1\"},{\"ID\":\"72\",\"Title\":\"\\u201c\\u95ed\\u6708\\u7f9e\\u82b1\\u201d\\u4e2d\\u7684\\u201c\\u95ed\\u6708\\u201d\\u662f\\u5173\\u4e8e\\u54ea\\u4f4d\\u7f8e\\u5973\\u7684\\u6545\\u4e8b\\uff1f\",\"Options\":\"[\\\"A.\\\\u897f\\\\u65bd\\\",\\\"B.\\\\u738b\\\\u662d\\\\u541b\\\",\\\"C.\\\\u8c82\\\\u8749\\\",\\\"D.\\\\u6768\\\\u8d35\\\\u5983\\\"]\",\"Type\":\"1\"},{\"ID\":\"69\",\"Title\":\"\\u6211\\u4eec\\u901a\\u5e38\\u8bf4\\u7684\\u201c\\u77e5\\u5929\\u547d\\u201d\\u6307\\u7684\\u662f\\u591a\\u5c11\\u5c81\\uff1f\",\"Options\":\"[\\\"A.30\\\",\\\"B.40\\\",\\\"C.50\\\",\\\"D.60\\\"]\",\"Type\":\"1\"},{\"ID\":\"68\",\"Title\":\"\\u5367\\u9f99\\u5148\\u751f\\u6307\\u7684\\u662f\\uff1f\",\"Options\":\"[\\\"A.\\\\u5218\\\\u5907\\\",\\\"B.\\\\u66f9\\\\u64cd\\\",\\\"C.\\\\u8bf8\\\\u845b\\\\u4eae\\\",\\\"D.\\\\u5f20\\\\u98de\\\"]\",\"Type\":\"1\"},{\"ID\":\"65\",\"Title\":\"\\u4e94\\u5cb3\\uff0c\\u662f\\u4e2d\\u56fd\\u4e94\\u5927\\u540d\\u5c71\\u7684\\u603b\\u79f0\\uff0c\\u4ee5\\u4e0b\\u54ea\\u4e2a\\u9009\\u9879\\u4e0d\\u5c5e\\u4e8e\\u4e94\\u5cb3\\uff1f\",\"Options\":\"[\\\"A.\\\\u5ce8\\\\u7709\\\",\\\"B.\\\\u6052\\\\u5c71\\\",\\\"C.\\\\u8861\\\\u5c71\\\",\\\"D.\\\\u6cf0\\\\u5c71\\\"]\",\"Type\":\"1\"},{\"ID\":\"63\",\"Title\":\"\\u4e0b\\u5217\\u8282\\u6c14\\u4e0d\\u5728\\u6625\\u5b63\\u7684\\u662f\\uff1f\",\"Options\":\"[\\\"A.\\\\u8c37\\\\u96e8\\\",\\\"B.\\\\u60ca\\\\u86f0\\\",\\\"C.\\\\u6e05\\\\u660e\\\",\\\"D.\\\\u767d\\\\u9732\\\"]\",\"Type\":\"1\"},{\"ID\":\"64\",\"Title\":\"\\u6c11\\u95f4\\u6545\\u4e8b\\u300a\\u6881\\u795d\\u300b\\u7a81\\u51fa\\u53cd\\u6620\\u4e86\\u6211\\u56fd\\u73b0\\u884c\\u300a\\u5a5a\\u59fb\\u6cd5\\u300b\\u7684\\u54ea\\u4e9b\\u5236\\u5ea6\\uff1f\",\"Options\":\"[\\\"A.\\\\u7537\\\\u5973\\\\u5e73\\\\u7b49\\\",\\\"B.\\\\u4e00\\\\u592b\\\\u4e00\\\\u59bb\\\",\\\"C.\\\\u5a5a\\\\u59fb\\\\u81ea\\\\u7531\\\",\\\"D.\\\\u4fdd\\\\u62a4\\\\u5987\\\\u5973\\\"]\",\"Type\":\"1\"}]', '[{\"ID\":\"70\",\"Answer\":\"D\",\"Type\":\"1\"},{\"ID\":\"71\",\"Answer\":\"D\",\"Type\":\"1\"},{\"ID\":\"66\",\"Answer\":\"D\",\"Type\":\"1\"},{\"ID\":\"67\",\"Answer\":\"A\",\"Type\":\"1\"},{\"ID\":\"72\",\"Answer\":\"C\",\"Type\":\"1\"},{\"ID\":\"69\",\"Answer\":\"C\",\"Type\":\"1\"},{\"ID\":\"68\",\"Answer\":\"C\",\"Type\":\"1\"},{\"ID\":\"65\",\"Answer\":\"A\",\"Type\":\"1\"},{\"ID\":\"63\",\"Answer\":\"A\",\"Type\":\"1\"},{\"ID\":\"64\",\"Answer\":\"C\",\"Type\":\"1\"}]', 1, 1540262118);

-- ----------------------------
-- Table structure for examinee
-- ----------------------------
DROP TABLE IF EXISTS `examinee`;
CREATE TABLE `examinee`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ExamID` int(11) NOT NULL COMMENT '考试ID',
  `ClassID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报考岗位代码',
  `Agency` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报考岗位名称',
  `ZKDW` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '招考单位',
  `Username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `Password` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '密码，默认为null',
  `Sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `Brithday` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生日',
  `Photo` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人照片',
  `Identity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `Tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码',
  `ZKZH` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '准考证号',
  `KCH` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考场号',
  `ZWH` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '座位号',
  `KDMC` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考点名称',
  `KDDZ` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考点地点',
  `KSRQ` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试日期',
  `KSQZSJ` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试起止时间',
  `KSKM` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试科目',
  `Status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 0禁止 1正常 默认为1',
  `Score` int(11) NULL DEFAULT NULL COMMENT '分数',
  `CreateDate` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Examinee' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examinee
-- ----------------------------
INSERT INTO `examinee` VALUES (74, 1, '测试考试', '101', '比特犬测试公司', 'user5', '', '男', '1999-01-05', 'hhfdad', '40000000001445455', '13255484140', '10101010101', '1', '5', '云中城考点', '紫阳大道', '2018-10-23', '09：00-11:00', '语文', 1, NULL, 1540282954);
INSERT INTO `examinee` VALUES (75, 1, '测试考试', '101', '比特犬测试公司', 'user6', '', '男', '1999-01-06', 'hhfdad', '40000000001445456', '13255484140', '10101010101', '1', '6', '云中城考点', '紫阳大道', '2018-10-23', '09：00-11:00', '语文', 1, NULL, 1540282954);
INSERT INTO `examinee` VALUES (76, 1, '测试考试', '101', '比特犬测试公司', 'user7', '', '男', '1999-01-07', 'hhfdad', '40000000001445457', '13255484140', '10101010101', '1', '7', '云中城考点', '紫阳大道', '2018-10-23', '09：00-11:00', '语文', 1, NULL, 1540282954);
INSERT INTO `examinee` VALUES (73, 1, '测试考试', '101', '比特犬测试公司', 'user4', '', '男', '1999-01-04', 'hhfdad', '40000000001445454', '13255484140', '10101010101', '1', '4', '云中城考点', '紫阳大道', '2018-10-23', '09：00-11:00', '语文', 1, NULL, 1540282954);
INSERT INTO `examinee` VALUES (72, 1, '测试考试', '101', '比特犬测试公司', 'user3', '', '男', '1999-01-03', 'hhfdad', '40000000001445453', '13255484140', '10101010101', '1', '3', '云中城考点', '紫阳大道', '2018-10-23', '09：00-11:00', '语文', 1, NULL, 1540282954);
INSERT INTO `examinee` VALUES (70, 1, '测试考试', '101', '比特犬测试公司', 'user1', '', '男', '1999-01-01', 'hhfdad', '40000000001445451', '13255484140', '10101010101', '1', '1', '云中城考点', '紫阳大道', '2018-10-23', '09：00-11:00', '语文', 1, NULL, 1540282954);
INSERT INTO `examinee` VALUES (71, 1, '测试考试', '101', '比特犬测试公司', 'user2', '', '男', '1999-01-02', 'hhfdad', '40000000001445452', '13255484140', '10101010101', '1', '2', '云中城考点', '紫阳大道', '2018-10-23', '09：00-11:00', '语文', 1, NULL, 1540282954);

-- ----------------------------
-- Table structure for knowledge
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '知识点名称',
  `SubjectID` int(11) NOT NULL COMMENT '所属科目',
  `GradeID` int(11) NULL DEFAULT NULL COMMENT '等级',
  `Status` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  `CreateDate` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '知识点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
INSERT INTO `knowledge` VALUES (1, '函数', 1, 2, 1, 1542352839);
INSERT INTO `knowledge` VALUES (2, '变量', 1, 2, 1, 1542353481);
INSERT INTO `knowledge` VALUES (3, '数据结构', 1, 2, 1, 1542696927);
INSERT INTO `knowledge` VALUES (4, '数组', 1, 2, 1, 1542697273);
INSERT INTO `knowledge` VALUES (5, '循环', 1, 2, 1, 1542697379);

-- ----------------------------
-- Table structure for knowledge_qs
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_qs`;
CREATE TABLE `knowledge_qs`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KnowledgeID` int(11) NOT NULL COMMENT '知识点ID',
  `GradeID` int(11) NOT NULL COMMENT '等级ID',
  `SubjectID` int(11) NOT NULL COMMENT '科目ID',
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目',
  `Options` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目选项',
  `Answer` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案ABCD',
  `Type` int(11) NOT NULL COMMENT '1单选题 2多选题 3判断题 4主观题',
  `Status` int(11) NULL DEFAULT 1 COMMENT '0不可用 1可用',
  `Mode` int(11) NOT NULL DEFAULT 0 COMMENT '考试类型，0为公共考试，不限题型',
  `Analysis` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '解析',
  `Degree` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '易' COMMENT '难中易',
  `CreateDate` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试题目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_qs
-- ----------------------------
INSERT INTO `knowledge_qs` VALUES (88, 2, 2, 1, '1+2=?', '[\"3\",\"4\",\"2\",\"1\"]', 'A', 1, 1, 0, '因为1个加上1个是2个，再加上一个是3个', '中', 1542592518);
INSERT INTO `knowledge_qs` VALUES (87, 2, 2, 1, '1+1=?', '[\"3\",\"4\",\"2\",\"1\"]', 'C', 1, 1, 0, '因为1个加上1个是2个，所以正确答案是C。', '难', 1542597182);
INSERT INTO `knowledge_qs` VALUES (89, 3, 2, 1, '在（）时期，劳动者与劳动中的智慧完全分离，成为机器的附属品。', '[\"\\u7ecf\\u9a8c\\u7ba1\\u7406\",\"\\u79d1\\u5b66\\u7ba1\\u7406\",\"\\uff0e\\u73b0\\u4ee3\\u7ba1\\u7406\",\"\\uff0e\\u540e\\u73b0\\u4ee3\\u7ba1\\u7406\"]', 'A', 1, 1, 0, NULL, '难', 1542779125);
INSERT INTO `knowledge_qs` VALUES (90, 3, 2, 1, '专职的人事主管和人事管理部门出现在（）', '[\"\\uff0e\\u73b0\\u4ee3\\u4eba\\u529b\\u8d44\\u6e90\\u7ba1\\u7406\\u9ad8\\u7ea7\\u9636\\u6bb5\",\"\\uff0e\\u73b0\\u4ee3\\u4eba\\u529b\\u8d44\\u6e90\\u7ba1\\u7406\\u7531\\u521d\\u7ea7\\u5411\\u9ad8\\u9636\\u53d1\\u5c55\\u9636\\u6bb5\",\"\\uff0e\\u73b0\\u4ee3\\u4eba\\u529b\\u8d44\\u6e90\\u7ba1\\u7406\\u66ff\\u4ee3\\u4f20\\u7edf\\u7ba1\\u4eba\\u4e8b\\u7ba1\\u7406\\u9636\\u6bb5\",\"\\uff0e\\u4f20\\u7edf\\u4eba\\u529b\\u8d44\\u6e90\\u7ba1\\u7406\\u7531\\u840c\\u82bd\\u5230\\u6210\\u957f\\u7684\\u8fc5\\u901f\\u53d1\\u5c55\\u5f00\\u9636\\u6bb5\"]', 'B', 1, 1, 0, NULL, '中', 1542779125);
INSERT INTO `knowledge_qs` VALUES (91, 3, 2, 1, '某知名快递集团公司借助品牌优势打造以优质安全美食为主的网购商城，这属于企业集团的（）优势', '[\"\\uff0e\\u89c4\\u6a21\\u7ecf\\u6d4e\",\"\\uff0e\\u5206\\u5de5\\u534f\\u4f5c\",\"\\uff0e\\u6280\\u672f\\u521b\\u65b0\",\"\\uff0e\\u65e0\\u5f62\\u8d44\\u4ea7\\u5171\\u4eab\"]', 'D', 1, 1, 0, NULL, '中', 1542779125);
INSERT INTO `knowledge_qs` VALUES (92, 0, 2, 1, '（）不是由股东大会选举产生', '[\"\\uff0e\\u8463\\u4e8b\\u4f1a\",\"\\uff0e\\u7ecf\\u7406\\u73ed\\u5b50\",\"\\uff0e\\u76d1\\u4e8b\\u4f1a\",\"\\uff0e\\u804c\\u80fd\\u90e8\\u95e8\\u8d1f\\u8d23\\u4eba\"]', 'D', 1, 1, 0, NULL, '中', 1542779125);
INSERT INTO `knowledge_qs` VALUES (93, 3, 2, 1, '（）是落实管控职能和业务，保证集团战略目标实现的手段', '[\"\\uff0e\\u7ba1\\u63a7\\u4f53\\u7cfb\",\"\\uff0e\\u804c\\u80fd\\u548c\\u4e1a\\u52a1\\u7ba1\\u63a7\",\"\\uff0e\\u7ba1\\u63a7\\u673a\\u5236\",\"\\uff0e\\u7ba1\\u63a7\\u57fa\\u7840\"]', 'C', 1, 1, 0, NULL, '中', 1542779125);
INSERT INTO `knowledge_qs` VALUES (94, 3, 2, 1, '（）不属于U型组织结构', '[\"\\uff0e\\u76f4\\u7ebf\\u578b\",\"\\uff0e\\u804c\\u80fd\\u5236\",\"\\uff0e\\u76f4\\u7ebf\\u804c\\u80fd\\u5236\",\"\\uff0e\\u4e8b\\u4e1a\\u90e8\\u5236\"]', 'D', 1, 1, 0, NULL, '中', 1542779125);
INSERT INTO `knowledge_qs` VALUES (95, 3, 2, 1, '企业集团组织结构再设计过程中，了解现行组织结构的运行效率属于（）阶段的任务', '[\"\\uff0e\\u7ec4\\u7ec7\\u7ed3\\u6784\\u8bca\\u65ad\\u5206\\u6790\",\"\\uff0e\\u7ec4\\u7ec7\\u7ed3\\u6784\\u518d\\u8bbe\\u8ba1\",\"\\uff0e\\u5236\\u5ea6\\u4f53\\u7cfb\\u5065\\u5168\\u5b8c\\u5584\",\"\\uff0e\\u7ec4\\u7ec7\\u8fd0\\u884c\\u53cd\\u9988\\u8c03\\u6574\"]', 'A', 1, 1, 0, NULL, '易', 1542779125);
INSERT INTO `knowledge_qs` VALUES (96, 3, 2, 1, '集团总部部门的定位方法中，（）采用了岗位评价的思路和方法。', '[\"\\uff0e\\u6bd4\\u8f83\\u53c2\\u7167\\u6cd5\",\"\\uff0e\\u6807\\u6746\\u6cd5\",\"\\uff0e\\u8981\\u7d20\\u8bc4\\u4ef7\\u6cd5\",\"\\uff0e\\u8d23\\u4efb\\u6743\\u9650\\u5b9a\\u4f4d\\u6cd5\"]', 'C', 1, 1, 0, NULL, '易', 1542779125);
INSERT INTO `knowledge_qs` VALUES (97, 3, 2, 1, '按照区分标准的不同，胜任特征可以分为鉴别性胜任特征和()。', '[\"\\u5143\\u80dc\\u4efb\\u7279\\u5f81\",\"\\u6982\\u5ff5\\u6027\\u80dc\\u4efb\\u7279\\u5f81\",\"\\u901a\\u7528\\u6027\\u80dc\\u4efb\\u7279\\u5f81\",\"\\u57fa\\u7840\\u6027\\u80dc\\u4efb\\u7279\\u5f81\"]', 'D', 1, 1, 0, NULL, '易', 1542779125);
INSERT INTO `knowledge_qs` VALUES (98, 3, 2, 1, '构建某岗位的胜任特征模型时，选取分析效标样本应（）', '[\" \\u968f\\u673a\\u62bd\\u53d6\\u5458\\u5de5\",\" \\u62bd\\u53d6\\u7ee9\\u6548\\u4f18\\u79c0\\u5458\\u5de5\",\" \\u62bd\\u53d6\\u7ee9\\u6548\\u4f18\\u79c0\\u5458\\u5de5\\u548c\\u7ee9\\u6548\\u4e00\\u822c\\u5458\\u5de5\",\" \\u62bd\\u53d6\\u7ee9\\u6548\\u4f18\\u79c0\\u5458\\u5de5\\u548c\\u7ee9\\u6548\\u8f83\\u5dee\\u5458\\u5de5\"]', 'A', 1, 1, 0, NULL, '易', 1542779125);
INSERT INTO `knowledge_qs` VALUES (99, 3, 2, 1, '胜任特征模型研究中，T检验是为了（）', '[\" \\u5bf9\\u80dc\\u4efb\\u7279\\u5f81\\u8fdb\\u884c\\u5206\\u7ea7\\u548c\\u754c\\u5b9a\",\" \\u5bf9\\u80dc\\u4efb\\u7279\\u5f81\\u6307\\u6807\\u8fdb\\u884c\\u5206\\u6790\\u5f52\\u7c7b\",\" \\u7814\\u7a76\\u80dc\\u4efb\\u7279\\u5f81\\u6307\\u6807\\u91cd\\u53e0\\u6027\\u95ee\\u9898\",\" \\u6bd4\\u8f83\\u6837\\u672c\\u7279\\u5b9a\\u6307\\u6807\\u6570\\u503c\\u7684\\u5dee\\u5f02\\u95ee\\u9898\"]', 'D', 1, 1, 0, NULL, '易', 1542779125);
INSERT INTO `knowledge_qs` VALUES (100, 3, 2, 1, '沙盘抽演测评法操作中，阶段小结的时间一般为（）', '[\" 5-15\\u5206\\u949f\",\" 15-30\\u5206\\u949f\",\" 30\\u5206\\u949f-1\\u5c0f\\u65f6\",\" 1\\u5c0f\\u65f6\\u4ee5\\u4e0a\"]', 'B', 1, 1, 0, NULL, '易', 1542779125);
INSERT INTO `knowledge_qs` VALUES (101, 3, 2, 1, '每一种个性特征都可以成为对外界刺激的一种习惯性反应，这是个性的（）', '[\" \\u72ec\\u7279\\u6027\",\" \\u4e00\\u81f4\\u6027\",\" \\u7a33\\u5b9a\\u6027\",\" \\u7279\\u5f81\\u6027\"]', 'D', 1, 1, 0, NULL, '易', 1542779125);
INSERT INTO `knowledge_qs` VALUES (102, 3, 2, 1, '选拔晋升候选人的方法不包括（）', '[\" \\u7efc\\u5408\\u52a0\\u6743\\u6cd5\",\" \\u914d\\u5bf9\\u6bd4\\u8f83\\u6cd5\",\" \\u8bc4\\u4ef7\\u4e2d\\u5fc3\\u6cd5\",\" \\u5347\\u7b49\\u8003\\u8bd5\\u6cd5\"]', 'A', 1, 1, 0, NULL, '易', 1542779125);
INSERT INTO `knowledge_qs` VALUES (103, 3, 2, 1, '( ) 适合用360度考评方法进行考核', '[\"KPI\",\"PI\",\"PPU\",\"\\u7565\"]', 'B', 1, 1, 0, NULL, '易', 1542779125);
INSERT INTO `knowledge_qs` VALUES (104, 3, 2, 1, '团队绩效考评指标体系中，（）一般不占权重', '[\"\\uff0e\\u4e3b\\u8981\\u6307\\u6807\",\"\\uff0e\\u6574\\u4f53\\u6307\\u6807\",\"\\uff0e\\u8f85\\u52a9\\u6307\\u6807\",\"\\uff0e\\u5426\\u51b3\\u6307\\u6807\"]', 'D', 1, 1, 0, NULL, '难', 1542779125);
INSERT INTO `knowledge_qs` VALUES (105, 3, 2, 1, '绩效面读方式中，（）更有助于促进员工潜能开发和全面发展', '[\"\\uff0e\\u5355\\u5411\\u529d\\u5bfc\\u5f0f\\u9762\\u8bfb\",\"\\uff0e\\u53cc\\u5411\\u503e\\u542c\\u5f0f\\u9762\\u8bfb\",\"\\uff0e\\u89e3\\u51b3\\u95ee\\u9898\\u5f0f\\u9762\\u8bfb\",\"\\uff0e\\u7efc\\u5408\\u5f0f\\u7ee9\\u6548\\u9762\\u8bfb\"]', 'C', 1, 1, 0, NULL, '难', 1542779125);
INSERT INTO `knowledge_qs` VALUES (106, 3, 2, 1, '总体评价法中，（）可以检查绩效管理系统在人事决策和员工开发两个方面实际发挥的作用', '[\"\\uff0e\\u7ed3\\u6784\\u5206\\u6790\",\"\\uff0e\\u529f\\u80fd\\u5206\\u6790\",\"\\uff0e\\u65b9\\u6cd5\\u5206\\u6790\",\"\\uff0e\\u7ed3\\u679c\\u5206\\u6790\"]', 'B', 1, 1, 0, NULL, '难', 1542779125);
INSERT INTO `knowledge_qs` VALUES (107, 3, 2, 1, '（）与工作岗位或技能的关系最紧密', '[\"\\uff0e\\u57fa\\u672c\\u5de5\\u8d44\",\"\\uff0e\\u7ee9\\u6548\\u5de5\\u8d44\",\"\\uff0e\\u6fc0\\u52b1\\u5de5\\u8d44\",\"\\uff0e\\u4fdd\\u9669\\u798f\\u5229\"]', 'A', 1, 1, 0, NULL, '难', 1542779125);
INSERT INTO `knowledge_qs` VALUES (108, 3, 2, 1, '（）是保持企业薪酬战略方向正确，促进薪酬战略目标实现的基本保障', '[\"\\uff0e\\u5185\\u90e8\\u4e00\\u81f4\\u6027\",\"\\uff0e\\u5916\\u90e8\\u7ade\\u4e89\\u529b\",\"\\uff0e\\u5458\\u5de5\\u8d21\\u732e\\u7387\",\"\\uff0e\\u85aa\\u916c\\u653f\\u7b56\\u5de5\\u7b56\\u7565\"]', 'D', 1, 1, 0, NULL, '难', 1542779125);
INSERT INTO `knowledge_qs` VALUES (109, 3, 2, 1, '资源基础理论认为组织存在的基本资源包话（）', '[\"\\u7269\\u8d28\\u8d44\\u6e90\",\"\\u7ba1\\u7406\\u8d44\\u6e90\",\"\\u7ec4\\u7ec7\\u8d44\\u6e90\",\"\\u4eba\\u529b\\u8d44\\u6e90\",\"\\u73af\\u5883\\u8d44\\u6e90\"]', 'A,C,D', 2, 1, 0, NULL, '难', 1542779138);
INSERT INTO `knowledge_qs` VALUES (110, 3, 2, 1, '劳动市场运作过程是（）之间交互影响和作用的过程', '[\"\\u653f\\u5e9c\",\"\\u6c42\\u804c\\u53bb\\u5411\\u4e0d\\u660e\",\"\\u751f\\u4ea7\\u8d44\\u6599\",\"\\u7528\\u4eba\\u5355\\u4f4d\",\"\\u793e\\u4f1a\\u4e2d\\u4ef7\\u7ec4\\u7ec7\"]', 'A,B,D,E', 2, 1, 0, NULL, '难', 1542779138);
INSERT INTO `knowledge_qs` VALUES (111, 3, 2, 1, '当外部环境遇到良好机遇时，企业可认采用（）', '[\"\\u626d\\u8f6c\\u578b\\u6218\\u7565\",\"\\u8ddf\\u968f\\u578b\\u6218\\u7565\",\"\\u8fdb\\u653b\\u578b\\u6218\\u7565\",\"\\u9632\\u5fa1\\u578b\\u6218\\u7565\",\"\\u591a\\u6837\\u578b\\u6218\\u7565\"]', 'A,C', 2, 1, 0, NULL, '难', 1542779138);
INSERT INTO `knowledge_qs` VALUES (112, 3, 2, 1, '关于企业集团，下列说法正确的有（）', '[\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u5177\\u6709\\u591a\\u5c42\\u6b21\\u7ed3\\u6784\",\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u5177\\u5907\\u603b\\u4f53\\u6cd5\\u4eba\\u5730\\u4f4d\",\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u7684\\u6838 \\u5fc3\\u5c42\\u5c31\\u662f\\u96c6\\u56e2\\u516c\\u53f8\",\"\\u4ea7\\u6743\\u662f\\u4f01\\u4e1a\\u96c6\\u56e2\\u552f\\u4e00\\u7684\\u8054\\u7ed3\\u7ebd\\u5e26\",\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u662f\\u591a\\u4e2a\\u6cd5\\u4eba\\u4f01\\u4e1a\\u7ec4\\u6210\\u7684\\u4f01\\u4e1a\\u8054\\u5408\\u4f53\"]', 'A,C,E', 2, 1, 0, NULL, '难', 1542779138);
INSERT INTO `knowledge_qs` VALUES (113, 3, 2, 1, '职能与业务管控的必备内容包括（）', '[\"\\u6218\\u7565\\u7ba1\\u7406\",\"\\u7814\\u53d1\\u7ba1\\u63a7\",\"\\u8d22\\u52a1\\u7ba1\\u7406\\u63a7\",\"\\u6d41\\u7a0b\\u7ba1\\u63a7\",\"\\u4eba\\u529b\\u8d44\\u6e90\\u7ba1\\u63a7\"]', 'A,C,E', 2, 1, 0, NULL, '难', 1542779138);
INSERT INTO `knowledge_qs` VALUES (114, 3, 2, 1, '关于资本经营型集团总部，下列说正确的有（）', '[\"\\uff0e\\u662f\\u4e00\\u4e2a\\u201c\\u8d44\\u91d1\\u4e2d\\u5fc3\\u201d\",\"\\uff0e\\u5177\\u6709\\u9ad8\\u5ea6\\u638c\\u6743\\u7684\\u7279\\u70b9\",\"\\uff0e\\u4eba\\u5458\\u901a\\u5e38\\u5f88\\u591a\\uff0c\\u89c4\\u6a21\\u6bd4\\u8f83\\u5e9e\\u5927\",\"\\uff0e\\u7cbe\\u529b\\u4e3b\\u8981\\u96c6\\u4e2d\\u5728\\u63d0\\u9ad8\\u96c6\\u56e2\\u7684\\u7efc\\u5408\\u6548\\u76ca\\u4e0a\",\"\\uff0e\\u8d1f\\u8d23\\u96c6\\u56e2\\u8d22\\u52a1\\u548c\\u8d44\\u4ea7\\u8fd0\\u8425\\u7b49\\u65b9\\u9762\\u5de5\\u4f5c\"]', 'A,E', 2, 1, 0, NULL, '难', 1542779138);
INSERT INTO `knowledge_qs` VALUES (115, 3, 2, 1, '企业广义的人力资本包括（）', '[\"\\uff0e\\u8463\\u4e8b\",\"\\uff0e\\u7ecf\\u5178\\u73ed\\u5b50\",\"\\uff0e\\u5168\\u4f53\\u804c\\u5de5\",\"\\uff0e\\u9ad8\\u7ea7\\u6280\\u672f\\u4eba\\u5458\",\"\\uff0e\\u4e00\\u822c\\u7ba1\\u7406\\u4eba\\u5458\"]', 'A,B,C,D,E', 2, 1, 0, NULL, '难', 1542779138);
INSERT INTO `knowledge_qs` VALUES (116, 3, 2, 1, '构建胜任特征模型时，定义绩效标准一般采用（）', '[\"\\uff0e\\u95ee\\u5377\\u8c03\\u67e5\\u6cd5\",\"\\uff0e\\u884c\\u4e3a\\u4e8b\\u4ef6\\u8bbf\\u8c08\\u6cd5\",\"\\uff0e\\u5168\\u65b9\\u4f4d\\u8bc4\\u4ef7\\u6cd5\",\"\\uff0e\\u4e13\\u5bb6\\u5c0f\\u7ec4\\u8ba8\\u8bba\\u6cd5\",\"\\uff0e\\u5de5\\u4f5c\\u5c97\\u4f4d\\u5206\\u6790\\u6cd5\"]', 'D,E', 2, 1, 0, NULL, '难', 1542779138);
INSERT INTO `knowledge_qs` VALUES (117, 3, 2, 1, '关于公文筐测试，下列说法正确的有（）', '[\"\\uff0e\\u60c5\\u5883\\u6027\\u5f3a\",\"\\uff0e\\u9002\\u7528\\u4e8e\\u6240\\u6709\\u5c97\\u4f4d\",\"\\uff0e\\u8003\\u67e5\\u5185\\u5bb9\\u5341\\u5206\\u5e7f\\u6cdb\",\"\\uff0e\\u5bf9\\u8bc4\\u5206\\u8005\\u8981\\u6c42\\u8f83\\u9ad8\",\"\\uff0e\\u5e94\\u7528\\u8d77\\u6765\\u6bd4\\u8f83\\u7ecf\\u6d4e\"]', 'A,C,D', 2, 1, 0, NULL, '难', 1542779138);
INSERT INTO `knowledge_qs` VALUES (118, 3, 2, 1, '美国心理学家霍兰德提出的职业人格类型包括（）', '[\"\\uff0e\\u5e38\\u89c4\\u578b\",\"\\uff0e\\u8fdb\\u53d6\\u578b\",\"\\uff0e\\u7814\\u7a76\\u578b\",\"\\uff0e\\u827a\\u672f\\u578b\",\"\\uff0e\\u793e\\u4f1a\\u578b\"]', 'A,C,D,E', 2, 1, 0, NULL, '中', 1542779138);
INSERT INTO `knowledge_qs` VALUES (119, 3, 2, 1, '有效的员工培训体包括（）', '[\"\\u5236\\u5ea6\\u5c42\",\"\\u6218\\u7565\\u5c42\",\"\\u8d44\\u6e90\\u5c42\",\"\\u8fd0\\u8425\\u5c42\",\"\\u4eba\\u5458\\u5c42\"]', 'A,C,D', 2, 1, 0, NULL, '中', 1542779138);
INSERT INTO `knowledge_qs` VALUES (120, 3, 2, 1, '人的终身学习具有（）', '[\"\\u4e2a\\u4f53\\u5c5e\\u6027\",\"\\u56e2\\u4f53\\u5c5e\\u6027\",\"\\u793e\\u4f1a\\u5c5e\\u6027\",\"\\u4e2d\\u4ecb\\u5c5e\\u6027\",\"\\u53d1\\u5c55\\u5c5e\\u6027\"]', 'A,C,D,E', 2, 1, 0, NULL, '中', 1542779138);
INSERT INTO `knowledge_qs` VALUES (121, 3, 2, 1, '逻辑思维在创新中的局限性包括（）', '[\"\\u77db\\u76fe\\u6027\",\"\\u7ea6\\u675f\\u6027\",\"\\u5e38\\u89c4\\u6027\",\"\\u4e25\\u5bc6\\u6027\",\"\\u7a33\\u5b9a\\u6027\"]', 'C,D,E', 2, 1, 0, NULL, '中', 1542779138);
INSERT INTO `knowledge_qs` VALUES (122, 3, 2, 1, '员工职业生涯组织方法的影响因素包括（）', '[\"\\u7ec4\\u7ec7\\u7279\\u8272\",\"\\u4eba\\u529b\\u8bc4\\u4f30\",\"\\u7ecf\\u6d4e\\u73af\\u5883\",\"\\u5fc3\\u7406\\u7d20\\u8d28\",\"\\u5de5\\u4f5c\\u5206\\u6790\"]', 'A,B,E', 2, 1, 0, NULL, '中', 1542779138);
INSERT INTO `knowledge_qs` VALUES (123, 3, 2, 1, '关于绩效考评主体，下列说法正确的有()', '[\"\\u4e0a\\u7ea7\\u662f\\u6700\\u91cd\\u8981\\u7684\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\",\"\\u5176\\u4ed6\\u90e8\\u95e8\\u540c\\u4e8b\\u5c5e\\u4e8e\\u5916\\u90e8\\u8003\\u8bc4\\u4e3b\\u4f53\",\"\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\\u7684\\u9009\\u62e9\\u4e0e\\u8003\\u8bc4\\u5185\\u5bb9\\u6709\\u5173\",\"\\u4e0d\\u540c\\u8003\\u8bc4\\u5bf9\\u8c61\\u7684\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\\u6709\\u6240\\u533a\\u522b\",\"\\u4e0d\\u540c\\u8003\\u8bc4\\u6307\\u6807\\u7684\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\\u6709\\u6240\\u533a\\u522b\"]', 'A,C,D,E', 2, 1, 0, NULL, '中', 1542779138);
INSERT INTO `knowledge_qs` VALUES (124, 3, 2, 1, '资源基础理论认为组织存在的基本资源包话（）', '[\"\\u7269\\u8d28\\u8d44\\u6e90\",\"\\u7ba1\\u7406\\u8d44\\u6e90\",\"\\u7ec4\\u7ec7\\u8d44\\u6e90\",\"\\u4eba\\u529b\\u8d44\\u6e90\",\"\\u73af\\u5883\\u8d44\\u6e90\"]', 'A,C,D', 2, 1, 0, NULL, '难', 1542779460);
INSERT INTO `knowledge_qs` VALUES (125, 3, 2, 1, '劳动市场运作过程是（）之间交互影响和作用的过程', '[\"\\u653f\\u5e9c\",\"\\u6c42\\u804c\\u53bb\\u5411\\u4e0d\\u660e\",\"\\u751f\\u4ea7\\u8d44\\u6599\",\"\\u7528\\u4eba\\u5355\\u4f4d\",\"\\u793e\\u4f1a\\u4e2d\\u4ef7\\u7ec4\\u7ec7\"]', 'A,B,D,E', 2, 1, 0, NULL, '难', 1542779460);
INSERT INTO `knowledge_qs` VALUES (126, 3, 2, 1, '当外部环境遇到良好机遇时，企业可认采用（）', '[\"\\u626d\\u8f6c\\u578b\\u6218\\u7565\",\"\\u8ddf\\u968f\\u578b\\u6218\\u7565\",\"\\u8fdb\\u653b\\u578b\\u6218\\u7565\",\"\\u9632\\u5fa1\\u578b\\u6218\\u7565\",\"\\u591a\\u6837\\u578b\\u6218\\u7565\"]', 'A,C', 2, 1, 0, NULL, '难', 1542779460);
INSERT INTO `knowledge_qs` VALUES (127, 3, 2, 1, '关于企业集团，下列说法正确的有（）', '[\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u5177\\u6709\\u591a\\u5c42\\u6b21\\u7ed3\\u6784\",\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u5177\\u5907\\u603b\\u4f53\\u6cd5\\u4eba\\u5730\\u4f4d\",\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u7684\\u6838 \\u5fc3\\u5c42\\u5c31\\u662f\\u96c6\\u56e2\\u516c\\u53f8\",\"\\u4ea7\\u6743\\u662f\\u4f01\\u4e1a\\u96c6\\u56e2\\u552f\\u4e00\\u7684\\u8054\\u7ed3\\u7ebd\\u5e26\",\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u662f\\u591a\\u4e2a\\u6cd5\\u4eba\\u4f01\\u4e1a\\u7ec4\\u6210\\u7684\\u4f01\\u4e1a\\u8054\\u5408\\u4f53\"]', 'A,C,E', 2, 1, 0, NULL, '难', 1542779460);
INSERT INTO `knowledge_qs` VALUES (128, 3, 2, 1, '职能与业务管控的必备内容包括（）', '[\"\\u6218\\u7565\\u7ba1\\u7406\",\"\\u7814\\u53d1\\u7ba1\\u63a7\",\"\\u8d22\\u52a1\\u7ba1\\u7406\\u63a7\",\"\\u6d41\\u7a0b\\u7ba1\\u63a7\",\"\\u4eba\\u529b\\u8d44\\u6e90\\u7ba1\\u63a7\"]', 'A,C,E', 2, 1, 0, NULL, '难', 1542779460);
INSERT INTO `knowledge_qs` VALUES (129, 3, 2, 1, '关于资本经营型集团总部，下列说正确的有（）', '[\"\\uff0e\\u662f\\u4e00\\u4e2a\\u201c\\u8d44\\u91d1\\u4e2d\\u5fc3\\u201d\",\"\\uff0e\\u5177\\u6709\\u9ad8\\u5ea6\\u638c\\u6743\\u7684\\u7279\\u70b9\",\"\\uff0e\\u4eba\\u5458\\u901a\\u5e38\\u5f88\\u591a\\uff0c\\u89c4\\u6a21\\u6bd4\\u8f83\\u5e9e\\u5927\",\"\\uff0e\\u7cbe\\u529b\\u4e3b\\u8981\\u96c6\\u4e2d\\u5728\\u63d0\\u9ad8\\u96c6\\u56e2\\u7684\\u7efc\\u5408\\u6548\\u76ca\\u4e0a\",\"\\uff0e\\u8d1f\\u8d23\\u96c6\\u56e2\\u8d22\\u52a1\\u548c\\u8d44\\u4ea7\\u8fd0\\u8425\\u7b49\\u65b9\\u9762\\u5de5\\u4f5c\"]', 'A,E', 2, 1, 0, NULL, '难', 1542779460);
INSERT INTO `knowledge_qs` VALUES (130, 3, 2, 1, '企业广义的人力资本包括（）', '[\"\\uff0e\\u8463\\u4e8b\",\"\\uff0e\\u7ecf\\u5178\\u73ed\\u5b50\",\"\\uff0e\\u5168\\u4f53\\u804c\\u5de5\",\"\\uff0e\\u9ad8\\u7ea7\\u6280\\u672f\\u4eba\\u5458\",\"\\uff0e\\u4e00\\u822c\\u7ba1\\u7406\\u4eba\\u5458\"]', 'A,B,C,D,E', 2, 1, 0, NULL, '难', 1542779460);
INSERT INTO `knowledge_qs` VALUES (131, 3, 2, 1, '构建胜任特征模型时，定义绩效标准一般采用（）', '[\"\\uff0e\\u95ee\\u5377\\u8c03\\u67e5\\u6cd5\",\"\\uff0e\\u884c\\u4e3a\\u4e8b\\u4ef6\\u8bbf\\u8c08\\u6cd5\",\"\\uff0e\\u5168\\u65b9\\u4f4d\\u8bc4\\u4ef7\\u6cd5\",\"\\uff0e\\u4e13\\u5bb6\\u5c0f\\u7ec4\\u8ba8\\u8bba\\u6cd5\",\"\\uff0e\\u5de5\\u4f5c\\u5c97\\u4f4d\\u5206\\u6790\\u6cd5\"]', 'D,E', 2, 1, 0, NULL, '难', 1542779460);
INSERT INTO `knowledge_qs` VALUES (132, 3, 2, 1, '关于公文筐测试，下列说法正确的有（）', '[\"\\uff0e\\u60c5\\u5883\\u6027\\u5f3a\",\"\\uff0e\\u9002\\u7528\\u4e8e\\u6240\\u6709\\u5c97\\u4f4d\",\"\\uff0e\\u8003\\u67e5\\u5185\\u5bb9\\u5341\\u5206\\u5e7f\\u6cdb\",\"\\uff0e\\u5bf9\\u8bc4\\u5206\\u8005\\u8981\\u6c42\\u8f83\\u9ad8\",\"\\uff0e\\u5e94\\u7528\\u8d77\\u6765\\u6bd4\\u8f83\\u7ecf\\u6d4e\"]', 'A,C,D', 2, 1, 0, NULL, '难', 1542779460);
INSERT INTO `knowledge_qs` VALUES (133, 3, 2, 1, '美国心理学家霍兰德提出的职业人格类型包括（）', '[\"\\uff0e\\u5e38\\u89c4\\u578b\",\"\\uff0e\\u8fdb\\u53d6\\u578b\",\"\\uff0e\\u7814\\u7a76\\u578b\",\"\\uff0e\\u827a\\u672f\\u578b\",\"\\uff0e\\u793e\\u4f1a\\u578b\"]', 'A,C,D,E', 2, 1, 0, NULL, '中', 1542779460);
INSERT INTO `knowledge_qs` VALUES (134, 3, 2, 1, '有效的员工培训体包括（）', '[\"\\u5236\\u5ea6\\u5c42\",\"\\u6218\\u7565\\u5c42\",\"\\u8d44\\u6e90\\u5c42\",\"\\u8fd0\\u8425\\u5c42\",\"\\u4eba\\u5458\\u5c42\"]', 'A,C,D', 2, 1, 0, NULL, '中', 1542779460);
INSERT INTO `knowledge_qs` VALUES (135, 3, 2, 1, '人的终身学习具有（）', '[\"\\u4e2a\\u4f53\\u5c5e\\u6027\",\"\\u56e2\\u4f53\\u5c5e\\u6027\",\"\\u793e\\u4f1a\\u5c5e\\u6027\",\"\\u4e2d\\u4ecb\\u5c5e\\u6027\",\"\\u53d1\\u5c55\\u5c5e\\u6027\"]', 'A,C,D,E', 2, 1, 0, NULL, '中', 1542779460);
INSERT INTO `knowledge_qs` VALUES (136, 3, 2, 1, '逻辑思维在创新中的局限性包括（）', '[\"\\u77db\\u76fe\\u6027\",\"\\u7ea6\\u675f\\u6027\",\"\\u5e38\\u89c4\\u6027\",\"\\u4e25\\u5bc6\\u6027\",\"\\u7a33\\u5b9a\\u6027\"]', 'C,D,E', 2, 1, 0, NULL, '中', 1542779460);
INSERT INTO `knowledge_qs` VALUES (137, 3, 2, 1, '员工职业生涯组织方法的影响因素包括（）', '[\"\\u7ec4\\u7ec7\\u7279\\u8272\",\"\\u4eba\\u529b\\u8bc4\\u4f30\",\"\\u7ecf\\u6d4e\\u73af\\u5883\",\"\\u5fc3\\u7406\\u7d20\\u8d28\",\"\\u5de5\\u4f5c\\u5206\\u6790\"]', 'A,B,E', 2, 1, 0, NULL, '中', 1542779460);
INSERT INTO `knowledge_qs` VALUES (138, 3, 2, 1, '关于绩效考评主体，下列说法正确的有()', '[\"\\u4e0a\\u7ea7\\u662f\\u6700\\u91cd\\u8981\\u7684\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\",\"\\u5176\\u4ed6\\u90e8\\u95e8\\u540c\\u4e8b\\u5c5e\\u4e8e\\u5916\\u90e8\\u8003\\u8bc4\\u4e3b\\u4f53\",\"\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\\u7684\\u9009\\u62e9\\u4e0e\\u8003\\u8bc4\\u5185\\u5bb9\\u6709\\u5173\",\"\\u4e0d\\u540c\\u8003\\u8bc4\\u5bf9\\u8c61\\u7684\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\\u6709\\u6240\\u533a\\u522b\",\"\\u4e0d\\u540c\\u8003\\u8bc4\\u6307\\u6807\\u7684\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\\u6709\\u6240\\u533a\\u522b\"]', 'A,C,D,E', 2, 1, 0, NULL, '中', 1542779460);
INSERT INTO `knowledge_qs` VALUES (139, 3, 2, 1, '资源基础理论认为组织存在的基本资源包话（）', '[\"\\u7269\\u8d28\\u8d44\\u6e90\",\"\\u7ba1\\u7406\\u8d44\\u6e90\",\"\\u7ec4\\u7ec7\\u8d44\\u6e90\",\"\\u4eba\\u529b\\u8d44\\u6e90\",\"\\u73af\\u5883\\u8d44\\u6e90\"]', 'A,C,D', 2, 1, 0, NULL, '难', 1542779593);
INSERT INTO `knowledge_qs` VALUES (140, 3, 2, 1, '劳动市场运作过程是（）之间交互影响和作用的过程', '[\"\\u653f\\u5e9c\",\"\\u6c42\\u804c\\u53bb\\u5411\\u4e0d\\u660e\",\"\\u751f\\u4ea7\\u8d44\\u6599\",\"\\u7528\\u4eba\\u5355\\u4f4d\",\"\\u793e\\u4f1a\\u4e2d\\u4ef7\\u7ec4\\u7ec7\"]', 'A,B,D,E', 2, 1, 0, NULL, '难', 1542779593);
INSERT INTO `knowledge_qs` VALUES (141, 3, 2, 1, '当外部环境遇到良好机遇时，企业可认采用（）', '[\"\\u626d\\u8f6c\\u578b\\u6218\\u7565\",\"\\u8ddf\\u968f\\u578b\\u6218\\u7565\",\"\\u8fdb\\u653b\\u578b\\u6218\\u7565\",\"\\u9632\\u5fa1\\u578b\\u6218\\u7565\",\"\\u591a\\u6837\\u578b\\u6218\\u7565\"]', 'A,C', 2, 1, 0, NULL, '难', 1542779593);
INSERT INTO `knowledge_qs` VALUES (142, 3, 2, 1, '关于企业集团，下列说法正确的有（）', '[\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u5177\\u6709\\u591a\\u5c42\\u6b21\\u7ed3\\u6784\",\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u5177\\u5907\\u603b\\u4f53\\u6cd5\\u4eba\\u5730\\u4f4d\",\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u7684\\u6838 \\u5fc3\\u5c42\\u5c31\\u662f\\u96c6\\u56e2\\u516c\\u53f8\",\"\\u4ea7\\u6743\\u662f\\u4f01\\u4e1a\\u96c6\\u56e2\\u552f\\u4e00\\u7684\\u8054\\u7ed3\\u7ebd\\u5e26\",\"\\u4f01\\u4e1a\\u96c6\\u56e2\\u662f\\u591a\\u4e2a\\u6cd5\\u4eba\\u4f01\\u4e1a\\u7ec4\\u6210\\u7684\\u4f01\\u4e1a\\u8054\\u5408\\u4f53\"]', 'A,C,E', 2, 1, 0, NULL, '难', 1542779593);
INSERT INTO `knowledge_qs` VALUES (143, 3, 2, 1, '职能与业务管控的必备内容包括（）', '[\"\\u6218\\u7565\\u7ba1\\u7406\",\"\\u7814\\u53d1\\u7ba1\\u63a7\",\"\\u8d22\\u52a1\\u7ba1\\u7406\\u63a7\",\"\\u6d41\\u7a0b\\u7ba1\\u63a7\",\"\\u4eba\\u529b\\u8d44\\u6e90\\u7ba1\\u63a7\"]', 'A,C,E', 2, 1, 0, NULL, '难', 1542779593);
INSERT INTO `knowledge_qs` VALUES (144, 3, 2, 1, '关于资本经营型集团总部，下列说正确的有（）', '[\"\\uff0e\\u662f\\u4e00\\u4e2a\\u201c\\u8d44\\u91d1\\u4e2d\\u5fc3\\u201d\",\"\\uff0e\\u5177\\u6709\\u9ad8\\u5ea6\\u638c\\u6743\\u7684\\u7279\\u70b9\",\"\\uff0e\\u4eba\\u5458\\u901a\\u5e38\\u5f88\\u591a\\uff0c\\u89c4\\u6a21\\u6bd4\\u8f83\\u5e9e\\u5927\",\"\\uff0e\\u7cbe\\u529b\\u4e3b\\u8981\\u96c6\\u4e2d\\u5728\\u63d0\\u9ad8\\u96c6\\u56e2\\u7684\\u7efc\\u5408\\u6548\\u76ca\\u4e0a\",\"\\uff0e\\u8d1f\\u8d23\\u96c6\\u56e2\\u8d22\\u52a1\\u548c\\u8d44\\u4ea7\\u8fd0\\u8425\\u7b49\\u65b9\\u9762\\u5de5\\u4f5c\"]', 'A,E', 2, 1, 0, NULL, '难', 1542779593);
INSERT INTO `knowledge_qs` VALUES (145, 3, 2, 1, '企业广义的人力资本包括（）', '[\"\\uff0e\\u8463\\u4e8b\",\"\\uff0e\\u7ecf\\u5178\\u73ed\\u5b50\",\"\\uff0e\\u5168\\u4f53\\u804c\\u5de5\",\"\\uff0e\\u9ad8\\u7ea7\\u6280\\u672f\\u4eba\\u5458\",\"\\uff0e\\u4e00\\u822c\\u7ba1\\u7406\\u4eba\\u5458\"]', 'A,B,C,D,E', 2, 1, 0, NULL, '难', 1542779593);
INSERT INTO `knowledge_qs` VALUES (146, 3, 2, 1, '构建胜任特征模型时，定义绩效标准一般采用（）', '[\"\\uff0e\\u95ee\\u5377\\u8c03\\u67e5\\u6cd5\",\"\\uff0e\\u884c\\u4e3a\\u4e8b\\u4ef6\\u8bbf\\u8c08\\u6cd5\",\"\\uff0e\\u5168\\u65b9\\u4f4d\\u8bc4\\u4ef7\\u6cd5\",\"\\uff0e\\u4e13\\u5bb6\\u5c0f\\u7ec4\\u8ba8\\u8bba\\u6cd5\",\"\\uff0e\\u5de5\\u4f5c\\u5c97\\u4f4d\\u5206\\u6790\\u6cd5\"]', 'D,E', 2, 1, 0, NULL, '难', 1542779593);
INSERT INTO `knowledge_qs` VALUES (147, 3, 2, 1, '关于公文筐测试，下列说法正确的有（）', '[\"\\uff0e\\u60c5\\u5883\\u6027\\u5f3a\",\"\\uff0e\\u9002\\u7528\\u4e8e\\u6240\\u6709\\u5c97\\u4f4d\",\"\\uff0e\\u8003\\u67e5\\u5185\\u5bb9\\u5341\\u5206\\u5e7f\\u6cdb\",\"\\uff0e\\u5bf9\\u8bc4\\u5206\\u8005\\u8981\\u6c42\\u8f83\\u9ad8\",\"\\uff0e\\u5e94\\u7528\\u8d77\\u6765\\u6bd4\\u8f83\\u7ecf\\u6d4e\"]', 'A,C,D', 2, 1, 0, NULL, '难', 1542779593);
INSERT INTO `knowledge_qs` VALUES (148, 3, 2, 1, '美国心理学家霍兰德提出的职业人格类型包括（）', '[\"\\uff0e\\u5e38\\u89c4\\u578b\",\"\\uff0e\\u8fdb\\u53d6\\u578b\",\"\\uff0e\\u7814\\u7a76\\u578b\",\"\\uff0e\\u827a\\u672f\\u578b\",\"\\uff0e\\u793e\\u4f1a\\u578b\"]', 'A,C,D,E', 2, 1, 0, NULL, '中', 1542779593);
INSERT INTO `knowledge_qs` VALUES (149, 3, 2, 1, '有效的员工培训体包括（）', '[\"\\u5236\\u5ea6\\u5c42\",\"\\u6218\\u7565\\u5c42\",\"\\u8d44\\u6e90\\u5c42\",\"\\u8fd0\\u8425\\u5c42\",\"\\u4eba\\u5458\\u5c42\"]', 'A,C,D', 2, 1, 0, NULL, '中', 1542779593);
INSERT INTO `knowledge_qs` VALUES (150, 3, 2, 1, '人的终身学习具有（）', '[\"\\u4e2a\\u4f53\\u5c5e\\u6027\",\"\\u56e2\\u4f53\\u5c5e\\u6027\",\"\\u793e\\u4f1a\\u5c5e\\u6027\",\"\\u4e2d\\u4ecb\\u5c5e\\u6027\",\"\\u53d1\\u5c55\\u5c5e\\u6027\"]', 'A,C,D,E', 2, 1, 0, NULL, '中', 1542779593);
INSERT INTO `knowledge_qs` VALUES (151, 3, 2, 1, '逻辑思维在创新中的局限性包括（）', '[\"\\u77db\\u76fe\\u6027\",\"\\u7ea6\\u675f\\u6027\",\"\\u5e38\\u89c4\\u6027\",\"\\u4e25\\u5bc6\\u6027\",\"\\u7a33\\u5b9a\\u6027\"]', 'C,D,E', 2, 1, 0, NULL, '中', 1542779593);
INSERT INTO `knowledge_qs` VALUES (152, 3, 2, 1, '员工职业生涯组织方法的影响因素包括（）', '[\"\\u7ec4\\u7ec7\\u7279\\u8272\",\"\\u4eba\\u529b\\u8bc4\\u4f30\",\"\\u7ecf\\u6d4e\\u73af\\u5883\",\"\\u5fc3\\u7406\\u7d20\\u8d28\",\"\\u5de5\\u4f5c\\u5206\\u6790\"]', 'A,B,E', 2, 1, 0, NULL, '中', 1542779593);
INSERT INTO `knowledge_qs` VALUES (153, 3, 2, 1, '关于绩效考评主体，下列说法正确的有()', '[\"\\u4e0a\\u7ea7\\u662f\\u6700\\u91cd\\u8981\\u7684\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\",\"\\u5176\\u4ed6\\u90e8\\u95e8\\u540c\\u4e8b\\u5c5e\\u4e8e\\u5916\\u90e8\\u8003\\u8bc4\\u4e3b\\u4f53\",\"\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\\u7684\\u9009\\u62e9\\u4e0e\\u8003\\u8bc4\\u5185\\u5bb9\\u6709\\u5173\",\"\\u4e0d\\u540c\\u8003\\u8bc4\\u5bf9\\u8c61\\u7684\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\\u6709\\u6240\\u533a\\u522b\",\"\\u4e0d\\u540c\\u8003\\u8bc4\\u6307\\u6807\\u7684\\u7ee9\\u6548\\u8003\\u8bc4\\u4e3b\\u4f53\\u6709\\u6240\\u533a\\u522b\"]', 'A,C,D,E', 2, 1, 0, NULL, '中', 1542779593);
INSERT INTO `knowledge_qs` VALUES (154, 3, 2, 1, '最低就业年龄公约规定（）', '[\"\\uff0e\\u6700\\u4f4e\\u5c31\\u4e1a\\u5e74\\u9f84\\u4e00\\u822c\\u4e0d\\u80fd\\u4f4e\\u4e8e15\\u5c81\",\"\\uff0e\\u5c11\\u6570\\u4e0d\\u53d1\\u8fbe\\u56fd\\u5bb6\\u4e0d\\u53d7\\u6700\\u4f4e\\u5c31\\u4e1a\\u5e74\\u9f84\\u9650\\u5236\",\"\\uff0e\\u4ee5\\u804c\\u4e1a\\u548c\\u6280\\u672f\\u6559\\u80b2\\u4e3a\\u76ee\\u7684\\u7684\\u6d3b\\u52a8\\u4e0d\\u53d7\\u6700\\u4f4e\\u5c31\\u4e1a\\u5e74\\u9f84\\u9650\\u5236\",\"\\uff0e13\\uff0d15\\u5c81\\u672a\\u6210\\u5e74\\u4eba\\u53ef\\u5728\\u4e0d\\u5f71\\u54cd\\u5b66\\u4e60\\u7684\\u60c5\\u51b5\\u4e0b\\u4ece\\u4e1a\\u8bfe\\u4f59\\u8f7b\\u5fae\\u52b3\\u52a8\",null]', 'BCD', 2, 1, 0, NULL, '中', 1542779593);

-- ----------------------------
-- Table structure for practice_history
-- ----------------------------
DROP TABLE IF EXISTS `practice_history`;
CREATE TABLE `practice_history`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `SubjectID` int(11) NULL DEFAULT NULL COMMENT '科目id',
  `GradeID` int(11) NULL DEFAULT NULL COMMENT '等级',
  `QID` int(11) NOT NULL COMMENT '问题ID',
  `Answer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的回答',
  `TrueAnswer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正确答案',
  `IsTrue` smallint(255) NULL DEFAULT NULL COMMENT '是否正确',
  `CreateTime` int(11) NULL DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of practice_history
-- ----------------------------
INSERT INTO `practice_history` VALUES (40, 1, 1, 2, 110, 'B,C', 'A,B,D,E', 0, 1542945796);
INSERT INTO `practice_history` VALUES (39, 1, 1, 2, 109, 'B,C', 'A,C,D', 0, 1542945796);
INSERT INTO `practice_history` VALUES (38, 1, 1, 2, 112, 'A,B,E', 'A,C,E', 0, 1542943056);
INSERT INTO `practice_history` VALUES (37, 1, 1, 2, 110, 'A,B,E', 'A,B,D,E', 0, 1542943056);

-- ----------------------------
-- Table structure for practice_user
-- ----------------------------
DROP TABLE IF EXISTS `practice_user`;
CREATE TABLE `practice_user`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `CreateDate` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `Status` int(255) NULL DEFAULT NULL COMMENT '状态 1正常 0禁止',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户刷题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目',
  `Options` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目选项',
  `Answer` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案ABCD',
  `Type` int(11) NOT NULL COMMENT '1单选题 2多选题 3判断题',
  `Status` int(11) NULL DEFAULT 1 COMMENT '0不可用 1可用',
  `mode` int(11) NOT NULL DEFAULT 0 COMMENT '考试类型，0为公共考试，不限题型',
  `CreateDate` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试题目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (70, '“四季五补”中，“滋补”是在哪个季节？', '[\"A.\\u6625\\u5929\",\"B.\\u590f\\u5929\",\"C.\\u79cb\\u5929\",\"D.\\u51ac\\u5929\"]', 'D', 1, 1, 0, 1540195020);
INSERT INTO `questions` VALUES (71, '什么树被称为“活化石”？', '[\"A.\\u94c1\\u6811\",\"B.\\u68a7\\u6850\\u6811\",\"C.\\u6768\\u6811\",\"D.\\u94f6\\u674f\\u6811\"]', 'D', 1, 1, 0, 1540195020);
INSERT INTO `questions` VALUES (66, '以下属于四川自然文化双遗址的是？', '[\"A.\\u9752\\u57ce\\u5c71-\\u90fd\\u6c5f\\u5830\",\"B.\\u4e5d\\u5be8\\u6c9f\",\"C.\\u9ec4\\u9f99\",\"D.\\u5ce8\\u7709\\u5c71-\\u4e50\\u5c71\\u5927\\u4f5b\"]', 'D', 1, 1, 0, 1540195020);
INSERT INTO `questions` VALUES (67, '己所不欲勿施于人，出自？', '[\"A.\\u8bba\\u8bed\",\"B.\\u5b5f\\u5b50\",\"C.\\u8340\\u5b50\",\"D.\\u6625\\u79cb\"]', 'A', 1, 1, 0, 1540195020);
INSERT INTO `questions` VALUES (72, '“闭月羞花”中的“闭月”是关于哪位美女的故事？', '[\"A.\\u897f\\u65bd\",\"B.\\u738b\\u662d\\u541b\",\"C.\\u8c82\\u8749\",\"D.\\u6768\\u8d35\\u5983\"]', 'C', 1, 1, 0, 1540195020);
INSERT INTO `questions` VALUES (69, '我们通常说的“知天命”指的是多少岁？', '[\"A.30\",\"B.40\",\"C.50\",\"D.60\"]', 'C', 1, 1, 0, 1540195020);
INSERT INTO `questions` VALUES (68, '卧龙先生指的是？', '[\"A.\\u5218\\u5907\",\"B.\\u66f9\\u64cd\",\"C.\\u8bf8\\u845b\\u4eae\",\"D.\\u5f20\\u98de\"]', 'C', 1, 1, 0, 1540195020);
INSERT INTO `questions` VALUES (65, '五岳，是中国五大名山的总称，以下哪个选项不属于五岳？', '[\"A.\\u5ce8\\u7709\",\"B.\\u6052\\u5c71\",\"C.\\u8861\\u5c71\",\"D.\\u6cf0\\u5c71\"]', 'A', 1, 1, 0, 1540195020);
INSERT INTO `questions` VALUES (63, '下列节气不在春季的是？', '[\"A.\\u8c37\\u96e8\",\"B.\\u60ca\\u86f0\",\"C.\\u6e05\\u660e\",\"D.\\u767d\\u9732\"]', 'A', 1, 1, 0, 1540195020);
INSERT INTO `questions` VALUES (64, '民间故事《梁祝》突出反映了我国现行《婚姻法》的哪些制度？', '[\"A.\\u7537\\u5973\\u5e73\\u7b49\",\"B.\\u4e00\\u592b\\u4e00\\u59bb\",\"C.\\u5a5a\\u59fb\\u81ea\\u7531\",\"D.\\u4fdd\\u62a4\\u5987\\u5973\"]', 'C', 1, 1, 0, 1540195020);

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Status` int(11) NOT NULL COMMENT '1正常0禁止',
  `Grade` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, 'C语言考试', 1, '1,2,3,4', 1542611297);
INSERT INTO `subject` VALUES (4, '人力资源师', 1, '', 1542765531);
INSERT INTO `subject` VALUES (2, '软件工程等级', 1, '1,2', 1542611962);
INSERT INTO `subject` VALUES (3, '教师资格证', 1, '', 1542613925);
INSERT INTO `subject` VALUES (5, '软件考试', 0, '', 1542765596);

-- ----------------------------
-- Table structure for uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `uploadfile`;
CREATE TABLE `uploadfile`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Path` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  `tip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `CreateDate` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上传附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uploadfile
-- ----------------------------
INSERT INTO `uploadfile` VALUES (1, 'Public/Upload/Questions/2018-10-17/5bc6d0ba9fab0.xls', '', 1539756218);
INSERT INTO `uploadfile` VALUES (2, 'Public/Upload/Questions/2018-10-17/5bc6dd021ccf0.xls', '', 1539759362);
INSERT INTO `uploadfile` VALUES (3, 'Public/Upload/Questions/2018-10-17/5bc6dd1456ea0.xls', '', 1539759380);
INSERT INTO `uploadfile` VALUES (4, 'Public/Upload/Questions/2018-10-17/5bc6dd2da5488.xls', '', 1539759405);
INSERT INTO `uploadfile` VALUES (5, 'Public/Upload/Questions/2018-10-17/5bc6dd56b2f48.xls', '', 1539759446);
INSERT INTO `uploadfile` VALUES (6, 'Public/Upload/Questions/2018-10-17/5bc6dd6cdcb40.xls', '', 1539759468);
INSERT INTO `uploadfile` VALUES (7, 'Public/Upload/Questions/2018-10-17/5bc6dda5e0da8.xls', '', 1539759525);
INSERT INTO `uploadfile` VALUES (8, 'Public/Upload/Questions/2018-10-17/5bc6ddbe449a8.xls', '', 1539759550);
INSERT INTO `uploadfile` VALUES (9, 'Public/Upload/Questions/2018-10-17/5bc6ddd175ad0.xls', '', 1539759569);
INSERT INTO `uploadfile` VALUES (10, 'Public/Upload/Questions/2018-10-17/5bc6dde955b18.xls', '', 1539759593);
INSERT INTO `uploadfile` VALUES (11, 'Public/Upload/Questions/2018-10-17/5bc6df71059d8.xls', '', 1539759985);
INSERT INTO `uploadfile` VALUES (12, 'Public/Upload/Questions/2018-10-17/5bc6f997d9878.xls', '', 1539766679);
INSERT INTO `uploadfile` VALUES (13, 'Public/Upload/Questions/2018-10-17/5bc6f9a322ab0.xls', '', 1539766691);
INSERT INTO `uploadfile` VALUES (14, 'Public/Upload/Questions/2018-10-17/5bc6f9a9e6780.xls', '', 1539766697);
INSERT INTO `uploadfile` VALUES (15, 'Public/Upload/Questions/2018-10-17/5bc6fa2e733c0.xls', '', 1539766830);
INSERT INTO `uploadfile` VALUES (16, 'Public/Upload/Questions/2018-10-18/5bc7ffd461698.xls', '', 1539833812);
INSERT INTO `uploadfile` VALUES (17, 'Public/Upload/Questions/2018-10-18/5bc7ffe7bbfd0.xls', '', 1539833831);
INSERT INTO `uploadfile` VALUES (18, 'Public/Upload/Questions/2018-10-18/5bc7fff156ab8.xls', '', 1539833841);
INSERT INTO `uploadfile` VALUES (19, 'Public/Upload/Questions/2018-10-22/5bcd7390b69e0.xls', '', 1540191120);
INSERT INTO `uploadfile` VALUES (20, 'Public/Upload/Questions/2018-10-22/5bcd7497927c0.xls', '', 1540191383);
INSERT INTO `uploadfile` VALUES (21, 'Public/Upload/Questions/2018-10-22/5bcd74deb71b0.xls', '', 1540191454);
INSERT INTO `uploadfile` VALUES (22, 'Public/Upload/Questions/2018-10-22/5bcd759ea4100.xls', '', 1540191646);
INSERT INTO `uploadfile` VALUES (23, 'Public/Upload/Questions/2018-10-22/5bcd7602dbba0.xls', '', 1540191746);
INSERT INTO `uploadfile` VALUES (24, 'Public/Upload/Questions/2018-10-22/5bcd77207b4a8.xlsx', '', 1540192032);
INSERT INTO `uploadfile` VALUES (25, 'Public/Upload/Questions/2018-10-22/5bcd7753612b0.xls', '', 1540192083);
INSERT INTO `uploadfile` VALUES (26, 'Public/Upload/Questions/2018-10-22/5bcd77bc50cf8.xls', '', 1540192188);
INSERT INTO `uploadfile` VALUES (27, 'Public/Upload/Questions/2018-10-22/5bcd77f1518b0.xls', '', 1540192241);
INSERT INTO `uploadfile` VALUES (28, 'Public/Upload/Questions/2018-10-22/5bcd82cc62638.xls', '', 1540195020);
INSERT INTO `uploadfile` VALUES (29, 'Public/Upload/KnowLedge/2018-11-17/5bef9072130b0.xls', '', 1542426738);
INSERT INTO `uploadfile` VALUES (30, 'Public/Upload/KnowLedge/2018-11-17/5bef909092ba8.xls', '', 1542426768);
INSERT INTO `uploadfile` VALUES (31, 'Public/Upload/KnowLedge/2018-11-17/5bef90a5e5fb0.xls', '', 1542426789);
INSERT INTO `uploadfile` VALUES (32, 'Public/Upload/KnowLedge/2018-11-17/5bef90bee9278.xls', '', 1542426814);
INSERT INTO `uploadfile` VALUES (33, 'Public/Upload/KnowLedge/2018-11-17/5bef9157182b8.xls', '', 1542426967);
INSERT INTO `uploadfile` VALUES (34, 'Public/Upload/KnowLedge/2018-11-17/5bef91744e200.xls', '', 1542426996);
INSERT INTO `uploadfile` VALUES (35, 'Public/Upload/KnowLedge/2018-11-17/5bef917bf26e8.xls', '', 1542427004);
INSERT INTO `uploadfile` VALUES (36, 'Public/Upload/KnowLedge/2018-11-19/5bf2113d130b0.xls', '', 1542590781);
INSERT INTO `uploadfile` VALUES (37, 'Public/Upload/KnowLedge/2018-11-19/5bf214d7c0a08.xls', '', 1542591703);
INSERT INTO `uploadfile` VALUES (38, 'Public/Upload/KnowLedge/2018-11-19/5bf21521cbdb8.xls', '', 1542591777);
INSERT INTO `uploadfile` VALUES (39, 'Public/Upload/KnowLedge/2018-11-19/5bf21620f1360.xls', '', 1542592033);
INSERT INTO `uploadfile` VALUES (40, 'Public/Upload/KnowLedge/2018-11-19/5bf217a0e38a0.xls', '', 1542592416);
INSERT INTO `uploadfile` VALUES (41, 'Public/Upload/KnowLedge/2018-11-19/5bf217d206d60.xls', '', 1542592466);
INSERT INTO `uploadfile` VALUES (42, 'Public/Upload/KnowLedge/2018-11-19/5bf217ff7dfa0.xls', '', 1542592511);
INSERT INTO `uploadfile` VALUES (43, 'Public/Upload/KnowLedge/2018-11-19/5bf21805c7768.xls', '', 1542592517);
INSERT INTO `uploadfile` VALUES (44, 'Public/Upload/KnowLedge/2018-11-21/5bf4ef1922ab0.xls', '', 1542778649);
INSERT INTO `uploadfile` VALUES (45, 'Public/Upload/KnowLedge/2018-11-21/5bf4ef4c8c230.xls', '', 1542778700);
INSERT INTO `uploadfile` VALUES (46, 'Public/Upload/KnowLedge/2018-11-21/5bf4ef80bf680.xls', '', 1542778752);
INSERT INTO `uploadfile` VALUES (47, 'Public/Upload/KnowLedge/2018-11-21/5bf4ef9876e58.xls', '', 1542778776);
INSERT INTO `uploadfile` VALUES (48, 'Public/Upload/KnowLedge/2018-11-21/5bf4f0f4d0408.xls', '', 1542779124);
INSERT INTO `uploadfile` VALUES (49, 'Public/Upload/KnowLedge/2018-11-21/5bf4f101e8aa8.xls', '', 1542779137);
INSERT INTO `uploadfile` VALUES (50, 'Public/Upload/KnowLedge/2018-11-21/5bf4f1fae1d48.xls', '', 1542779386);
INSERT INTO `uploadfile` VALUES (51, 'Public/Upload/KnowLedge/2018-11-21/5bf4f243b69e0.xls', '', 1542779459);
INSERT INTO `uploadfile` VALUES (52, 'Public/Upload/KnowLedge/2018-11-21/5bf4f2c94c2c0.xls', '', 1542779593);

-- ----------------------------
-- Table structure for user_collect
-- ----------------------------
DROP TABLE IF EXISTS `user_collect`;
CREATE TABLE `user_collect`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NULL DEFAULT NULL,
  `KnowledgeID` int(11) NULL DEFAULT NULL,
  `GradeID` int(11) NULL DEFAULT NULL,
  `SubjectID` int(11) NULL DEFAULT NULL,
  `QID` int(11) NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

SET FOREIGN_KEY_CHECKS = 1;
