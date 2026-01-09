-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?10 �?20 �?03:39
-- 服务器版本: 5.5.53
-- PHP 版本: 5.5.38

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `onlineexam`
--

-- --------------------------------------------------------

--
-- 表的结构 `exam`
--

CREATE TABLE IF NOT EXISTS `exam` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) NOT NULL COMMENT '考试名称',
  `Type` int(11) NOT NULL DEFAULT '0' COMMENT '考试类型，0为公共考试，不限题型',
  `IP` varchar(120) NOT NULL COMMENT 'IP段',
  `Tel` varchar(20) NOT NULL COMMENT '联系电话',
  `Start` int(11) NOT NULL COMMENT '考试开始时间',
  `End` int(11) NOT NULL COMMENT '考试结束时间',
  `Org` varchar(120) NOT NULL COMMENT '举办机构',
  `Description` varchar(200) NOT NULL COMMENT '考试描述',
  `Status` smallint(2) NOT NULL DEFAULT '0' COMMENT '状态 0未发布 1发布',
  `Identifier` varchar(100) NOT NULL COMMENT '标识符密码',
  `Option` int(11) NOT NULL COMMENT '选择题个数',
  `Multiple` int(11) NOT NULL COMMENT '多选题个数',
  `Judge` int(11) NOT NULL COMMENT '判断题',
  `CreateDate` int(11) NOT NULL,
  `UploadExcel` varchar(100) DEFAULT 'null' COMMENT '导入考生信息文件路径',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='考试表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `exam`
--

INSERT INTO `exam` (`ID`, `Name`, `Type`, `IP`, `Tel`, `Start`, `End`, `Org`, `Description`, `Status`, `Identifier`, `Option`, `Multiple`, `Judge`, `CreateDate`, `UploadExcel`) VALUES
(1, '测试考试', 0, '', '15579135898', 1540602000, 1540609200, '江西聚才测评有限公司', '公共考试', 0, '', 2, 2, 2, 0, 'Public/Upload/2018-10-16/5bc5a91aa6fe0.xls');

-- --------------------------------------------------------

--
-- 表的结构 `examination_pager`
--

