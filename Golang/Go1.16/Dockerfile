FROM golang:1.16.5-alpine3.14
ENV GOPROXY=https://goproxy.cn \
    GO111MODULE=on \
    PS1="\w "
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
        bash \
        bash-doc \
        bash-completion \
        vim \
        tree \
        tzdata \
        git \
        protobuf \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /data/cloud \
    && mkdir -p /data/go
WORKDIR /data
EXPOSE 10000-10100
CMD ["/bin/bash"]