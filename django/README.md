# Aplicación lista para implementar Django, gunicorn, NGINX en Docker
Obtener una aplicación Django 3.x en poco tiempo. En este proyecto, gunicorn se utiliza como WSGI. NGINX se utiliza como servidor proxy inverso.

## Premisa
He visto demasiados Dockerfile con código ilegible. Muchos códigos base tienen una configuración de Docker tan elaborada que no se puede modificar. Aquí, trato de simplificar Dockerfile y el archivo docker-compose tanto como sea posible, para que más de un desarrollador en un equipo entienda cómo funciona.

## Empezando
Primero definiremos nuestro árbol de directorios, el cual tendrá la siguiente estructura:

```text
.                               - carpeta raíz del proyecto
├── docker                      - archivos para la construcción de los contenedores
│   ├── django
│   │   ├── django.env          - variables de entorno
│   │   ├── Dockerfile          - Dockerfile para el contenedor django
│   │   └── requirements.txt    - requisitos para django
│   └── nginx
│       ├── default.conf        - webhost
│       └── Dockerfile          - Dockerfile para el contenedor nginx
├── proyecto                    - carpeta para el proyecto django
├── docker-compose.yml
└── README.md
```

El archivo `django.env` contendrá todas las variables de entorno que necesite nuestro proyecto. 

## Creando nuestro proyecto Django
Para crear nuesto nuevo proyecto, tendremos que realizar los siguientes pasos:

1. Crear los contenedores
2. Levantar los servicios (contenedores)
3. Crear nuestro proyecto django
4. Cambiar las configuraciones del nuevo proyecto
5. Ejecutar las migraciones y creación de usuarios

### Crear contenedores
Para crear nuestros contenedores, utilizaremos el siguiente comando:
```bash
docker-compose build
```

Este comando descargará las imágenes utilizadas y creará una nueva llamada **_django:3.2_**. El resultado final será algo similar a esto:

**Imágenes**
```text
REPOSITORY  TAG             IMAGE ID       CREATED          SIZE
django      3.2             a494bc30d67e   11 minutes ago   968MB
python      3.10            a42e2a4f3833   12 days ago      917MB
nginx       1.21.3-alpine   513f9a9d8748   3 months ago     22.9MB
```

### Levantar los servicios
Ahora nos toca levantar los servicios y ver si todo funciona correctamente, el siguiente comando creará los contenedores y levantará los servicios definidos. 
```bash
docker-compose up
```

En ese caso el resultado será similar a esto:
**Contenedores**
```text
CONTAINER ID   IMAGE                 COMMAND                  CREATED  STATUS  PORTS                   NAMES
053449b22a07   nginx:1.21.3-alpine   "/docker-entrypoint.…"   ...      ...     0.0.0.0:80->80/tcp      nginx
98f67afea267   django:3.2            "gunicorn --workers=…"   ...      ...     0.0.0.0:8000->8000/tcp  django
```

NOTA: También podríamos utilizar el comando `docker-compose up -d --build` para hacer lo mismo que se describió con dos comandos separados.

### Crear nuestro proyecto django
Ahora nos toca crear nuestro proyecto django. Yo suelo utilizar siempre `config` como nombre de la carpeta que contendrá el directorio inicial de django (el que contiene settings.py), por lo que primero será necesario crear la carpeta del proyecto y dentro de ella ejecutar el comando *django-admin*. La carpeta que contendrá el proyecto ya existe y se llama **proyecto** en nustro árbol y **code** dentro de la imagen docker.

Para crear el proyecto utilizaremos el nombre de nuestro servicio definido en nuestro docker-compose y el comando django-admin con los parámetros necesarios. Utilizaremos el *usuario* definido en nuestro Dockerfile para no tener problemas de permisos entre nuestro host y el contenedor.

```bash
docker-compose exec --user="usuario:usuario" django django-admin startproject config .
```

Para probar si funciona, lanzamos http://localhost:8000 desde nuestro navegador. 

