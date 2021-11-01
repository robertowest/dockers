# PostgreSQL + pgAdmin

Creamos nuestro `docker-compose.yml` y definimos las imágenes que utilizaremos para crear nuestro servicio con Postgres y el gestor pgAdmin.

Utilizaremos la imágen con la última versión de postgres y nuestro contenedor se llamará `postgres`. También crearemos el contenedor para la administración que se llamará `pgadmin`.


## Imagenes y Contenedores 

### Descargamos la imagen de postgres (última versión)
docker pull postgres

### Creamos un contenedor con la imagen descargada
docker run -d \
    --name postgres \
    -e POSTGRES_PASSWORD=postgres \
    -v $PWD/data:/var/lib/postgresql/data/pgdata \
    postgres:latest

### Comandos básicos para el cntenedor
docker stop postgres    -- detenemos el contenedor
docker start postgres   -- iniciamos nuevamente el contenedor

### Acceder al contenedor activo
docker exec -it postgres /bin/bash

### PSQL
docker run -it --rm --network postgres postgres psql -h postgres -U postgres


<hr>


### Descargamos la imagen de pgAdmin4 (última versión)
docker pull dpage/pgadmin4

### Creamos un contenedor con la imagen descargada
docker run -p 80:80 \
    -e "PGADMIN_DEFAULT_EMAIL=admin@correo.com" \
    -e "PGADMIN_DEFAULT_PASSWORD=admin" \
    -d dpage/pgadmin4
