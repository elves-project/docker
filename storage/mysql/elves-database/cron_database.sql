/*
SQLyog v10.2 
MySQL - 5.1.52 : Database - elves_cron
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `task_cron` */

CREATE TABLE `task_cron` (
  `id` varchar(16) NOT NULL COMMENT '主键Id',
  `ip` varchar(15) NOT NULL COMMENT '客户端IP',
  `mode` enum('sap','sanp') NOT NULL COMMENT '模式(sap,sanp)',
  `app` varchar(32) NOT NULL COMMENT '模块',
  `func` varchar(32) NOT NULL COMMENT '方法',
  `param` text COMMENT '参数',
  `timeout` int(11) DEFAULT '0' COMMENT '超时时间',
  `proxy` varchar(30) DEFAULT '' COMMENT '代理器',
  `rule` varchar(30) NOT NULL COMMENT '规则(quartz表达式)',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0:暂停,1:正常)',
  `create_time` datetime NOT NULL COMMENT '任务接收时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计划任务表';

/*Table structure for table `task_result` */

CREATE TABLE `task_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cron_id` varchar(16) NOT NULL COMMENT 'task_cron的Id',
  `flag` varchar(5) NOT NULL COMMENT '任务状态（"true","false"）',
  `error` varchar(200) DEFAULT '' COMMENT '任务执行false时原因',
  `worker_flag` tinyint(4) NOT NULL COMMENT 'agent-worker执行状态(0-失败,1-成功,-1-系统错误)',
  `worker_message` text COMMENT 'agent-worker执行结果',
  `worker_costtime` int(11) NOT NULL DEFAULT '0' COMMENT 'agent-worker执行耗时',
  `end_time` datetime NOT NULL COMMENT '执行结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='计划任务执行结果表';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
