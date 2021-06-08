#!/bin/bash
path=`pwd`

docker run -itd \
    --name redis5 \
    --privileged \
    -e TZ=Asia/Shanghai \
    -p 6379:6379 \
    -v $path/conf/redis.conf:/etc/redis.conf \
    -v $path/data:/data \
    --network=develop \
    --ip=10.0.5.1 \
    redis5 \
    /bin/sh -c "echo 65535 > /proc/sys/net/core/somaxconn \
      && echo never > /sys/kernel/mm/transparent_hugepage/enabled \
      && echo never > /sys/kernel/mm/transparent_hugepage/defrag \
      && redis-server /etc/redis.conf --appendonly yes"