NOTA: si el contenedor no está levantado, podemos utilizar `docker-compose run --user="usuario:usuario" --rm [servicio] [comando]` para comandos que se ejecutarán en un contenedor auto-destruible.

### Cambiar las configuraciones del nuevo proyecto
Muy bien! ahora nos toca configurar un poco nuestro nuevo proyecto. Primero modificaremos nuestro `setting.py` para que el proyecto se muestre en español. Siempre suelo dejar el archivo de configuración original y voy creando los que necesito según el entorno de trabajo. Por lo que crearemos la siguiente estructura de directorios en nuestro host:

```text
.
└── proyecto
    ├── config
    │    ├── environment
    │    │   ├── development
    │    │   │   └── settings.py
    │    │   └── production
    │    │       └── settings.py
    │    └──  settings.py
    ├── content
    │   ├── locale
    │   ├── media
    │   ├── static
    │   │   ├── assets
    │   │   ├── css
    │   │   ├── img
    │   │   ├── js
    │   │   └── vendors
    │   └── templates        
    └── manage.py

Nota: existen más archivos, pero estos sirven de referencia posicional.
```

O realizamos la copia desde la carpeta `docker/django/project` con el siguiente comando:
```bash
cp -r docker/django/project/* proyecto/
```

En el archivo *config/setting.py* agregaremos las siguientes líneas al final del archivo.

```text
# configuramos nuestra entorno dependiendo de la configuración definida
import os
if os.environ.get('IS_PRODUCTION'):
    from config.environment.production.settings import *
else:
    from config.environment.development.settings import *
```

Si refrescamos la página, deberíamos verla en español ...

### Ejecutar las migraciones y creación de usuarios
Para generar nuestro modelo inicial, será necesario realizar las aciones *makemigrations* y *migrate*. Esto generará las tablas iniciales en nuestra base de datos SQLite que viene configurada por defecto:

```bash
docker-compose exec --user="usuario:usuario" django python manage.py collectstatic
docker-compose exec --user="usuario:usuario" django python manage.py migrate
```

Ahora crearemos el super usuario para poder entrar al panel de administración:

```bash
docker-compose exec --user="usuario:usuario" django python manage.py createsuperuser --username admin --email admin@correo.com
```

Definimos la contraseña y accedemos a http://localhost:8000/admin para comprobar que podemos realizar el login sin problema.

### Agregando una aplicación a nuestro proyecto
Crearemos una aplicación llamada *_auth_* que se encargará de la autenticación de usuarios. Para ello crearemos una nueva carpeta llamada apps desde el host y dentro de ella crearemos la aplicación pero llamando al cmando desde nuestro contenedor django.
```bash
docker-compose exec --user="usuario:usuario" django python manage.py startapp auth
```

Personalmente utilizo la carpeta _*apps*_ para almacenar todas mis aplicaciones, por lo que una vez creada la nueva aplicación la moveré a dicha carpeta:
```bash
docker-compose exec --user="usuario:usuario" django mkdir apps
docker-compose exec --user="usuario:usuario" django mv auth apps/
```

Ahora modificaremos el archivo `apps/auth/apps.py` y agregaremos la ruta completa de la aplicación:
```bash
# cambiamos
name = 'auth'
# por esta 
name = 'apps.auth'
```
y agregamos la nueva aplicación a nuestra ruta en `settings.py`


## Listo
Y esto es todo... Ya estamos listos para generar nuestro proyecto.

## ¡Imporante!
Quiero destacar dos líneas importantes en nuestro `docker-compose.yml`.

```text
    restart: always
    command:
      "gunicorn --workers=2 --bind=0.0.0.0:8000 config.wsgi:application --reload"
```

La línea `restart: always` indica al contenedor que sea reiniciado cuando se detecten cambios en él. Y el comando `--reload` de la siguiente línea, indica a gunicorn que debe ser reiniciado cuando se modifique el proyecto y así podremos ver reflejados los cambios en nuestro navegador.
