# Migración de DB de PostgreSQL 12 a 13

Los contenedores usan una fina capa en tiempo de ejecución la cual es efímera por defecto. Esto quiere decir que si el contenedor se elimina, la información generada en el tiempo de vida del contenedor se perderá.
Los contenedores usan COW copy-on-write file system.
Se pueden montar volumenes y vincular para persistir información.

## Container PostgreSQL + volumen montado

```
podman run -it --rm --name persisting-pg12 \
   -e POSTGRESQL_USER=backend \
   -e POSTGRESQL_PASSWORD=secret_pass \
   -e POSTGRESQL_DATABASE=rpi-store \
   -p 5432:5432 \
   -v <host-file-system-path>:<container-file-system-path>:Z
   registry.ocp4.example.com:8443/rhel8/postgresql-12:1-113
```

> Default path en el que escribe PostreSQL -> /var/lib/pgsql/data
> Z se ocupa de las consideraciones de SELinux

## PGAdmin para BDs PostgreSQL

```
podman run -d --name persisting-pgadmin \
   -e PGADMIN_SETUP_EMAIL=brian@gmail.com \
   -e PGADMIN_SETUP_PASSWORD=pga_secret_pass \
   -p 5050:5050 --network persisting-network \
   registry.ocp4.example.com:8443/crunchydata/crunchy-pgadmin4:ubi8-4.30-1
```

## PostgreSQL dump de la DB hacia file system host

```
podman exec persisting-pg12 pg_dump -Fc rpi-store -f /tmp/db_dump
```

## Copia de dump en host a container

```
podman cp persisting-pg12:/tmp/db_dump /tmp/db_dump
```

## Importar data a volumen

```
podman volume import <file>
```

## Crear volumen nuevo

```
podman volume create rpi-store-data-pg13
```

## Container PostgreSQL + volumen montado

```
podman run -it --rm --name persisting-pg13 \
   -e POSTGRESQL_USER=backend \
   -e POSTGRESQL_PASSWORD=secret_pass \
   -e POSTGRESQL_DATABASE=rpi-store \
   -p 5432:5432 \
   -v rpi-store-data-pg13:/var/lib/pgsql/data \
   registry.ocp4.example.com:8443/rhel9/postgresql-13:1
```

## Restore

```
podman exec persisting-pg13 pg_restore -d rpi-store /tmp/db_dump
```

## Verificar que los datos existen en nuestra nueva BD

```
podman exec -it persisting-pg13 psql -d rpi-store -c "select * from model"
```
