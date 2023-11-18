#!/bin/bash

# levanta un contenedor con la base de datos (/etc/mysql)
docker run --name mariadb \
       -v ~/Dockers/mariadb/data:/var/lib/mysql \
       -e MYSQL_ROOT_PASSWORD=roberto \
       -d mariadb:latest \
       --character-set-server=utf8mb4 \
       --collation-server=utf8mb4_unicode_ci

#      -v ~/Docker/mariadb/conf:/etc/mysql \


# levanta dos contenedores, la base de datos y phpmyadmin
# docker-compose up -d

# docker inspect mariadb|grep IPAddress


# levanta un contenedor para phpMyAdmin asociado al motor mariadb
docker run --name myadmin -d \
       -v ~/Dockers/mariadb/data:/var/lib/mysql \
       -e PMA_ARBITRARY=1 \
       -e PMA_HOST=mariadb \
       --link mariadb \
       -p 8080:80 \
       phpmyadmin/phpmyadmin:latest
