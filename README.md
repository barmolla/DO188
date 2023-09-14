# Repositorio con recursos relacionados a la certificación Red Hat DO188

Ver README de cada directorio.

--

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