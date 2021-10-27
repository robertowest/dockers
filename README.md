# ¿Qué es Docker?
La idea detrás de Docker es crear contenedores ligeros y portables para las aplicaciones software que puedan ejecutarse en cualquier máquina con Docker instalado, independientemente del sistema operativo que la máquina tenga por debajo, facilitando así también los despliegues.

# ¿Qué beneficios tiene esto?

Docker es una herramienta diseñada para beneficiar tanto a desarrolladores, testers, como administradores de sistemas, en relación a las máquinas, a los entornos en sí donde se ejecutan las aplicaciones software, los procesos de despliegue, etc.

En el caso de los desarrolladores, el uso de Docker hace que puedan centrarse en desarrollar su código sin preocuparse de si dicho código funcionará en la máquina en la que se ejecutará.

# ¿Qué diferencia hay entre Docker y una máquina virtual?

El concepto es algo similar, pero un contenedor no es lo mismo que una máquina virtual. Un contenedor es más ligero, ya que mientras que a una máquina virtual necesitas instalarle un sistema operativo para funcionar, un contenedor de Docker funciona utilizando el sistema operativo que tiene la máquina en la que se ejecuta el contenedor.

# Instalando Docker

En primer lugar refrescamos la caché del gestor de paquetes en Ubuntu.

```bash
$ sudo apt-get update
```

En segundo lugar nos aseguramos de tener instalado apt-transport-https y ca-certificates.

```bash
$ sudo apt-get install apt-transport-https ca-certificates
```

El tercer paso consiste en añadir la clave GPG.

```bash
$ sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
```

Después el usuario tiene que abrir o crear el fichero /etc/apt/sources.list.d/docker.list.

```bash
$ sudo nano /etc/apt/sources.list.d/docker.list
```

Agregamos la siguiente línea al archivo docker.list que hace referencia al repositorio y actualizamos.

```bash
deb https://apt.dockerproject.org/repo ubuntu-xenial main
$ sudo apt-get update
```

Ya podemos instalar Docker de verdad.

```bash
$ sudo apt-get install docker.io
```

Para asegurarnos de que Docker está en funcionamiento, reiniciaremos el servicio a través de systemd.

```bash
$ sudo systemctl restart docker
```

# Descargar imágenes y crear contenedores

Ahora mismo el usuario que puede utilizar Docker es root, lo que en Ubuntu fuerza a utilizar sudo cada vez que quiera hacer algo relacionado con los contenedores o su servicio. Para hacer su utilización más práctica se puede incluir nuestro usuario en el grupo del servicio de contenedores con estos dos comandos y sustituyendo username por el nombre de vuestro usuario.

```bash
$ sudo usermod -aG docker ${USER}
$ newgrp docker    # Esto permite refrescar el grupo sin tener que reiniciar
```

Si se genera el error `Got permission denied while trying to connect` no solucionamos dando permisos al siguiente archivo:

```bash
sudo chmod 666 /var/run/docker.sock
```


# Cómo obtener un contenedor

