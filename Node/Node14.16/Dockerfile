FROM node:14.16.1-alpine3.12
ENV PS1="\w "
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
    && npm config set registry https://registry.npm.taobao.org \
    && npm install -g npm \
    && mkdir -p /data/web
WORKDIR /data
EXPOSE 8000 8080