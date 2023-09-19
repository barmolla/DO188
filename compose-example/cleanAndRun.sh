podman stop $(podman ps -q)
podman rm $(podman ps -aq)
podman-compose up -d