# MariaDB (MySQL)

Creamos el contenedor llamado `mariadb` y definimos el directorio _data_ para almacenar las bases de datos que vayamos a crear.

```bash
docker run -d \
    --name mariadb \
    -v $PWD/data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=roberto \
    mariadb:latest --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
```

También podríamos tener nuestro archivo de configuración en un directorio local

```
    -v $PWD/conf:/etc/mysql \
```

Ahora crearemos un segundo contenedor con el administrador `phpmyadmin` el cual deberá estar asociado al primer contenedor para poder acceder a las bases de datos.

```bash
docker run -d \
    --name myadmin \
    -v $PWD/data:/var/lib/mysql \
    -e PMA_ARBITRARY=1 \
    -e PMA_HOST=mariadb \
    --link mariadb \
    -p 8080:80 \
    phpmyadmin/phpmyadmin:latest
```
