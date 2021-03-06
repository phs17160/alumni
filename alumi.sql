/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.11 : Database - alumni
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`alumni` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `alumni`;

/*Table structure for table `al_activity` */

DROP TABLE IF EXISTS `al_activity`;

CREATE TABLE `al_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `organizers` int(11) NOT NULL COMMENT '发起人  用户ID',
  `name` varchar(100) NOT NULL COMMENT '活动名称',
  `content` varchar(500) NOT NULL COMMENT '活动内容',
  `time` varchar(50) NOT NULL COMMENT '活动时间',
  `is_host` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否举办',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `al_activity` */

/*Table structure for table `al_activity_group` */

DROP TABLE IF EXISTS `al_activity_group`;

CREATE TABLE `al_activity_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` int(11) NOT NULL COMMENT '活动id',
  `gid` int(11) NOT NULL COMMENT '圈子id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `al_activity_group` */

/*Table structure for table `al_activity_user` */

DROP TABLE IF EXISTS `al_activity_user`;

CREATE TABLE `al_activity_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` int(11) NOT NULL COMMENT '活动id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `is_join` tinyint(4) NOT NULL COMMENT '是否选择参加',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `al_activity_user` */

/*Table structure for table `al_event` */

DROP TABLE IF EXISTS `al_event`;

CREATE TABLE `al_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(200) NOT NULL COMMENT '事件标题',
  `content` text NOT NULL COMMENT '事件内容',
  `time` varchar(200) NOT NULL COMMENT '事件标题',
  `witter` int(11) NOT NULL COMMENT '作者id',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '事件状态 0为未推送至时间轴，且大家可见，1为推送至时间轴，-1位自己可见',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `al_event` */

/*Table structure for table `al_event_user` */

DROP TABLE IF EXISTS `al_event_user`;

CREATE TABLE `al_event_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `eid` int(11) NOT NULL COMMENT '事件id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `praise` tinyint(4) NOT NULL DEFAULT '0' COMMENT '点赞为1，点踩为2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `al_event_user` */

/*Table structure for table `al_group` */

DROP TABLE IF EXISTS `al_group`;

CREATE TABLE `al_group` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gname` varchar(100) NOT NULL COMMENT '班级名称',
  `create_time` varchar(20) NOT NULL COMMENT '创建时间',
  `bake` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `al_group` */

/*Table structure for table `al_photo` */

DROP TABLE IF EXISTS `al_photo`;

CREATE TABLE `al_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `url` varchar(100) NOT NULL COMMENT '图片路径',
  `content` text COMMENT '图片说明',
  `alid` int(11) NOT NULL COMMENT '相册id',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '事件状态 0为未推送至时间轴，且大家可见，1为推送至时间轴，-1位自己可见',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `al_photo` */

/*Table structure for table `al_photo_album` */

DROP TABLE IF EXISTS `al_photo_album`;

CREATE TABLE `al_photo_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `title` varchar(100) DEFAULT NULL COMMENT '相册名',
  `content` text COMMENT '相册说明',
  `creator` int(11) NOT NULL COMMENT '创建者id',
  `time` varchar(20) NOT NULL COMMENT '创建时间',
  `state` tinyint(4) DEFAULT '0' COMMENT '事件状态 0为未推送至时间轴，且大家可见，1为推送至时间轴，-1位自己可见',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `al_photo_album` */

/*Table structure for table `al_photo_user` */

DROP TABLE IF EXISTS `al_photo_user`;

CREATE TABLE `al_photo_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int(11) NOT NULL COMMENT '图片id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `praise` tinyint(11) NOT NULL COMMENT '点赞为1，点踩为2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `al_photo_user` */

/*Table structure for table `al_user` */

DROP TABLE IF EXISTS `al_user`;

CREATE TABLE `al_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uname` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '姓名',
  `mobile` char(20) CHARACTER SET utf8 NOT NULL COMMENT '手机号',
  `email` char(50) CHARACTER SET utf8 NOT NULL COMMENT '邮箱',
  `weixin` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信',
  `professional` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '职业',
  `reg_time` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '注册时间',
  `last_login_time` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最后一次登录时间',
  `bake` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32;

/*Data for the table `al_user` */

/*Table structure for table `al_user_group` */

DROP TABLE IF EXISTS `al_user_group`;

CREATE TABLE `al_user_group` (
  `ugid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `gid` int(11) NOT NULL COMMENT '群组id',
  `identity` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户身份，数字表示，数字越大，权限越高',
  `join_time` varchar(20) NOT NULL COMMENT '加入时间',
  PRIMARY KEY (`ugid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `al_user_group` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
