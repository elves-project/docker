/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.30-log : Database - elves_queue
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`elves_queue` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `elves_queue`;

/*Table structure for table `queue` */

DROP TABLE IF EXISTS `queue`;

CREATE TABLE `queue` (
  `queue_id` varchar(16) NOT NULL COMMENT '队列ID',
  `app` varchar(25) DEFAULT NULL COMMENT 'APP',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `committime` datetime DEFAULT NULL COMMENT '提交时间',
  `status` enum('pendding','running','stopped') DEFAULT 'pendding' COMMENT '队列状态',
  PRIMARY KEY (`queue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='队列表';

/*Table structure for table `task_list` */

DROP TABLE IF EXISTS `task_list`;

CREATE TABLE `task_list` (
  `task_id` varchar(16) NOT NULL COMMENT '任务ID',
  `queue_id` varchar(16) NOT NULL COMMENT '队列ID',
  `ip` varchar(15) NOT NULL COMMENT 'AgentIP',
  `mode` enum('np','p') NOT NULL COMMENT '模式',
  `app` varchar(32) NOT NULL COMMENT '模块',
  `func` varchar(32) NOT NULL COMMENT '指令',
  `param` text COMMENT '参数',
  `timeout` int(11) DEFAULT '90' COMMENT '超时时间',
  `proxy` varchar(35) DEFAULT NULL COMMENT '代理器',
  `depend_task_id` varchar(16) NOT NULL COMMENT '依赖的任务id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `flag` varchar(10) DEFAULT NULL COMMENT '返回状态("true,false")',
  `error` text COMMENT '返回错误',
  `worker_flag` int(11) DEFAULT NULL COMMENT 'worker执行状态',
  `worker_message` text COMMENT 'worker执行结果内容',
  `worker_costtime` int(11) DEFAULT NULL COMMENT 'worker执行耗时',
  `exec_finish_time` datetime DEFAULT NULL COMMENT '结果回收时间',
  `status` enum('pendding','stopped','running','finish') NOT NULL DEFAULT 'pendding' COMMENT '状态(0:等待,1:停止，2:运行,3:结束)',
  PRIMARY KEY (`task_id`),
  KEY `queue_id` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='队列任务表';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
