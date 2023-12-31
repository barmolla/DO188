FROM registry.ocp4.example.com:8443/redhattraining/podman-random-numbers as generator

RUN python3 random_generator.py                                                                             

FROM registry.ocp4.example.com:8443/ubi8/python-38:1-96

USER default

WORKDIR /redhat

COPY --from=generator --chown=default /app/numbers.txt materials/numbers.txt

COPY main.py .

ENV FILE="/redhat/materials/numbers.txt"

VOLUME /redhat/materials

CMD python3 main.py
