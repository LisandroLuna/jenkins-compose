## Instalamos Jenkins

Ejecutamos:

```
docker compose up -d
```

Vamos a `http://localhost:8080/`

Obtenemos la contraseña corriendo el comando del archivo pass.sh en este repo. 

Instalamos los plugins sugeridos. 

Aguardamos que finalice.


--------------

## Instalación y Configuración del Plugin "Pipeline Stage View" en Jenkins

### 1. Acceder a Jenkins

1. Abre tu navegador web.
2. Accede a la URL de tu servidor Jenkins `http://localhost:8080`.

### 2. Iniciar Sesión en Jenkins

1. Introduce tus credenciales de usuario (nombre de usuario y contraseña).
2. Haz clic en "Iniciar sesión".

### 3. Acceder a la Gestión de Plugins

1. En la barra lateral izquierda, haz clic en **"Administrar Jenkins"**.
2. Luego, selecciona **"Gestionar Plugins"**.

### 4. Buscar el Plugin "Pipeline Stage View"

1. En la pestaña **"Disponible"**, utiliza la caja de búsqueda en la parte superior derecha para buscar el plugin.
2. Escribe **"Pipeline Stage View"** en el campo de búsqueda.

### 5. Instalar el Plugin

1. Marca la casilla junto al plugin **"Pipeline Stage View"**.
2. Haz clic en **"Instalar sin reiniciar"**.

   ![Instalar Plugin](https://www.jenkins.io/images/screenshots/manage_plugins/available_plugins.png)

3. Espera a que la instalación se complete. Esto puede tardar unos minutos.

### 6. Verificar la Instalación

1. Después de la instalación, regresa a la pantalla principal de Jenkins.
2. En la barra lateral izquierda, selecciona **"Administrar Jenkins"** nuevamente.
3. Elige **"Administrar Plugins"** y ve a la pestaña **"Instalado"**.
4. Asegúrate de que **"Pipeline Stage View"** aparezca en la lista de plugins instalados.

   ![Verificar Plugin](https://www.jenkins.io/images/screenshots/manage_plugins/installed_plugins.png)

