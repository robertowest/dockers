FROM php:7.4-fpm

# instalamos las dependencias necesarias
RUN apt-get update
RUN apt-get install -y \
    build-essential \
    libicu-dev \
    libonig-dev \
    libpq-dev \
    zip \
    unzip \
    libzip-dev \
    zlib1g-dev \
    curl

# eliminamos los arhivos innecesarios pra reducir tamaño de la imagen
RUN rm -r /var/lib/apt/lists/*

# instalación y configuración de mysql
# RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# configuramos la módulos de php
RUN docker-php-ext-install \
  intl \
  mbstring \
  pcntl \
  pdo_mysql \
  zip \
  opcache

# instalación de composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# instalación de xdebug, habilitación de la extensión y configuración
RUN pecl install -f xdebug
RUN docker-php-ext-enable xdebug
# && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;

# # configuramos el comportamiento de xdebug
# RUN echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
#     echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
#     echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
#     echo "xdebug.idekey=VSCODE" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# seleccionamos el directorio definido en nginx
WORKDIR /usr/share/nginx/html
