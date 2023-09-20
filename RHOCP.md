# Red Hat OpenShift Container Platform

Comandos útiles


Crear aplicaciones desde:
- imagen existente
- source code (s2i: source to image)
- containerfile
- openshift templates
- helm
- kustomize
- pipelines
- jkube

## Login API

```
oc login -u <user> -p <password> <cluster-host-api>
```

## Obtener token de autenticación

```
oc whoami --show-token
```

## Mostrar URL de consola web

```
oc whoami --show-console
```

## Contexto actual

```
oc whoami --show-context
```

## Mostrar estado de un proyecto

```
oc status
```

## Listar recursos de OpenShift

```
oc api-resources
```

## Obtener descripción sobre un recurso en particular

```
oc explain pvc
```

## Uso avanzado para obtener detalle de una entrada en particular

```
oc explain deployment.spec.template.spec.containers.env 
```

## Listar proyectos

```
oc get projects
```

```
oc new-project <project-name>
```

## Generar recursos de OpenShift partir de una imagen (IS, SVC, Deploy, ReplicaSets, Pods)

```
oc new-app --name <app-name> <image>
```

```
oc get all
```

## Listar entradas en manifiesto 

```
oc describe <resource>
```

```
oc get pods
```

```
oc scale deploy/<deploy-name> --replicas=<n>
```

```
oc get -o yaml deploy/<deploy-name>
```

```
oc rsh
```

## Crear servicio

```
oc expose pod <pod-name> \
   --port=<port-n> \
   --targetPort=<port-n> \
   --name=<svc-name>
```

## Crear ruta

```
oc expose svc/<svc-name>
```

## Crear deployment

```
oc create deployment <deploy-name> \
   --port=<port-n> \
   --image=registry.ocp4.example.com:8443/redhattraining/podman-gitea:latest
```