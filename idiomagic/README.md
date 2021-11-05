docker-compose up
docker ps
docker exec -it docker_cakephp_1 bash


# CakePHP

Una vez levantados los contenedores (apache y mysql) y funcionando correctamente, podremos comenzar a trabajar con **CakePHP**.

## Instalación de CakePHP

Para crear una aplicación, utilizaremos la herramienta `Composer` (ya instalada) la cual está soportada oficialmente para el manejo de dependencias.

En este ejemplo crearemos una app llamada cake35 con la última versión de la rama 3.5 y definiremos a nuestro usuario local como dueño de la nueva app

```bash
docker exec -it [contenedor] composer create-project --prefer-dist cakephp/app:3.5.* .
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
