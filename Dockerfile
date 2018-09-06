FROM php:7.3-rc-cli-alpine3.8

RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS linux-headers pcre-dev inotify-tools && \
    #docker-php-ext-install json xml pdo phar opcache pdo_mysql zip iconv mcrypt bcmath dom pcntl pdo_sqlite
    pecl install swoole && \
    docker-php-ext-enable swoole && \
    pecl install inotify && \
    docker-php-ext-enable inotify && \
    apk del .phpize-deps
