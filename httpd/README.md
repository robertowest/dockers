# Alpine microcontainer with Apache2

### Iniciar el contenedor

```
docker run -d --name httpd httpd:latest
```

### Acceder al contenedor

```
docker exec -ti httpd /bin/sh
```

### Construcción de la imagen mediando Dockerfile

```
docker build --tag httpd:latest .
```

**Iniciar el contenedor con acceso a directorio locales**

```
docker run -d \
    -p 80:80 -p 443:443 \
    -v ${PWD}/docker/apache/conf:/etc/httpd/conf \
    -v ${PWD}/www:/usr/local/apache2/htdocs \
    --name httpd \
    httpd:2.4
```

