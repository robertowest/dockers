# primeros pasos

Nos ubicamos en la carpeta que tendrá nuestro código
```bash
cd /home/roberto/Dockers/cordova/source
```

y a continuación, creamos nuestro contenedor apuntando a la carpeta con nuestro código
```bash
docker run -it -v .:/opt/src --rm --name cordova hamdifourati/cordova-android-builder bash
```

una vez dentro de nuestro contenedor, creamos un nuevo proyecto llamado _appTest_
```bash
cordova create appTest
```

al terminar, tendremos una estructura muy simple con un desarrollo tipo _Hola Mundo_. Para continuar necesitaremos agregar una plataforma a nuestro desarrollo de prueba. 

Para conocer cuales son las plataformas habilitadas, usaremos el comando `cordova platforms` que nos mostrará un listado de plataformas.
```text
Installed platforms:
  
Available platforms:
  android
  browser
  electron
```

## Plataformas

En nuestro caso, agregaremos la plataforma _browser_ para poder ver rápidamente nuestra app
```bash
cordova platforms add browser
```

para probar nuestra app, solo ejecutaremos el comando run seguido de la plataforma que deseamos probar.
```bash
cordova run browser
```

ahora solo nos queda acceder a la url [http://localhost:8000/index.html](http://localhost:8000/index.html) o a la dirección ip de nuestro contenedor [http://172.17.0.2:8000/index.html](http://172.17.0.2:8000/index.html)

para crear nuestra aplicación para **Android** realizamos los siguientes pasos:
```bash
cordova platforms add android
cordova build android
```

En este caso utilizamos _build_ en lugar de _run_ porque queremos crear nuestra aplicación que después instalaremos en nuestro terminal. Si ejecutamos _run_, se ejecutará en el emulador que tengamos funcionando.

Al finalizar, tendremos nuestra _apk_ en la siguiente ruta:
```text
.../source/appTest/platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

para crear nuestra app lo más comprimida posible, tendremos que crear la app en modo _release_
```bash
cordova build android --release
```


## Plugins

Para añadir un plugins utilizaremos el comando
```bash
cordova plugins add [nombre_del_plugins]
```

listar plugins `cordova plugins list`

eliminar plugins `cordova plugins rm [nombre_del_plugins]`


## Firmar nuestra app para poder subir a PlayStore
```bash
keytool -genkey -v -keystore [nombre].keystore \
        -alias alias_name \
        -keyalg RSA -keysize 2048 -validity 10000

-- recomenable utilizar este comando
keytool -importkeystore \
        -srckeystore [nombre].keystore \
        -destkeystore [nombre].keystore \
        -deststoretype pkcs12
```

[nombre] podrías ser el nombre de nuestra app.

No olvidar la contraseña que utilicemos ya que la utilizaremos siempre que subamos una nueva versión.  

# firmar app con javasigner
jarsigner -verbose -sigalg SHA1withRSA \
          - digestalg SHA1 keystore [nombre].keystore android release unsigned.apk alias_name

# comprimir la app para subir una más pequeña
zipalign -v 4 [nombre].apk [nuevo_nombre].apk







docker pull beevelop/cordova
docker run -it beevelop/cordova bash


Podemos crear un contenedor apartir de la imagen:
FROM beevelop/cordova:latest

Esta imagen, contiene las siguientes dependencies
    NodeJS v20 LTS
    Cordova v12.0.0
    Android Platform Tools
    Android Build Tools 33.0.2
    Android 33




Run Builder Container

# Check dependencies are installed and configured.
docker run -v <local-app-src>:/opt/src --rm hamdifourati/cordova-android-builder cordova requirements

# Build Android apk
docker run -v <local-app-src>:/opt/src --rm hamdifourati/cordova-android-builder cordova build

Interactive shell

    Run a shell inside the conatiner

docker run -it -v <local-app-src>:/opt/src --rm hamdifourati/cordova-android-builder bash

root@cordova:/opt/src# cordova platform add android
root@cordova:/opt/src# cordova requirements
root@cordova:/opt/src# cordova build

Install in interactive shell

# attach to your already running container
docker exec -it <cordova-container-name> bash

# Install & Accept linceses
root@cordova:/opt/src# sdkmanager "platforms;android-30"

    You can always list available packages either inside the container or directly.

docker run -it --rm hamdifourati/cordova-android-builder sdkmanager --list
