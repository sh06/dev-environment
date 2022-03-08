#!/bin/bash
# docker build -t php80 .
source ../../base.sh
path=`pwd`

docker run -itd \
    --name php80 \
    -e TZ=Asia/Shanghai \
    -p 9080:9000 \
    -v $cloud/project:/data/cloud \
    -v $path/../../../PHP:/data/php \
    -v $path/conf/www.conf:/usr/local/etc/php-fpm.d/www.conf \
    -v $path/conf/php-fpm.conf:/usr/local/etc/php-fpm.conf \
    --network=develop \
    --ip=10.0.3.80 \
    php80