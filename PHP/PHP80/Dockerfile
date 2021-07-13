FROM php:8.0.3-fpm-alpine3.13
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
        libzip-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libwebp-dev \
        zlib-dev \
        autoconf \
        gcc \
        g++ \
        make \
        tzdata \
    && docker-php-ext-configure gd \
        --with-webp=/usr/include/webp \
        --with-jpeg=/usr/include \
        --with-freetype=/usr/include/freetype2 \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install \
        pdo_mysql \
        sockets \
        mysqli \
        opcache \
        zip \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /data/php \
    && mkdir -p /data/cloud
WORKDIR /data
EXPOSE 9000
CMD ["php-fpm"]