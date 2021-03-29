# jira-software in docker

在 docker 中快速部署 jira-software


```shell

git clone https://github.com/fengzhao/docker-atlassian-jira-software.git

# 如果是国内机器，或者docker下载慢，可以把docker-compose.yml中的镜像改为国内镜像地址


mkdir -p /data/jira/jira-data/
mkdir -p /usr/local/mysql-jira/{conf,data}

cp docker-atlassian-jira-software/my.cnf /usr/local/mysql-jira/conf/

docker network create jira

# 启动
docker-compose up -d 
```


