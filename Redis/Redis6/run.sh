#!/bin/bash
# docker build -t redis6 .
path=`pwd`

docker run -itd \
    --name redis6 \
    --privileged \
    -e TZ=Asia/Shanghai \
    -p 6380:6380 \
    -v $path/conf/redis.conf:/etc/redis.conf \
    -v $path/data:/data \
    --network=develop \
    --ip=10.0.5.2 \
    redis6 \
    /bin/sh -c "echo 65535 > /proc/sys/net/core/somaxconn \
      && echo never > /sys/kernel/mm/transparent_hugepage/enabled \
      && echo never > /sys/kernel/mm/transparent_hugepage/defrag \
      && redis-server /etc/redis.conf --appendonly yes"