Los contenedores Docker se almacenan en forma de imágenes preconfiguradas (en esta página podremos comprobar la cantidad de imagen ya creadas https://hub.docker.com/explore/).

Por ejemplo, para buscar una imagen de postgres ejecutar el siguiente comando. 

```bash
$ docker search postgres
```

Ahora instalaremos la imagen de postgres (version 9.5) en nuestro sistema anfitrion.

```bash
$ docker pull postgres:9.5
```

Listar las imágenes descargadas en nuestro sistema anfitrión.

```bash
$ docker images
```

Creamos un contenedor para nuestra imagen que conectará un determinado puerto con interno con el puerto de nuestro sistema anfitrion. En este ejemplo los puertos internos y externos serán los mismos (5432 puerto estandar de postgres).

```bash
$ docker run -p [puerto del sistema]:[puerto del contenedor] --name [nombre del contenedor] -v [carpeta del sistema]:[carpeta del contenedor]
$ docker run -p 5432:5432 --name postgres95 -v /home/roberto/Desarrollo/postgres95/data:/var/lib/postgresql/data -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:9.5
```

Ahora ingresamos a nuestro contenedor para poder usar postgres.

```bash
$ docker exec -it postgres95 psql -U postgres
```

Para ingresar al contenedor como si fuese una máquina.

```bash
$ docker exec -it postgres95 /bin/bash
```

Para acceder al contenedor, además de crearlo, se puede hacer de dos maneras. Una es haciendo referencia al IMAGE ID y otra al repositorio (REPOSITORY) y la etiqueta (TAG).

```bash
$ docker run -i -t [IMAGE ID] /bin/bash

O también:

$ docker run -i -t [TAG] /bin/bash
```

Para detener la ejecución de un contenedor lo hacemos, como siempre, utilizando nombre o id

```bash
$ docker stop [IMAGE ID]    # o la etiqueta [NAME]
```

Con el siguiente comando podremos verificar que no hay ningún contenedor funcionando.

```bash
$ docker ps
```

También podemos ver todos los contenedores que hemos definido estén o no activos. Para ello utilizamos el comando.

```bash
$ docker ps -a
```

Si activar nuevamente nuestro contenedor utilizaremos el comando siguiente.

```bash
$ docker start [IMAGE ID]    # o la etiqueta [NAME]
```


# Más información

El usuario también puede ponerle una etiqueta personalizada que haga referencia a una imagen instalada en su sistema. Esto puede venir bien para tener un poco más de organización cuando se utilizan muchas imágenes, más cuando son del mismo sistema. Para crear una etiqueta para una imagen presente solo hay que ejecutar lo siguiente.

```bash
$ docker tag [IMAGE ID] [REPOSITORY]:[TAG]
```

Para crear el contenedor y ponerlo en marcha hay que seguir el mismo paso de antes, pero cambiando la referencia por la etiqueta creada por el usuario.

```bash
$ docker run -i -t [REPOSITORY]:[TAG] /bin/bash
```

Es importante mencionar que cada vez que ejecutamos el comando run de Docker estamos creando un nuevo contenedor, que puede ser listado luego con "docker ps -a".

Hay dos maneras de poner en marcha el contenedor a través del mismo comando, pudiéndose utilizar su identificador (CONTAINDER ID) o su nombre (NAMES).

```bash
$ docker start ef7e107e0aae
$ docker start lonely_wing
```

Con esto iniciamos el contenedor sin acceder a él, algo que viene bien si hemos construido un LAMP y queremos acceder a él desde un servidor FTP. Sí, los contenedores Docker funcionan con la misma lógica que el sistema anfitrión, siendo la instalación de aplicaciones y su configuración exactamente igual. En caso de la imagen de Ubuntu 14.04 que estamos usando, se puede emplear apt-get para instalar las aplicaciones y Upstart para iniciar y apagar servicios. También es importante mencionar que cuando se accede a un contenedor se utiliza la cuenta de root por defecto.

Si se quiere acceder (attach, que se podría traducir por adjuntar o unir) al contendor se puede recurrir a una de estas dos opciones.

```bash
$ docker attach [IMAGE ID]
$ docker attach [TAG]
```

Para detener un contenedor es obvio que hay que recurrir a stop.

```bash
$ docker stop [IMAGE ID]
$ docker stop [TAG]
```

**Guardar una imagen**

¿Ya tenemos listo el contenedor como lo queríamos?, ¿ya tiene instalado lo que necesitamos? Para ello se puede crear una imagen de un contenedor con la siguiente línea de comando, almacenándola en el repositorio local. Con esto se podrá generar nuevas imágenes derivadas de esta, además de otros contenedores, sin tener que repetir de nuevo los pasos. La referencia (ef7e107e0aae) que aparece en la línea de comando corresponde al identificador del contenedor, no de la imagen.

```bash
$ docker commit ef7e107e0aae ubuntu:14.04
```

**Cómo borrar un contenedor y una imagen**

Como es obvio, podría llegar el momento en que nos interese eliminar un contenedor o un imagen de nuestro sistema por el motivo que sea. Hay que tener en cuenta que cada contenedor está relacionada con una imagen y una imagen puede ser utilizada por varios contenedores, por lo que se requiere de borrar los contenedores relacionados con la imagen antes de proceder al borrado de la imagen.

Para borrar un contenedor se puede emplear el identificador o bien el nombre.

```bash
$ docker rm ef7e107e0aae
```

O también:

```bash
$ docker rm lonely_wing
```

Para borrar una imagen se recomienda utilizar el identificador y no el nombre.


# Cambiar el directorio de datos de docker

Las imagenes y contenedores de docker pueden llegar a ocupan mucho espacio, si esto ocurre, podemos cambiar la ubicación del directorio de datos para liberar espacio.

El directorio original (en mi caso) se encuentra en `/var/lib/docker/` y lo cambiaré por `/home/dockers`.

Para ello será necesario crear el archivo `/etc/docker/daemon.json` con el siguiente contenido:

```
{
	"data-root": "/home/docker"
}
```

Ahora nos tocas detener el servicio, mover nuestros archivos, reiniciar el servicio y comprobar la nueva ubicación.

```bash
$ sudo service docker stop
```

Copiamos el directorio original al nuevo y lo renombramos por seguridad (ya lo borraremos después)

```bash
sudo rsync -aP /var/lib/docker/ /home/dockers
sudo mv /var/lib/docker /var/lib/docker.old
```

Reiniciamos el servicio docker y todo debería estar como antes del cambio.

```bash
$ sudo service docker start
```

Confirmar la nueva ubicación

```bash
$ docker info | grep -i root
```

Después de comprobar que todo está ok, ya podemos borrar el original y habremos terminado con la operación del todo:

```bash
sudo rm -rf /var/lib/docker.old
```

Y listo, a partir de ahora todos los datos (contenedores, volúmenes, etc...) los guardará en ese directorio.


# Creando imágenes mediante `Dockerfile`

Docker puede construir imágenes automáticamente, leyendo las instrucciones indicadas en un fichero `Dockerfile`. Se trata de un documento de texto que contiene todas las órdenes a las que un usuario puede llamar, desde la línea de comandos, para crear una imagen. En esta [página](https://docs.docker.com/engine/reference/builder/) podemos encontrar todas las órdenes que se pueden utilizar. Además, podemos consultar las [buenas prácticas](https://github.com/docker-library/buildpack-deps/blob/master/jessie/Dockerfile) recomendadas.

Los pasos principales para crear una imagen a partir de un fichero `Dockerfile` son:

1. Crear el directorio que contenga el fichero `Dockerfile` (y otros ficheros que fuesen necesarios).
2. Crear el contenido.
3. Construir la imagen mediante el comando docker build.

La sintaxis para el comando es:

```bash
$ docker build [opciones] RUTA | URL | -
```

**Ejemplo**:

```bash
$ mkdir imagentest
$ cd imagentest/
$ nano Dockerfile
```

Indicamos en el script qué imagen base vamos a utilizar mediante `FROM`, después con `RUN` apuntamos los comandos a ejecutar y con `CMD` decimos el comando por defecto:

```text
FROM ubuntu:latest

RUN apt-get -y update; \
    apt-get -y upgrade; \
    apt-get -y install apt-utils nano htop;
RUN apt-get -y install dstat

CMD ["bash"]
```

Una vez creado el fichero y editado, lo guardamos. Ahora realizamos la construcción de la imagen:

```bash
docker build -t "ubuntutest:latest" .
```

Si todo salió bien, ya tendremos creada nuestra imagen basada en la última versión de `Ubuntu` y lo podremos comprobar con el comando:

```bash
$ docker images

REPOSITORY   TAG      IMAGE ID       CREATED          SIZE
ubuntutest   latest   303552f57345   10 seconds ago   149MB
```

Ahora nos toca crear un contenedor que utilice nuestra nueva imagen

```bash
$ docker run -itd --name ubuntucontenedor ubuntutest:latest
```

Y accedemos a él para comprobar que, efectivamente, los programas instalados están disponibles:

```bash
$ docker exec -it ubuntucontenedor /bin/bash
root@[container_id]:/# dstat
```

Podemos ver que el comando `dstat` se ha instalado sin problema y funciona correctamente, lo mismo podemos decir con el resto de programas indicados en el script del Dockerfile.
