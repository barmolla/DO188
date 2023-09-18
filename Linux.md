# Comandos útiles de Linux

Obtener id del usuario como así también los grupos a los que pertenece.

```
id
```

Output:

```
uid=501(barmolla) gid=20(staff) groups=20(staff),12(everyone),61(localaccounts),79(_appserverusr),80(admin),81(_appserveradm),98(_lpadmin),33(_appstore),100(_lpoperator),204(_developer),250(_analyticsusers),395(com.apple.access_ftp),398(com.apple.access_screensharing),399(com.apple.access_ssh),400(com.apple.access_remote_ae),701(com.apple.sharepoint.group.1)
```

## Subordinary IDs

```
cat /etc/subuid
```

## Subordinary Groups

```
cat /etc/subgid
```

##  Obtener cuentas de usuarios del sistema operativo

```
getent passwd
```

Si queremos obtener info de un usuario particular, brindar el ID de usuario

```
getent passwd 1001
```

##  Obtener grupos del sistema operativo

```
getent group
```

## Repetir el último comando como sudo

```
sudo !!
```

## Listar archivos visualizando permisos

```
ls -l <path>
```

1er bit para distinguir tipo de archivo (carpeta o archivo)
3 siguientes bits para visualizar permisos de usuario sobre ese archivo
3 siguientes bits para visualizar permisos de grupo propietario sobre ese archivo
3 siguientes bits para visualizar permisos de otros sobre ese archivo

## Reemplazar y ejecutar desde el último comando ejecutado

1- Ejecutar un comando: 

```
podman stop <container-name>
```

2- Ejecutar el siguiente comando para tomar el último comando ejecutado y reemplazar:

```
^stop^rm
```