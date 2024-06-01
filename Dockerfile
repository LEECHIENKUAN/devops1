FROM php:fpm-alpine3.19

RUN apk update && apk add --no-cache tzdata && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && apk del tzdata

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

