#!/bin/bash
path=`pwd`

docker run -itd \
    --name es7-02 \
    -e TZ=Asia/Shanghai \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -v $path/es02/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
    -v $path/es02/data:/usr/share/elasticsearch/data \
    --ulimit memlock=-1:-1 \
    --network=develop \
    --ip=10.0.7.2 \
    elasticsearch:7.8.1
