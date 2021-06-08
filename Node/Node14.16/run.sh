#!/bin/bash
path=`pwd`

docker run -itd \
    --name node14.16 \
    -e TZ=Asia/Shanghai \
    -p 8000:8000 \
    -p 8080:8080 \
    -v /Users/sh06/NutstoreFiles/我的坚果云/Development/project:/data/cloud \
    -v $path/../../../Web:/data/web \
    --network=develop \
    --ip=10.0.6.1 \
    node14.16