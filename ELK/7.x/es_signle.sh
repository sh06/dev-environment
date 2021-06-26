#!/bin/bash
path=`pwd`

docker run -itd \
    --name es7_signle \
    -e TZ=Asia/Shanghai \
    -e "discovery.type=single-node" \
    -v $path/es_signle/data:/usr/share/elasticsearch/data \
    -p 9200:9200 \
    -p 9300:9300 \
    --network=develop \
    --ip=10.0.7.1 \
    elasticsearch:7.8.1
