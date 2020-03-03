FROM php:7.2-apache
RUN docker-php-ext-install pdo_mysql mysqli
COPY ./uploads.ini /usr/local/etc/php/conf.d/uploads.ini
