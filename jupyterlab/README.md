# Anaconda

### Construcción de la imagen mediando Dockerfile

```
docker build --tag jupyter:latest .
```


### Iniciar el contenedor

```
docker run -it \
    -p 8888:8888 \
    -v ${PWD}/notebooks:/opt/notebooks \
    --name jupyter \
    jupyter:latest /bin/bash \
        -c "jupyter notebook --ip='*' --port=8888 --no-browser --notebook-dir=/opt/notebooks --allow-root"
```


### Acceder al contenedor

```
docker exec -it jupyter:latest /bin/bash
```





otra posibilidad
```
docker run -it \
	-p 8888:8888 jupyterlab:latest /bin/bash \
    -c "jupyter-lab --ip='*' --port=8888 --no-browser --allow-root --notebook-dir=/opt/notebooks"


docker run -it \
	-p 8888:8888 jupyterlab:latest /bin/bash \
    -c "conda install jupyter -y --quiet && \
    mkdir -p /opt/notebooks && \
    jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8888 \
    --no-browser --allow-root"
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

