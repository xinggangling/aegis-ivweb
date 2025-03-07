-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.21-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE  IF NOT EXISTS `badjs` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `badjs`;

-- 导出  表 betterjs.b_statistics 结构
DROP TABLE IF EXISTS `b_statistics`;
CREATE TABLE IF NOT EXISTS `b_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Table structure for table `b_apply`
--

DROP TABLE IF EXISTS `b_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `appkey` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `codePath` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `blacklist` text COLLATE utf8_unicode_ci ,
  `description` text COLLATE utf8_unicode_ci,
  `mail` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `passTime` datetime DEFAULT NULL,
  `online` int(2) DEFAULT 1,
  `limitpv` int(5) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_approve`
--

DROP TABLE IF EXISTS `b_approve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_approve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `reply` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applyId` int(11) NOT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `applyStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `applyId` (`applyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_user`
--

DROP TABLE IF EXISTS `b_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `b_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `chineseName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verify_state` int(1) DEFAULT 0,
  `openid` varchar(32),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
/*!40000 ALTER TABLE `b_user` DISABLE KEYS */;
INSERT INTO `b_user` (`id`, `loginName`, `chineseName`, `role`, `email`, `password`) VALUES
	(1, 'admin', 'admin', 1, NULL, '21232f297a57a5a743894a0e4a801fc3');


DROP TABLE IF EXISTS `b_log_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `b_log_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logpv` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `b_user_apply`
--

DROP TABLE IF EXISTS `b_user_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `applyId` int(11) NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0',
  `createTime` timestamp NULL DEFAULT NULL,
  `loginName` varchar(100),
  PRIMARY KEY (`id`),
  KEY `applyId_idx` (`applyId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


--
-- Table structure for table `b_pv`
--
DROP TABLE IF EXISTS `b_pv`;

CREATE TABLE `b_pv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badjsid` int(11) NOT NULL,
  `pv` int(11) default 0,
  `date` int(11) default 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


--
-- Table structure for table `b_pv`
--
DROP TABLE IF EXISTS `b_quality`;

CREATE TABLE `b_quality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badjsid` int(11) default 0,
  `rate` varchar(10),
  `badjscount` int(11),
  `pv` int(11),
  `date` int(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Table structure for table `b_sourcemap`
--

DROP TABLE IF EXISTS `b_sourcemap`;

CREATE TABLE `b_sourcemap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(200) NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


--
-- Table structure for table `b_hardware`
--

DROP TABLE IF EXISTS `b_hardware`;

CREATE TABLE `b_hardware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullSize` int(5) NOT NULL,
  `remains` int(5) NOT NULL,
  `usedSize` int(5) NOT NULL,
  `usedPercent` varchar(10) NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;



--
-- Table structure for table `b_whitelist`
--

DROP TABLE IF EXISTS `b_whitelist`;

CREATE TABLE `b_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` varchar(20) DEFAULT '',
  `openid` varchar(64) DEFAULT '' COMMENT 'uin改造，最终方案会使用openid来标示用户',
  `uid` varchar(20) DEFAULT NULL,
  `aid` varchar(64) DEFAULT NULL COMMENT 'AEGIS为每个用户生成的ID',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  `operator` varchar(64) NOT NULL DEFAULT '' COMMENT '操作人',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `aegisid` varchar(20) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;


--
-- Table structure for table `b_user_pv`
--
DROP TABLE IF EXISTS `b_user_pv`;

CREATE TABLE `b_user_pv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aegis_id` int(11) NOT NULL,
  `userName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `pvDesc` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;