# github

Descargamos el proyecto de github:
```
git clone https://github.com/oracle/docker-images.git
```

# Creación de la imagen

Realizamos la creación de nuestro docker con la versión que necesitemos
```
cd docker-images/OracleDatabase/SingleInstance/dockerfiles
./buildDockerImage.sh -v 18.4.0 -x
```

El script instala la base de datos Oracle pero no crea ni configura una base de datos. 
Cuando se complete la compilación, encontrará un contenedor con el nombre con el formato `oracle/database:<VERSIÓN>-<EDICIÓN>`. 
Puede verificar esto enumerando las imágenes de Docker disponibles en el host:
```
docker images

REPOSITORY              TAG           IMAGE ID          CREATED           SIZE
oracle/database         18.4.0-xe     6a5a6370de97      1 minute ago      5.9GB
```

# Creación del contenedor

A continuación, utilice la ejecución de Docker para iniciar el contenedor Oracle Database Express Edition. Este paso tardará un poco por lo que recomiendo no hacer nada más con el contenedor para darle tiempo a que levante todos los servicios correctamente.
```
docker run --name oraclexe \
    -d \
    -p 51521:1521 \
    -p 55500:5500 \
    -e ORACLE_PWD=oracle \
    -e ORACLE_CHARACTERSET=AL32UTF8 \
    oracle/database:18.4.0-xe
```

La imagen de Docker tiene tres puntos de montajes que podrá asignarlos a un directorio correspondiente en el sistema host:
```
/opt/oracle/oradata 	      directorio de datos y archivos de configuración.
/opt/oracle/scripts/setup     directorio que contiene los scripts de shell o SQL que se ejecutan al terminar la creación de la DB.
/opt/oracle/scripts/startup   directorio que contiene los scripts de shell o SQL que se ejecutan cada vez que se inicia el contenedor.
```

# Conexión a la base de datos

Cuando la base de datos se ejecuta en el contenedor de Docker, el puerto de la base de datos se expone mediante el parámetro -p. Supongamos, por ejemplo, que SQL*Plus está instalado en el sistema host de Docker. Para conectarse a la base de datos, ejecute el siguiente comando:

Nos conectaremos a nuestro contenedor usando el usuario `oracle` del sistema operativo.
```
docker exec -it --user=oracle oraclexe bash
```

Configure las variables de entorno de Linux requeridas para Oracle DB:
```
[oracle@132c67187416 /]$ . oraenv
ORACLE_SID = [XE] ? XE
The Oracle base remains unchanged with value /opt/oracle
```

Luego acceda a SQL*Plus como lo haría en cualquier sistema de Oracle DB. Recuerde que la clave será la definida por la variable de entorno `ORACLE_PWD`.
```
sqlplus sys@XEPDB1 as sysdba
```


URL: 
https://blogs.oracle.com/oraclemagazine/post/deliver-oracle-database-18c-express-edition-in-containers
https://hub.docker.com/r/deepdiver/docker-oracle-xe-11g


