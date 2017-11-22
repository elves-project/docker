/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.30-log : Database - elves_supervisor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`elves_supervisor` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `elves_supervisor`;

/*Table structure for table `app` */

DROP TABLE IF EXISTS `app`;

CREATE TABLE `app` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `instruct` varchar(30) NOT NULL COMMENT '指令',
  `app_name` varchar(30) NOT NULL COMMENT 'app名称',
  `founder` varchar(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `version_id` int(11) DEFAULT NULL COMMENT '当前版本id',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='应用信息表';

/*Table structure for table `app_agent` */

DROP TABLE IF EXISTS `app_agent`;

CREATE TABLE `app_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `app_id` int(11) NOT NULL COMMENT 'app主键ID',
  `ip` varchar(20) NOT NULL COMMENT 'ip',
  `asset_id` varchar(20) NOT NULL COMMENT '资产ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=841 DEFAULT CHARSET=utf8 COMMENT='app绑定的agent列表';

/*Table structure for table `app_version` */

DROP TABLE IF EXISTS `app_version`;

CREATE TABLE `app_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `version` varchar(30) NOT NULL COMMENT '版本号',
  `operator` varchar(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '版本创建时间',
  `app_id` int(11) NOT NULL COMMENT 'app主键ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='app版本信息表';

/*Table structure for table `auth_key` */

DROP TABLE IF EXISTS `auth_key`;

CREATE TABLE `auth_key` (
  `auth_id` varchar(16) NOT NULL COMMENT '权限ID',
  `auth_key` varchar(16) NOT NULL COMMENT '权限key',
  `auth_name` varchar(20) NOT NULL COMMENT '名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `app_id` int(11) NOT NULL COMMENT 'auth_id绑定的app_id',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `email` varchar(40) NOT NULL COMMENT '邮箱',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `founder` varchar(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录ip地址',
  `login_times` int(11) DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

insert  into `user`(`id`,`email`,`password`,`user_name`,`founder`,`create_time`,`update_time`,`last_login_time`,`last_login_ip`,`login_times`) values (1,'admin@gyyx.cn','21232f297a57a5a743894a0e4a801fc3','管理员','管理员','2017-06-19 18:12:28','2017-06-19 18:12:31','2017-06-30 10:18:31','127.0.0.1',36);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
