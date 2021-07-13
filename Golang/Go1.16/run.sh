#!/bin/bash
path=`pwd`

docker run -dit \
    --name go1.16 \
    -e TZ=Asia/Shanghai \
    -p 10000-10100:10000-10100 \
    -v /Users/sh06/NutstoreFiles/我的坚果云/Development/project/Go/goproject:/data/cloud \
    -v $path/../../../Go/Project:/data/go \
    --network=develop \
    --ip=10.0.4.1 \
    go1.16