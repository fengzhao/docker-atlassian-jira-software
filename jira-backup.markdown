## jira服务备份



jira服务 https://jira.qh-1.cn  运行在公司esxi虚拟机中的10.10.20.75服务器上。

docker容器 /data/jira/docker-compose.yml  ，其中包含jira-software和jira-db的定义。

```
    jira-db：关键数据和目录 
		
	    宿主机中容器外：mysql配置文件： /usr/local/mysql-jira/conf/my.cnf  （容器挂载到宿主机中）
	
	    宿主机中容器外： mysql数据目录： /usr/local/mysql-jira/data/    （容器挂载到宿主机中）

    jira-software: 关键数据和目录：
                
           宿主机中容器外：jira容器数据（含附件等）： /data/jira/jira-data/ （容器挂载到宿主机中）
           
           
           
     jira备份需要备份的数据：

        1、 数据库   

        2、 数据目录（含附件和其他等）

        3、 安装包       
    
```    
   
   
   



### 备份方法和备份策略：

```

备份地址：10.10.20.199:/backup/jira/jira-data/

备份脚本：

数据库备份：每天晚上23:00在10.10.20.199上执行备份mysqldump备份，逻辑备份成SQL文件。199上保留仅保留最近3天的数据库文件。

数据目录备份： 每天凌晨2:00在10.10.20.199上执行rsync，将原jira数据目录同步到199的/data/jira/jira-data/。

安装包备份：docker容器，已提交到dockerhub，可以直接pull，也可以从本项目构建。


```


**注意事项：jira用户上传的附件，在服务器端都会被重命名并去掉后缀。可以在 jira管理-系统-附件 中查看配置路径，默认在容器中的/var/atlassian/jira/data/attachments路径**




### jira恢复

1、 准备好目标新服务器8核/16G/200G , 安装docker和docker-compose.yml 

2、 将上述之前备份的/data/jira/docke-compose.yml和/data/jira/jira-data/放到新服务器中。

3、 把逻辑备份的sql导入到jiradb中，jiradb默认账密见docker-compose.yml。

4、 在新服务器中安装nginx，配置https和域名，转发到本地的443端口



https://blog.csdn.net/Blue_Tear/article/details/83662418
  
    
    
    
    
    
		
		
