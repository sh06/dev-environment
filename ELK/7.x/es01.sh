#!/bin/bash
path=`pwd`

docker run -itd \
    --name es7-01 \
    -e TZ=Asia/Shanghai \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -p 9200:9200 \
    -v $path/es01/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
    -v $path/es01/data:/usr/share/elasticsearch/data \
    --ulimit memlock=-1:-1 \
    --network=develop \
    --ip=10.0.7.1 \
    elasticsearch:7.8.1