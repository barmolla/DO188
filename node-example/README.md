# Construir imagen a partir de Containerfile

podman build -t hello-server:best .

# Crear un contenedor a partir de la imagen creada

podman run -d --rm --name hello-best -p 3000:3000 hello-server:best

- -d: Dettached mode
- --rm: Elimina el contenedor una vez que se detenga (podman stop hello-best). Se puede verificar con podman ps -a
- --name: Asigna nombre al contenedor
- -p: Port-forwarding desde dentro del contenedor hacia afuera

# Visualizar capaz de la imagen

podman image tree hello-server:best

# Instrucciones Containerfile

- FROM
- LABEL
- ENV
- USER
- EXPOSE
- ARG
- WORKDIR
- COPY
- RUN
- CMD

# Cuestiones de seguridad

Si no se especifica usuario (USER) dentro del Containerfile por defecto se utiliza el usuario root.
