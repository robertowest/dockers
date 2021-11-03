# FROM php:7.4.25-zts-alpine3.14
FROM php:7.4-fpm

RUN docker-php-ext-install mysqli

# # agregamos depuración (xdebug )
# RUN pecl install -f xdebug \
#     && docker-php-ext-enable xdebug
#     && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini;

# # configuramos el comportamiento de xdebug
# RUN echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
#     echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
#     echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
#     echo "xdebug.idekey=VSCODE" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini


#   +----------------------------------------------------------------------+
#   |                                                                      |
#   |   INSTALLATION INSTRUCTIONS                                          |
#   |   =========================                                          |
#   |                                                                      |
#   |   See https://xdebug.org/install.php#configure-php for instructions  |
#   |   on how to enable Xdebug for PHP.                                   |
#   |                                                                      |
#   |   Documentation is available online as well:                         |
#   |   - A list of all settings:  https://xdebug.org/docs-settings.php    |
#   |   - A list of all functions: https://xdebug.org/docs-functions.php   |
#   |   - Profiling instructions:  https://xdebug.org/docs-profiling2.php  |
#   |   - Remote debugging:        https://xdebug.org/docs-debugger.php    |
#   |                                                                      |
#   |                                                                      |
#   |   NOTE: Please disregard the message                                 |
#   |       You should add "extension=xdebug.so" to php.ini                |
#   |   that is emitted by the PECL installer. This does not work for      |
#   |   Xdebug.                                                            |
#   |                                                                      |
#   +----------------------------------------------------------------------+
