podman network create beeper-backend

podman network create beeper-frontend

podman volume create beeper-data

podman run \
   --name beeper-db \
   --network beeper-backend \
   --volume beeper-data:/var/lib/pgsql:Z \
   -e POSTGRESQL_USER=beeper \
   -e POSTGRESQL_PASSWORD=beeper123 \
   -e POSTGRESQL_DATABASE=beeper \
   registry.ocp4.example.com:8443/rhel9/postgresql-13:1

---
FROM registry.ocp4.example.com:8443/ubi8/openjdk-17:1.12 AS builder
 
COPY . . 
 
RUN mvn package
 
FROM registry.ocp4.example.com:8443/ubi8/openjdk-17-runtime:1.12
 
COPY --from=builder /home/jboss/target/beeper-1.0.0.jar .

ENTRYPOINT ["java", "-jar", "beeper-1.0.0.jar"]
---

podman build -t beeper-api:v1 .

podman run --name beeper-api -e DB_HOST=beeper-db --network beeper-backend,beeper-frontend beeper-api:v1

cd ~/DO188/labs/comprehensive-review/beeper-ui

---
FROM registry.ocp4.example.com:8443/ubi8/nodejs-16:1 AS builder
USER root
COPY . .
RUN npm ci && \
    npm run build

FROM registry.ocp4.example.com:8443/ubi8/nginx-118:1
COPY nginx.conf /etc/nginx/
COPY --from=builder /opt/app-root/src/build /usr/share/nginx/html
CMD nginx -g "daemon off;"
---


podman run --name beeper-ui -p 8080:8080 --network beeper-frontend beeper-ui:v1

curl http://localhost:8080
