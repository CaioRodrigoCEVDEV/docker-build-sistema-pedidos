FROM postgres:17

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

COPY init/*.sql /docker-entrypoint-initdb.d/
