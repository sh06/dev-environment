FROM golang:1.16.3-alpine3.13
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
        tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir /goproject
WORKDIR /goproject
EXPOSE 1-65535
CMD ["/bin/bash"]