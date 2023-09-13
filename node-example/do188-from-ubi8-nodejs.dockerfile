FROM registry.ocp4.example.com:8443/ubi8/nodejs-16

LABEL org.opencontainers.image.authors="Brian Armolla"
LABEL com.example.environment="production"
LABEL com.example.version="0.0.1"

ENV SERVER_PORT=3000
ENV NODE_ENV="production"

EXPOSE $SERVER_PORT

WORKDIR /opt/app-root/src

COPY . .

RUN npm install

CMD npm start
