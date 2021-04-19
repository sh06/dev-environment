FROM php:7.2.34-fpm-alpine3.12
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
&& apk update \
&& apk upgrade \
&& apk add --no-cache \
        libmcrypt-dev \
        freetype-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        autoconf \
        gcc \
        g++ \
        make \
&& docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
&& docker-php-ext-install -j$(nproc) gd \
&& docker-php-ext-install pdo_mysql sockets mysqli opcache zip \
&& pecl install redis \
&& docker-php-ext-enable redis
EXPOSE 9000
CMD ["php-fpm"]