CREATE TABLE IF NOT EXISTS `examination_pager` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ExamID` int(11) NOT NULL COMMENT '考试ID',
  `Questions` text NOT NULL COMMENT '题目',
  `Answers` text NOT NULL COMMENT '答案',
  `Status` int(11) NOT NULL DEFAULT '1' COMMENT '状态 0未发布 1发布',
  `CreateDate` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='试卷表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `examination_pager`
--

INSERT INTO `examination_pager` (`ID`, `ExamID`, `Questions`, `Answers`, `Status`, `CreateDate`) VALUES
(12, 1, '[{"ID":"6","Title":"1+2=?","Options":"[\\"A.3\\",\\"B.4\\",\\"C.2\\",\\"D.1\\"]","Type":"1"},{"ID":"5","Title":"1+1=?","Options":"[\\"A.3\\",\\"B.4\\",\\"C.2\\",\\"D.1\\"]","Type":"1"},{"ID":"7","Title":"\\u4ee5\\u4e0b\\u54ea\\u4e2a\\u7b49\\u5f0f\\u662f\\u6b63\\u786e\\u7684","Options":"[\\"A.1+1=2\\",\\"B.2+2=4\\",\\"C.4+1=1\\",\\"D.1+3=2\\"]","Type":"2"},{"ID":"8","Title":"\\u4ee5\\u4e0b\\u54ea\\u4e2a\\u7b49\\u5f0f\\u662f\\u6b63\\u786e\\u7684","Options":"[\\"A.2+1=2\\",\\"B.6+2=4\\",\\"C.4-1=3\\",\\"D.3-2=1\\"]","Type":"2"},{"ID":"9","Title":"3*3=8","Options":"[\\"A.\\\\u6b63\\\\u786e\\",\\"B.\\\\u9519\\\\u8bef\\"]","Type":"3"},{"ID":"10","Title":"3\\/3=1","Options":"[\\"A.\\\\u6b63\\\\u786e\\",\\"B.\\\\u9519\\\\u8bef\\"]","Type":"3"}]', '[{"ID":"6","Answer":"A","Type":"1"},{"ID":"5","Answer":"C","Type":"1"},{"ID":"7","Answer":"A,B","Type":"2"},{"ID":"8","Answer":"C,D","Type":"2"},{"ID":"9","Answer":"B","Type":"3"},{"ID":"10","Answer":"A","Type":"3"}]', 1, 1539944420);

-- --------------------------------------------------------

--
-- 表的结构 `examinee`
--

CREATE TABLE IF NOT EXISTS `examinee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ExamID` int(11) NOT NULL COMMENT '考试ID',
  `ClassID` varchar(20) DEFAULT NULL COMMENT '报考岗位代码',
  `Agency` varchar(100) NOT NULL COMMENT '报考岗位名称',
  `ZKDW` varchar(150) NOT NULL COMMENT '招考单位',
  `Username` varchar(200) NOT NULL COMMENT '名字',
  `Password` text COMMENT '密码，默认为null',
  `Sex` varchar(10) NOT NULL COMMENT '性别',
  `Brithday` varchar(50) NOT NULL COMMENT '生日',
  `Photo` varchar(120) DEFAULT NULL COMMENT '个人照片',
  `Identity` varchar(100) NOT NULL COMMENT '身份证号',
  `Tel` varchar(20) NOT NULL COMMENT '电话号码',
  `ZKZH` varchar(50) NOT NULL COMMENT '准考证号',
  `KCH` varchar(20) NOT NULL COMMENT '考场号',
  `ZWH` varchar(50) NOT NULL COMMENT '座位号',
  `KDMC` varchar(150) DEFAULT NULL COMMENT '考点名称',
  `KDDZ` varchar(200) NOT NULL COMMENT '考点地点',
  `KSRQ` varchar(100) NOT NULL COMMENT '考试日期',
  `KSQZSJ` varchar(100) NOT NULL COMMENT '考试起止时间',
  `KSKM` varchar(200) NOT NULL COMMENT '考试科目',
  `Status` int(11) NOT NULL DEFAULT '1' COMMENT '状态 0禁止 1正常 默认为1',
  `Score` int(11) DEFAULT NULL COMMENT '分数',
  `CreateDate` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Examinee' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `examinee`
--

INSERT INTO `examinee` (`ID`, `ExamID`, `ClassID`, `Agency`, `ZKDW`, `Username`, `Password`, `Sex`, `Brithday`, `Photo`, `Identity`, `Tel`, `ZKZH`, `KCH`, `ZWH`, `KDMC`, `KDDZ`, `KSRQ`, `KSQZSJ`, `KSKM`, `Status`, `Score`, `CreateDate`) VALUES
(5, 1, '武汉临空港经济技术开发区（东西湖区）公开', '1146', '武汉市恒大嘉园学校', '蒋汉中', '6f208cf5d07e22004288c358db8493b1', '男', '1992-06-12', 'http://pic.ncrczpw.com/uploads/exam/pic/1026/421122198905105421_2.jpg', '420502199611261845', '15421236549', '30101010113', '76', '26', '华中师范大学', '武汉市洪山区珞喻路152号', '2017年7月7日', '09:00-11:00', '公共基础知识', 1, 0, 1539680538),
(6, 1, '101', '检察员', '江西法院第一检察院', '张三', '6f208cf5d07e22004288c358db8493b1', '男', '1990-03-01', 'http://www.hnrcpzw.com/uplioad/sss.jpng', '321452199003013695', '15421698522', '1478529334', '01', '32', '江西师范大学', '江西省南昌市瑶湖中大道155号', '2018年7月7日', '09:00-12:00', '法律基础法', 1, 0, 1539680826);

-- --------------------------------------------------------

--
-- 表的结构 `exam_record`
--

CREATE TABLE IF NOT EXISTS `exam_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ExamID` int(11) NOT NULL,
  `ExamineeID` int(11) NOT NULL,
  `Score` int(11) NOT NULL COMMENT '分数',
  `Status` int(11) NOT NULL DEFAULT '1',
  `CreateDate` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='考试记录' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `exam_record`
--

INSERT INTO `exam_record` (`ID`, `ExamID`, `ExamineeID`, `Score`, `Status`, `CreateDate`) VALUES
(10, 1, 5, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL COMMENT '题目',
  `Options` text NOT NULL COMMENT '题目选项',
  `Answer` varchar(10) NOT NULL COMMENT '答案ABCD',
  `Type` int(11) NOT NULL COMMENT '1单选题 2多选题 3判断题',
  `Status` int(11) DEFAULT '1' COMMENT '0不可用 1可用',
  `mode` int(11) NOT NULL DEFAULT '0' COMMENT '考试类型，0为公共考试，不限题型',
  `CreateDate` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考试题目表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `questions`
--

INSERT INTO `questions` (`ID`, `Title`, `Options`, `Answer`, `Type`, `Status`, `mode`, `CreateDate`) VALUES
(6, '1+2=?', '["A.3","B.4","C.2","D.1"]', 'A', 1, 1, 0, 1539766680),
(5, '1+1=?', '["A.3","B.4","C.2","D.1"]', 'C', 1, 1, 0, 1539766680),
(7, '以下哪个等式是正确的', '["A.1+1=2","B.2+2=4","C.4+1=1","D.1+3=2"]', 'A,B', 2, 1, 0, 1539766691),
(8, '以下哪个等式是正确的', '["A.2+1=2","B.6+2=4","C.4-1=3","D.3-2=1"]', 'C,D', 2, 1, 0, 1539766691),
(9, '3*3=8', '["A.\\u6b63\\u786e","B.\\u9519\\u8bef"]', 'B', 3, 1, 0, 1539766830),
(10, '3/3=1', '["A.\\u6b63\\u786e","B.\\u9519\\u8bef"]', 'A', 3, 1, 0, 1539766830);

-- --------------------------------------------------------

--
-- 表的结构 `uploadfile`
--

CREATE TABLE IF NOT EXISTS `uploadfile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Path` varchar(150) NOT NULL COMMENT '路径',
  `tip` varchar(100) NOT NULL COMMENT '备注',
  `CreateDate` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='上传附件表' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `uploadfile`
--

INSERT INTO `uploadfile` (`ID`, `Path`, `tip`, `CreateDate`) VALUES
(1, 'Public/Upload/Questions/2018-10-17/5bc6d0ba9fab0.xls', '', 1539756218),
(2, 'Public/Upload/Questions/2018-10-17/5bc6dd021ccf0.xls', '', 1539759362),
(3, 'Public/Upload/Questions/2018-10-17/5bc6dd1456ea0.xls', '', 1539759380),
(4, 'Public/Upload/Questions/2018-10-17/5bc6dd2da5488.xls', '', 1539759405),
(5, 'Public/Upload/Questions/2018-10-17/5bc6dd56b2f48.xls', '', 1539759446),
(6, 'Public/Upload/Questions/2018-10-17/5bc6dd6cdcb40.xls', '', 1539759468),
(7, 'Public/Upload/Questions/2018-10-17/5bc6dda5e0da8.xls', '', 1539759525),
(8, 'Public/Upload/Questions/2018-10-17/5bc6ddbe449a8.xls', '', 1539759550),
(9, 'Public/Upload/Questions/2018-10-17/5bc6ddd175ad0.xls', '', 1539759569),
(10, 'Public/Upload/Questions/2018-10-17/5bc6dde955b18.xls', '', 1539759593),
(11, 'Public/Upload/Questions/2018-10-17/5bc6df71059d8.xls', '', 1539759985),
(12, 'Public/Upload/Questions/2018-10-17/5bc6f997d9878.xls', '', 1539766679),
(13, 'Public/Upload/Questions/2018-10-17/5bc6f9a322ab0.xls', '', 1539766691),
(14, 'Public/Upload/Questions/2018-10-17/5bc6f9a9e6780.xls', '', 1539766697),
(15, 'Public/Upload/Questions/2018-10-17/5bc6fa2e733c0.xls', '', 1539766830),
(16, 'Public/Upload/Questions/2018-10-18/5bc7ffd461698.xls', '', 1539833812),
(17, 'Public/Upload/Questions/2018-10-18/5bc7ffe7bbfd0.xls', '', 1539833831),
(18, 'Public/Upload/Questions/2018-10-18/5bc7fff156ab8.xls', '', 1539833841);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
