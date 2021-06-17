#!/bin/bash
path=`pwd`

docker run -itd \
    --name es7.8 \
    -e TZ=Asia/Shanghai \
    -e "discovery.type=single-node" \
    -p 9200:9200 \
    -p 9300:9300 \
    --network=develop \
    --ip=10.0.7.1 \
    elasticsearch:7.8.1
