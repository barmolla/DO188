# Repositorio con recursos relacionados a la certificación Red Hat DO188

Ver README de cada directorio.

# Comandos podman

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

