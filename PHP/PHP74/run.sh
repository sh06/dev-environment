#!/bin/bash
path=`pwd`

docker run -itd \
    --name php74 \
    -e TZ=Asia/Shanghai \
    -p 9074:9000 \
    -v /Users/sh06/NutstoreFiles/我的坚果云/Development/project:/data/cloud \
    -v $path/../../../PHP:/data/php \
    -v $path/conf/www.conf:/usr/local/etc/php-fpm.d/www.conf \
    -v $path/conf/php-fpm.conf:/usr/local/etc/php-fpm.conf \
    --network=develop \
    --ip=10.0.3.74 \
    php74