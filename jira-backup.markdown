## jira服务备份



jira服务  10.10.20.75      https://jira.qh-1.cn

docker容器： 

	容器配置文件：   /data/jira/docker-compose.yml  ，里面包含jira-software和jira-db的定义

	jira-db：关键数据和目录 
		宿主机中容器外：mysql配置文件： /usr/local/mysql-jira/conf/my.cnf  （容器挂载到宿主机中）
		宿主机中容器外： mysql数据目录： /usr/local/mysql-jira/data/    （容器挂载到宿主机中）

	jira-software: 关键数据和目录：
                                容器外： 整个容器挂载目录 
		
		
