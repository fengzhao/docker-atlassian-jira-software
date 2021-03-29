# jira-software install 

## 在 docker 中快速部署 jira-software


### 安装

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




### 安装并激活

启动后，就可以在浏览器中访问并设置下一步。 http://ip:8080

配置数据库连接，然后下一步设置激活，讲服务器ID复制下来，执行下面这个命令，获取许可证：


```shell
java -jar atlassian-agent.jar  -d -m test@test.com -n BAT   -p jira -o http://192.168.0.89  -s BY9B-GWD1-1C78-K2DE
```

输入许可证，继续配置下一步
