Aquí tienes una guía paso a paso para configurar Jenkins desde cero para usar Docker y almacenar credenciales de Docker Hub de manera segura:

### Paso 1: Preparar el Entorno

1. **Instalar Docker y Docker Compose en el Sistema Host**

https://docs.docker.com/engine/install/

### Paso 2: Construir y Ejecutar los Contenedores

1. **Construir la imagen y ejecutar los contenedores**:
   ```sh
   docker-compose up --build -d
   ```

### Paso 3: Configurar Credenciales de Docker Hub en Jenkins

1. **Abrir Jenkins**: Accede a Jenkins en tu navegador en `http://localhost:8080`.

2. **Agregar Credenciales**:
   - Ve a **"Administrar Jenkins"** > **"Administrar Credenciales"**.
   - Selecciona **"(global)"** o el dominio adecuado y haz clic en **"Agregar credenciales"**.
   - En **"Tipo de credencial"**, selecciona **"Username with password"**.
   - Introduce tu **nombre de usuario** y **contraseña** de Docker Hub.
   - Asigna un **ID** (por ejemplo, `docker-hub-credentials`) y una **descripción**.

3. **Configurar Acceso SSH**:
   - Generar una clave SSH (si no tienes una):

   '''
   sh
   Copy code
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   '''
   - Agregar la clave pública (id_rsa.pub) al servidor remoto. Puedes añadirla al archivo ~/.ssh/authorized_keys en el servidor.

4. **Agregar la clave privada (id_rsa) a Jenkins:

   - Ve a "Administrar Jenkins" > "Administrar credenciales".
   - Selecciona el dominio adecuado (generalmente "(global)").
   - Haz clic en "Agregar credenciales".
   - Tipo: "SSH Username with private key".
   - ID: deploy-ssh-key.
   - Descripción: Opcionalmente, proporciona una descripción.
   - Usuario: El nombre de usuario en el servidor remoto.
   - Clave privada: Pega el contenido de tu archivo id_rsa aquí.


### Paso 4: Crear y Configurar el Pipeline en Jenkins

1. **Crear un Pipeline**:
   - Ve a **"Nuevo Item"** en el dashboard de Jenkins.
   - Elige **"Pipeline"** y proporciona un nombre para tu proyecto.
   - En **"Definición"**, selecciona **"Pipeline script"** y copia el código del archivo pipeline.

### Paso 5: Ejecutar el Pipeline

1. **Ejecutar el Pipeline**:
   - Guarda el pipeline y haz clic en **"Construir ahora"** para ejecutar el proceso.
   - Revisa los logs y el resultado de la ejecución para asegurarte de que todo funcione correctamente.
