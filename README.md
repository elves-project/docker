# Docker下Elves的部署及实现
## 前提
	
	- Docker 1.12或以上版本
	- Docker-compose 1.16
	- 预留50G及以上磁盘空间
	- 公网的连通性

## git clone项目

    git clone https://github.com/elves-project/docker.git

## 构建container

	//为了便于排错，脚本分四次执行
	1. ./control build		//下载Base镜像并构建新镜像.
	2. ./control start		//调用docker-compose启动各容器，也可以docker-compose up -d.
	3. ./control insertsql	//插入Elves 数据表结构.
	4. ./control restart	//组件依赖mysql，重启容器刷新程序.


## Web页面详解

* Elves-Dashboard页面端口： 8004
* Elves-supervisor页面端口：9092  ; user/password: admin@gyyx.cn/admin
* Rabbitmq 页面端口：15672	; user/password: admin/1q2w3e4r
* Nginx 页面端口：80
* Ftp 端口：21	; user/passwd: ftpuser/1q2w3e4r

说明：

1. Dashboard页面显示各组件状态，绿色正常，红色异常;机器列表显示Elves客户端在线/不在线数量。
2. Rabbitmq页面 Queues中显示各组件在线状态包括： cron/dashboard/heartbeat/openapi/queue/scheduler/supervisor
3. Nginx页面显示通过supervisor调用Ftp上传的数据文件。

## 目录结构说明

		├── conf
		│   ├── elves-center
		│   ├── nginx
		│   └── rabbitmq
		├── control
		├── docker-compose.yaml
		├── dockerfile
		│   └── elves-center
		├── logs
		│   ├── elves-center
		│   ├── mysql
		│   ├── nginx
		│   ├── pureftp
		│   ├── rabbitmq
		│   └── zookeeper
		├── package
		│   ├── elves_cron.tar.gz
		│   ├── elves_dashbord.tar.gz
		│   ├── elves_heartbeat.tar.gz
		│   ├── elves_openapi.tar.gz
		│   ├── elves_queue.tar.gz
		│   ├── elves_scheduler.tar.gz
		│   └── elves_supervisor.tar.gz
		└── storage
		    ├── mysql
		    └── vsftp

* conf 目录存放的是各组件配置文件
* control 是自动化运行脚本
* docker-compose.yaml是容器管理配置文件
* dockerfile 目录是构建镜像的dockerfile文件
* logs 目录是各容器的日志文件
* package 目录是软件存放目录
* storage 目录存放mysql、ftp数据

## 注意事项

1. 若执行./control start命令出现 /usr/local/bin/docker-compose: No such file or directory, 需要把docker-compose拷贝到对应的目录下并授权即可。
2. 若在执行./control build中，遇到wget无法下载，请手动下载Elves各组件，放至package目录下。再次执行./control build及后续操作。
3. 在执行./control insertsql后，如有数据库插入失败，则再次运行./control insertsql即可，原因是第一次刷新创建数据库目录，再次执行即可插入，也可手动执行。
4. docker-compose up -d 启动容器后，cron和queue状态为Resting,说明正在尝试连接mysql，执行./control restart即可。

