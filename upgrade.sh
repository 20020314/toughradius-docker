#!/bin/bash

cd /opt/toughradius

# 尝试删除已有的容器组
docker-compose rm -f -s

# 下载部署文件
curl https://raw.githubusercontent.com/toughstruct/toughradius-docker/master/docker-compose.yml -o docker-compose.yml

docker-compose pull

# 重建其他容器
docker-compose  up -d