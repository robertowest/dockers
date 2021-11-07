FROM httpd:latest

RUN apt-get update && \
    apt-get upgrade
RUN apt-get install nano -y
RUN apt-get install php7.3 php-xdebug -y

VOLUME /usr/local/apache2/htdocs

EXPOSE 80 443

