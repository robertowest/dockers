# Instalación de mis Dockers (como root)

### Instalación
apt install -y docker-ce docker-ce-cli containerd.io

### Comprobar estado
systemctl status docker

### Permitir usar docker a usuario determinado
adduser ${USER} docker

### Got permission denied while trying to connect
usermod -aG docker ${USER}
chmod 666 /var/run/docker.sock



### Carpeta de trabajo

Carpeta raíz llamada dockers, dentro de ella iremos creando los diferentes proyectos 

```
.   (dockers)
├── multicontainer
│   ├── docker-compose.yml
│   ├── html
│   │   ├── connect_mysql.php
│   │   └── index.php
│   ├── mysql
│   │   ├── data
│   │   │   └── (archivos propios de MariaDB)
│   │   └── Dockerfile
│   ├── nginx
│   │   ├── conf.d
│   │   │   └── nginx.conf
│   │   └── Dockerfile
│   ├── php
│   │   └── Dockerfile
│   └── README.md
├── detener-contenedores.sh
├── docker-images-ls.sh
├── docker-ip.sh
├── docker-pid.sh
├── docker-ps-ls.sh
├── eliminar-contenedores.sh
└── README.md
```
