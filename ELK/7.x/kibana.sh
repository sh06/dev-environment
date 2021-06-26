#!/bin/bash
path=`pwd`

docker run -itd \
    --name kibana7 \
    -e TZ=Asia/Shanghai \
    -p 5601:5601 \
    -v $path/kibana/kibana.yml:/usr/share/kibana/config/kibana.yml \
    --network=develop \
    --ip=10.0.7.5 \
    kibana:7.8.1
