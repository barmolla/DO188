# 1
oc create deployment gitea \
   --port 3030 \
   --image=registry.ocp4.example.com:8443/redhattraining/podman-gitea:latest
# 2
oc create deployment gitea-postgres \
   --port 5432 \
   -o yaml \
   --image=registry.ocp4.example.com:8443/rhel9/postgresql-13:1 \
   --dry-run=client > postgres.yaml
# 3
oc create -f postgres.yaml
# 4
oc expose deployment gitea-postgres
# 5
oc expose deployment gitea
# 6
oc expose service gitea

#######################################
#######################################
# In a web browser, open the gitea-ocp-multipod.apps.ocp4.example.com URL and use the following configuration:
# Database type: PostgreSQL
# Host: gitea-postgres:5432
# Username: gitea
# Password: gitea
# Database name: gitea
# Server Domain: gitea-ocp-multipod.apps.ocp4.example.com
# Gitea Base URL: http://gitea-ocp-multipod.apps.ocp4.example.com
# Then, click Install Gitea.
# This step is successful if you see the login page.
#######################################
#######################################