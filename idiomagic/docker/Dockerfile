# definimos el nombre de la imagen como cakephp:3.5
FROM php:7.0-apache

# actualizamos e instalamos requisitos
RUN apt-get update
RUN apt-get -y install curl wget apt-transport-https dirmngr 
RUN apt-get -y install nano 
RUN apt-get -y install libxml2-dev git 
RUN apt-get -y install libicu-dev g++ zlib1g-dev libmcrypt-dev
RUN apt-get -y autoremove

# mis alias de comandos utilizados
RUN echo "alias ll='ls -l --color'" >> /root/.bashrc

# instalamos COMPOSER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# instalamos extensiones para PHP
RUN docker-php-source extract
RUN docker-php-ext-configure intl && docker-php-ext-install intl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install pcntl zip simplexml

# configuración de mysql
# # RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
# #     && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
# #     && docker-php-ext-install pdo_mysql
# RUN docker-php-ext-install pdo pdo_mysql mysql
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

# activamos módulos de Apache
RUN a2enmod rewrite

# corrección del error:
# apache2: Could not reliably determine the server's fully qualified domain name
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# definimos directorio de trabajo
WORKDIR /var/www/html

# # creamos grupo y usuario con identificador 1000
# ARG USERNAME=usuario
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID
#
# # crear nuevo usuario
# RUN groupadd --gid $USER_GID $USERNAME \
#     && useradd --uid $USER_UID --gid $USER_GID -G www-data
# # USER $USERNAME
# # definimos el propietario de la carpeta de trabajo
# RUN chown -R 1000:1000 /var/www/html
