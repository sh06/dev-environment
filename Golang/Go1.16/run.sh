#!/bin/bash
# docker build -t go1.16 .
source ../../base.sh
path=`pwd`

docker run -dit \
    --name go1.16 \
    -e TZ=Asia/Shanghai \
    -p 10000-10100:10000-10100 \
    -v $cloud/project/Go/goproject:/data/cloud \
    -v $path/../../../Go/Project:/data/go \
    --network=develop \
    --ip=10.0.4.1 \
    go1.16