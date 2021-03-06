#!/bin/bash
# docker build -t nginx1.19 .

source ../../base.sh
path=`pwd`

docker run -itd \
    --name nginx1.19 \
    -e TZ=Asia/Shanghai \
    -p 80:80 \
    -p 81:81 \
    -p 443:443 \
    -v $cloud/project:/data/cloud \
    -v $path/../../../PHP:/data/php \
    -v $path/../../../Web:/data/web \
    -v $path/logs:/var/log/nginx \
    -v $path/conf/conf.d:/etc/nginx/conf.d \
    -v $path/conf/nginx.conf:/etc/nginx/nginx.conf \
    --network=develop \
    --ip=10.0.2.1 \
    nginx1.19