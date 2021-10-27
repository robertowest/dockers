# nginx + php + mariadb (mysql)

Generación de contenedores separados para cada servicio

Una vez descargado los archivos, ejecutamos `docker-compose up -d` para descargar las imágenes y crear los contenedores necesarios.

```
Creating network "multicontainer_app_net" with driver "bridge"
Creating multi-mysql ... done
Creating multi-php   ... done
Creating multi-nginx ... done
```

Si no tuvimos error ejecutamos `docker ps` y deberíamos tener un resultado similar a este:

```
CONTAINER ID  IMAGE                COMMAND                 CREATED  STATUS  PORTS                                      NAMES
7129887b34b0  nginx:1.21.3-alpine  "/docker-entrypoint.…"  ...      ...     0.0.0.0:80->80/tcp, :::80->80/tcp          multi-nginx
28fdf36e4fb0  php:7.4-fpm          "docker-php-entrypoi…"  ...      ...     0.0.0.0:9000->9000/tcp, :::9000->9000/tcp  multi-php
e38744a98ac7  mariadb:10.6.4       "docker-entrypoint.s…"  ...      ...     0.0.0.0:3306->3306/tcp, :::3306->3306/tcp  multi-mysql
```

Ahora solo nos queda probar el funcionamiento de nuestro servicio lanzando la petición `http://localhost/index.php` desde nuestro navegador.

Y para probar si la conexión a la base de datos funciona, ejecutaremos el script `http://localhost/connect_mysql.php`


### Detener y eliminar los contenedores

Para detener los servicios utilizamos el comando `docker-compose down`. Esto detendrá (y eliminará) los contenedores definidos en nuestro script.


### Directorio de trabajo

```
.   (multicontainer)
├── docker-compose.yml
├── html
│   ├── conexion_db.php
│   └── index.php
├── mysql
│   ├── data
│   │   └── ...
│   └── Dockerfile
├── nginx
│   ├── conf.d
│   │   └── nginx.conf
│   └── Dockerfile
├── php
│   └── Dockerfile
└── README.md
```
