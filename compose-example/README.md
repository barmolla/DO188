# Podman Compose:
- Es una herramienta de código abierto para ejecutar archivos Compose.
- Elimina la necesidad de correr el servicio de Podman  que provee la API para ahorrar recursos y proveer una solución más liviana y nativa.
- Traduce archivos Compose en comandos propios de la CLI de Podman.
- La herramienta *podman generate kube* genera manifiestos declarativos en formato YML de Kubernetes desde contenedores, pods y volúmenes Podman.
- La herramienta *podman play kube* lee manifiestos de Kubernetes y luego recrea los recursos definidos en un clúster K8S o RHOCP.
- Se puede usar Podman Compose para construir rápidamente aplicaciones stateful y ambientes multi-contenedores para tus aplicaciones.
- Se puede restringir la comunicación entre contenedores específicos definiendo redes adiciones.
- Se puede usar Podman Compose para acercarse a un entorno productivo en un entorno local proveyendo aplicaciones, base de datos o sistemas de tipo cache en un único archivo.
- Se puede usar Podman Compose para ejecutar contenedores de aplicaciones y bases de datos de manera aislada en tu entorno local.

Usar Podman Compose en un entorno productivo no está recomendado ya que no provee características avanzadas de soporte que pudieras llegar a necesitar, tales como:
> Balanceo de carga;
> Distribución de contenedores en múltiples máquinas host/nodos.
Para ese caso de uso utilizar Kubernetes o Red Hat OpenShift Container Platform para una solución productiva de orquestación de contenedores.