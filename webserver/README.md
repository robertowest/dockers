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


# CakePHP

Una vez levantados los tres contenedores (nginx, php y mysql) y funcionando correctamente, podremos comenzar a trabajar con **CakePHP**. En realidad, esta instalación nos servirá para trabajar con cualquier framework haciendo las modificaciones necesarias en `docker/php/Dockerfile`. Nuestro contenedor solo tiene instalado php y composer, también se habilitaron las extensiones para acceder a mysql y la instalación de xdebug.

## Instalación de CakePHP

Para crear una aplicación, utilizaremos la herramienta `Composer` (ya instalada) la cual está soportada oficialmente para el manejo de dependencias.

En este ejemplo crearemos una app llamada cake35 con la última versión de la rama 3.5 y definiremos a nuestro usuario local como dueño de la nueva app

```bash
docker exec -it web-php composer create-project --prefer-dist cakephp/app:3.5.* cake35
```

Una vez que Composer termine de descargar el esqueleto y la librería core de CakePHP, deberías tener una aplicación funcional de CakePHP instalada vía Composer. Asegúrate de que los ficheros composer.json y composer.lock se mantengan junto con el resto de tu código fuente.

> En este apartado no tocará cambiar el propietario de nuestra nueva carpeta con el usuario que utilizamos en nuestro host. También será necesario definir permisos totales para la carpeta logs y tmp de la aplicación.
>
> ```bash
> sudo chown -R $USER.$USER cake35/
> chmod 777 -R cake35/logs/ cake35/tmp/
> ```

Si recibimos algún mensaje de alerta, ralizamos los pasos indicados para solucionar las advertencias y/o alertas.

Ahora puedes visitar el destino donde instalaste la aplicación y ver los diferentes avisos tipo semáforo de los ajustes.

