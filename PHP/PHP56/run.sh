#!/bin/bash
# docker build -t php56 .

source ../../base.sh
path=`pwd`

docker run -itd \
    --name php56 \
    -e TZ=Asia/Shanghai \
    -p 9056:9000 \
    -v $cloud/project:/data/cloud \
    -v $path/../../../PHP:/data/php \
    -v $path/conf/www.conf:/usr/local/etc/php-fpm.d/www.conf \
    --network=develop \
    --ip=10.0.3.56 \
    php56