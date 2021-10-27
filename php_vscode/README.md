# Utilizar PHP desde vscode con docker

Dentro de nuestra carpeta de proyecto crearemos una carpeta llamada `.devcontainer` y dentro de ella crearemos dos archivos.

`.devcontainer.json` archivo de configuración de nuestro entorno
`Dockerfile`         archivo de configuración del docker

### .devcontainer.json
```
{
    "name": "Docker php",
    "dockerFile": "Dockerfile",
    "appPort": 3000,
}
```

### Dockerfile
```
FROM php:7.4-cli
```

Ahora abriremos vscode y nos preguntará que hacer con el docker encontrado, seleccionaremos _reopen in container_ y ya tendremos activo nuestro cliente php

Si abrimos un terminal, podremos ver que estaremos dentro del contenedor. Ahora podremos un crear un archivo de pruebas llamado script.php con código php y ejecutarlo desde el terminal con `php script.php`.

También podríamos levantar el servidor de desarrollo `php -S 127.0.0.1:8000` y crear un index.php que muestre la información de phpinfo()