Aquí tienes una guía paso a paso para configurar Jenkins desde cero para usar Docker y almacenar credenciales de Docker Hub de manera segura:

### Prerequisitos:
#### Generar par de claves SSH en Linux:
Abre la Terminal;
Inserta el siguiente comando:
```ssh-keygen -t rsa```
A continuación, tendrás que escribir la ubicación del archivo en el que deseas guardar la clave privada.
```Enter file in which to save the key (/home/youruser/.ssh/id_rsa):```
La key pública se guardará en la misma ubicación, con el mismo nombre de archivo, pero con la extensión .pub. No escribas nada para usar la ubicación predeterminada, que es /home/youruser/.ssh/id_rsa.

Por último, tecleamos enter apra dejar vacia la passphrase:
```Enter passphrase (empty for no passphrase):```

El proceso completo de generación de la clave debería parecerse al siguiente:
```
user@localhost: ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/home/youruser/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in id_rsa.
Your public key has been saved in id_rsa.pub.
The key fingerprint is:
16:8e:e8:f2:1d:c9:b9:cf:43:9a:b3:3c:c1:1f:95:93 user@localhost
```
Esto creará una clave privada escrita en /home/user/.ssh/id_dsa y una clave pública escrita en /home/user/.ssh/id_dsa.pub.

La key privada debe cargarse en su Terminal usando el comando ssh-add:
```
ssh-add /home/youruser/.ssh/id_rsa
```

#### Habilitar servicio SSH Server en Linux:

Instalar el servidor SSH:
Abre una terminal y ejecuta el siguiente comando:
```sudo apt update && sudo apt install openssh-server```

Para distribuciones basadas en Red Hat (como CentOS, Fedora), usa:
```sudo yum install openssh-server```

Inicia el servicio SSH con el siguiente comando:
```sudo systemctl start ssh```

Para asegurarte de que SSH se inicie automáticamente al arrancar el sistema, habilítalo:
```sudo systemctl enable ssh```

En distribuciones basadas en Red Hat, el nombre del servicio es sshd:
```sudo systemctl start sshd
sudo systemctl enable sshd
```
Verificar el estado del servicio SSH:
sudo systemctl status ssh

En distribuciones basadas en Red Hat:
```sudo systemctl status sshd```

Permitir SSH a través del firewall (si está habilitado):
```sudo ufw allow ssh```
En distribuciones basadas en Red Hat, usa firewalld:
```
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

#### Agregar tu clave publica en la VM de destino

Crear el directorio .ssh en la VM (si no existe):

Ejecuta los siguientes comandos en la terminal de la VM:
```
mkdir -p ~/.ssh
chmod 700 ~/.ssh```

Agregar la clave pública al archivo authorized_keys:

Abre el archivo authorized_keys en la VM:
```
nano ~/.ssh/authorized_keys```

Si el archivo no existe, se creará automáticamente.
En la máquina desde la que deseas conectarte, abre el archivo que contiene tu clave pública (generalmente ~/.ssh/id_rsa.pub) y copia su contenido.
Pega el contenido de la clave pública en el archivo authorized_keys de la VM.
Guarda el archivo y cierra el editor.
Establecer permisos correctos en el archivo authorized_keys:

Asegúrate de que el archivo tenga los permisos correctos:
```
chmod 600 ~/.ssh/authorized_keys```

(Opcional) Reiniciar el servicio SSH:

En la VM, reinicia el servicio SSH para asegurarte de que los cambios se apliquen:
```
sudo systemctl restart ssh```

En distribuciones basadas en Red Hat:
```
sudo systemctl restart sshd
```

### Paso 1: Preparar el Entorno

1. **Instalar Docker y Docker Compose en el Sistema Host**

https://docs.docker.com/engine/install/

#### Iniciar sesion en DockerHub Linux:

```docker login```

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

--------------

# Instalación y Configuración del Plugin "Pipeline Stage View" en Jenkins

## 1. Acceder a Jenkins

1. Abre tu navegador web.
2. Accede a la URL de tu servidor Jenkins `http://localhost:8080`.

## 2. Iniciar Sesión en Jenkins

1. Introduce tus credenciales de usuario (nombre de usuario y contraseña).
2. Haz clic en "Iniciar sesión".

## 3. Acceder a la Gestión de Plugins

1. En la barra lateral izquierda, haz clic en **"Administrar Jenkins"**.
2. Luego, selecciona **"Gestionar Plugins"**.

## 4. Buscar el Plugin "Pipeline Stage View"

1. En la pestaña **"Disponible"**, utiliza la caja de búsqueda en la parte superior derecha para buscar el plugin.
2. Escribe **"Pipeline Stage View"** en el campo de búsqueda.

## 5. Instalar el Plugin

1. Marca la casilla junto al plugin **"Pipeline Stage View"**.
2. Haz clic en **"Instalar sin reiniciar"**.

   ![Instalar Plugin](https://www.jenkins.io/images/screenshots/manage_plugins/available_plugins.png)

3. Espera a que la instalación se complete. Esto puede tardar unos minutos.

## 6. Verificar la Instalación

1. Después de la instalación, regresa a la pantalla principal de Jenkins.
2. En la barra lateral izquierda, selecciona **"Administrar Jenkins"** nuevamente.
3. Elige **"Administrar Plugins"** y ve a la pestaña **"Instalado"**.
4. Asegúrate de que **"Pipeline Stage View"** aparezca en la lista de plugins instalados.

   ![Verificar Plugin](https://www.jenkins.io/images/screenshots/manage_plugins/installed_plugins.png)

