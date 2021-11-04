# nginx + php + mariadb (mysql)

Generación de contenedores separados para cada servicio

Una vez descargado los archivos, ejecutamos `docker-compose up -d` para descargar las imágenes y crear los contenedores necesarios.

```
Creating network "webserver_net" with driver "bridge"
Creating web-mysql ... done
Creating web-php   ... done
Creating web-nginx ... done
```

Si no tuvimos error ejecutamos `docker ps` y deberíamos tener un resultado similar a este:

```
CONTAINER ID  IMAGE         COMMAND  CREATED  STATUS  PORTS                                      NAMES
5cb05c7e5480  docker_nginx  ...      ...      ...     0.0.0.0:80->80/tcp, :::80->80/tcp          web-nginx
1e6a726edb71  docker_mysql  ...      ...      ...     0.0.0.0:3306->3306/tcp, :::3306->3306/tcp  web-mysql
9409cc51258a  docker_php    ...      ...      ...     0.0.0.0:9000->9000/tcp, :::9000->9000/tcp  web-php
```

Ahora solo nos queda probar el funcionamiento de nuestro servicio lanzando la petición `http://localhost` desde nuestro navegador.

Para probar sin funciona la petición de páginas php, ejecutamos `http://localhost/phpinfo`
Para probar si la conexión a la base de datos funciona, ejecutaremos `http://localhost/mysql`


### vhost

Este ejemplo también tiene cofigurados dos sitios web, _ejemplo1.com_ y _ejemplo2.com_ pero para poder acceder a ellos tendremos que agregar siguientes entradas en nuestro archivo hosts:

```
nano /etc/hosts

127.0.0.1  ejemplo1.com
127.0.0.1  ejemplo2.com
```

Ahora sí podremos lanzar `http://ejemplo1.com` y `http://ejemplo2.com`.


### Detener y eliminar los contenedores

Para detener los servicios utilizamos el comando `docker-compose down`. Esto detendrá (y eliminará) los contenedores definidos en nuestro script.


### Directorio de trabajo

```
.   (webserver)
├── docker
│   ├── docker-compose.yml
│   ├── mysql
│   │   ├── data
│   │   └── Dockerfile
│   ├── nginx
│   │   ├── conf.d
│   │   │   ├── default.conf
│   │   │   ├── ejemplo1.conf
│   │   │   └── ejemplo2.conf
│   │   └── Dockerfile
│   └── php
│       └── Dockerfile
├── html
│   ├── ejemplo1.com
│   │   └── index.html
│   ├── ejemplo2.com
│   │   └── index.html
│   ├── index.html
│   ├── mysql
│   │   └── index.php
│   └── phpinfo
│       └── index.php
└── README.md
```
