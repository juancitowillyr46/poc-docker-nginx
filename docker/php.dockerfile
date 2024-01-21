FROM php:8.2-fpm

# Instala las extensiones necesarias
RUN docker-php-ext-install pdo_mysql

# Instala Composer globalmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instala Xdebug
RUN pecl install -o -f xdebug-3.3.1 \
    && docker-php-ext-enable xdebug
RUN docker-php-ext-enable xdebug

# Crea directorios necesarios
RUN mkdir -p /usr/local/etc/php/conf.d /usr/local/etc/php

# Copia las configuraciones y archivos Composer
COPY ./docker/php/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini
COPY ./composer.json /var/www/html/composer.json
COPY ./composer.lock /var/www/html/composer.lock

EXPOSE 9000

CMD ["php-fpm"]