#!/bin/bash
path=`pwd`

docker run -d \
    --name mysql57 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e TZ=Asia/Shanghai \
    -p 3306:3306 \
    -v $path/datadir:/var/lib/mysql \
    -v $path/conf:/etc/mysql \
    -v $path/data/log:/var/log/mysql \
    --network=develop \
    --ip=10.10.1.1 \
    mysql:5.7.33