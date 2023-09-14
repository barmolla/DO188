FROM registry.access.redhat.com/ubi9/ubi:latest

ENV APP_PORT=8080 \
    APP_ROOT=/var/www/html \
    APP_USER=1001

RUN dnf install -y httpd && \
    dnf clean all && \
    sed -i -e 's/^Listen 80/Listen ${APP_PORT}/g' /etc/httpd/conf/httpd.conf && \
    chgrp -R 0 /var/log/httpd /var/run/httpd && \
    chmod -R g=u /var/log/httpd /var/run/httpd

COPY index.html ${APP_ROOT}

LABEL io.openshift.expose-services="8080:http" \
      io.k8s.description="My httpd container application" \
      io.openshift.tags="httpd, web server, apache, apache2"

VOLUME ${APP_ROOT}

EXPOSE ${APP_PORT}

USER ${APP_USER}

ENTRYPOINT ["/usr/sbin/httpd"]

CMD ["-D", "FOREGROUND"]