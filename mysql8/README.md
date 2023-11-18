# MySQL Server 8

## Crear contenedor mediante compose

```bash
docker-compose up
```

## Crear contenedor manualmente

Creamos el contenedor llamado `mysql8` y definimos el directorio _data_ para almacenar las bases de datos que vayamos a crear.

```bash
docker run --name mysql8 \
       -v ~/Dockers/mysql8/data:/var/lib/mysql \
       -e MYSQL_ROOT_PASSWORD=roberto \
       -d mysql:latest \
       --character-set-server=utf8mb4 \
       --collation-server=utf8mb4_unicode_ci
```

También podríamos tener nuestro archivo de configuración en un directorio local

```
    -v ~/Dockers/mysql8/conf:/etc/mysql \
```

Ahora crearemos un segundo contenedor con el administrador `phpmyadmin` el cual deberá estar asociado al primer contenedor para poder acceder a las bases de datos.

```bash
docker run -d \
    --name myadmin \
    -v ~/Dockers/mysql8/data:/var/lib/mysql \
    -e PMA_ARBITRARY=1 \
    -e PMA_HOST=mysql8 \
    --link mysql8 \
    -p 8080:80 \
    phpmyadmin:latest
```
