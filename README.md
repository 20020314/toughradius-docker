# toughradius-docker

ToughRADIUS Docker 容器部署方法， 这里通过 dcoker-compose容器编排模式提供了一套完整的集成方法

使用本方法部署， 您需要对Docker 以及 docker-compose 编排工具有足够的了解

[Github 项目地址：github.com/toughstruct/toughradius-docker](https://github.com/toughstruct/toughradius-docker)

##  环境准备

Docker 工具安装

ubuntu

	sudo apt-get install -y docker
	sudo apt-get install -y docker-compose

centos 7

	yum install -y docker
	yum install -y docker-compose

Docker 仓库加速， 由于 docker 服务器访问较慢， 最好使用国内加速代理, 通过以下方法配置

    tee /etc/docker/daemon.json <<-'EOF'
    {
        "registry-mirrors": [
            "https://1nj0zren.mirror.aliyuncs.com",
            "https://docker.mirrors.ustc.edu.cn",
            "http://f1361db2.m.daocloud.io",
            "https://registry.docker-cn.com"
        ]
    }
    EOF

##  部署流程

    test -d || /opt/toughradius

    curl https://raw.githubusercontent.com/toughstruct/toughradius-docker/master/deploy.sh -o /opt/toughradius/deploy.sh
    
    cd /opt/toughradius && sh ./deploy.sh

## 部署脚本

> deploy.sh 脚本内容

    #!/bin/bash
        
    cd /opt/toughradius
    
    # 下载容器部署描述文件
    curl https://raw.githubusercontent.com/toughstruct/toughradius-docker/master/docker-compose.yml -o docker-compose.yml
    
    # 下载数据库脚本文件
    curl https://raw.githubusercontent.com/toughstruct/toughradius-docker/master/toughradius.sql -o toughradius.sql
    
    # 拉取最新镜像
    docker-compose pull
    
    # 首先创建mysql容器
    docker-compose up -d mysql
    
    # 等待 mysql 初始化完成后再执行sql
    sleep 3
    
    # 创建数据库表
    mysql -h 127.0.0.1 -uroot -pmyroot < ./toughradius.sql
    
    # 创建所有容器
    docker-compose  up -d

## 升级脚本

> upgrade.sh 脚本内容

    #!/bin/bash

    cd /opt/toughradius

    # 尝试删除已有的容器组
    docker-compose rm -f -s

    # 下载部署文件
    curl https://raw.githubusercontent.com/toughstruct/toughradius-docker/master/docker-compose.yml -o docker-compose.yml

    docker-compose pull

    # 重建其他容器
    docker-compose  up -d

