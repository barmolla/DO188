## Imagenes publicadas en quay.io

- https://quay.io/user/barmolla/

# Comandos podman

## Login a registry

```
podman login -u <username> -p <password> quay.io
```

## Obtener ayuda del comando

```
podman <command> --help
```

## Listar imagenes

```
podman image ls
```

## Listar ID de todos los contenedores 

```
podman ps -aq
```

## Remover todos los contenedores resultantes de la ejecución del comando dentro de $()

```
podman rm $(podman ps -aq)
```

## Reiniciar contenedor

```
podman restart <container-name>
```

## Detener contenedor

```
podman stop <container-name>
```

## Eliminar contenedor

```
podman kill <container-name>
```

## Crear red

```
podman network create <name>
```

## Listar redes

```
podman network ls
```

## Construir imagen a partir de Containerfile

```
podman build -t <host_registry>/<username>/<image_name>:<tag_name> .
```

## Inspeccionar metadatos de un container en ejecución

Visualizar comando de creación del contenedor

```
podman inspect <container-name> --format '{{.Config.CreateCommand}}'
```

Visualizar configuraciones de red

```
podman inspect <container-name> --format '{{.NetworkSettings.Networks}}'
```

Volcar en un archivo el output del inspect

```
podman inspect <container-name> > inspect.out
```

## Visualizar configuraciones de volumenes montados

```
podman inspect <container-name> --format '{{.Config.Mounts}}'
```

## Copiar archivos entre containers y file system host

Desde container a file system host

```
podman cp <container-name>:<path-to-file> <file-system-host-path-to-file> 
```

Desde file system host a container

```
podman cp <file-system-host-path-to-file> <container-name>:<path-to-file>
```

## Inspeccionar metadatos de la imagen

En este caso, formateando la salida buscando los valores contenidos en Config->Env

```
podman image inspect <host_registry>/<username>/<image_name>:<tag_name> -f "{{.Config.Env}}"
```

En este caso, formateando la salida buscando los valores contenidos en Config->Volumes

```
podman image inspect <host_registry>/<username>/<image_name>:<tag_name> -f "{{.Config.Volumes}}"
```

En este caso, formateando la salida buscando los valores contenidos en Config->ExposedPorts

```
podman image inspect <host_registry>/<username>/<image_name>:<tag_name> -f "{{.Config.ExposedPorts}}"
```

En este caso, formateando la salida buscando los valores contenidos en Config->User

```
podman image inspect <host_registry>/<username>/<image_name>:<tag_name> -f "{{.Config.User}}"
```

En este caso, formateando la salida buscando los valores contenidos en Mounts

```
podman image inspect <host_registry>/<username>/<image_name>:<tag_name> -f "{{.Mounts}}"
```

## Listar volumenes

```
podman volume ls
```

## Inspeccionar un volumen en particular

```
podman volume inspect <volume-id>
```

La salida del comando anterior debiera ser similar a lo siguiente:

```
[
    {
        "CreatedAt": "2023-07-05T15:16:45Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/fdf6f6198b1cea0cce15b36e09c0c12fb6de756b23ed4b0ed1573459780117d7/_data",
        "Name": "fdf6f6198b1cea0cce15b36e09c0c12fb6de756b23ed4b0ed1573459780117d7",
        "Options": null,
        "Scope": "local"
    }
]
```

Donde Mountpoint es la ruta absoluta en el file system host donde la información del 
container en ejecución irá escribiendo.

## Vincular un volumen a un contenedor al momento de crearlo

```
podman run -d \
           --name <container-name> \
           --rm \
           -p <host-port>:<container-port> \
           -v <name-volume-host>:<container-path>:<SELinux->
```

También puede especificarse una ruta absoluta del file system host al momento de crear el contenedor (no tienen que ser un volumen creado necesariamente con docker/podman).

## Exportar información de un volumen a un archivo tar

```
podman volume export <name-volume-host> --output <name.tar.gz>
```

Extraer para verificar su contenido

```
tar tf <name.tar.gz>
```

Crear otro volumen importando la información exportada previamente

```
podman volume create <name-volume-host-2>
```

E importar

```
podman volume import <name-volume-host-2> <name.tar.gz>
```

## Mostrar procesos dentro de un contenedor

```
podman top <container-name>
```

## Mostrar columnas huser y user de los procesos dentro de un contenedor

```
podman top <container-name> huser user
```

## Ejecutar un comando dentro de un nuevo namespace (como si fuera dentro de un contenedor)

Este comando es útil para diagnosticar problemas de privilegios

```
podman unshare ls -l --directory ~/<folder>
```

## Una forma diferente de montar un volumen en la creación de un contenedor

```
podman run --rm --name <container-name> -p <host-port>:<container-port> --mount \
'type=volume,source=html-vol,destination=/server,ro'
```

## Genera manifiesto declarativo de K8S a partir de contenedor (Pod) o volumen (PVC)

podman generate kube <container-name|volume-name> > <name>.yaml

## Genera recurso a partir de un manifiesto

podman play kube <container-name|volume-name>.yaml