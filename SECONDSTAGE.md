## Vamos a conectar nuestro pipeline con Github Webhooks

1-  Nos registramos en ngrok.com e instalamos su aplicativo para poder exponer nuestro desarrollo local.

2- Al exponerlo nos va a proveer una URL que usaremos mas adelante, asi que hay que copiarla y tenerla a mano.

Ejemplo: https://435gg3344.ngrok.io/

3- Ve al repositorio de tu proyecto de NodeJs (en nuestra practica https://github.com/LisandroLuna/simple-nodejs).

4- Ve a 'Settings' en la esquina superior derecha.

5- Haz clic en 'Webhooks' en la columna izquierda.

6- Haz clic en 'Add webhook'.
```
Payload URL: https://435gg3344.ngrok.io/github-webhook/ (Reemplaza por tu URL)
Content type: application/json
Secret: no ingresamos nada
SSL Verification: enabled
Which events would you like to trigger this webhook?: Just the push event. 
```

7- Guardamos clickeando 'Save'

8- Dentro de Jenkins, vamos a 'Dashboard -> Manage Jenkins -> System' y en el campo 'Jenkins URL' cargamos la URL del paso anterior.

9- Tambien dentro de Jenkins, vamos a nuestro pipeline y elegimos la opcion configure, tildamos el checkbox 'GitHub project' e ingresamos en 'Project URL' la url de nuestro repo de codigo (donde esta el codigo de NodeJs).

10- En el mismo repo tambien tildamos 'GitHub hook trigger for GITScm polling' y damos 'Save'.
