FROM postgres:9-alpine
MAINTAINER Jon Li <li@acm.org>

ADD ./init /docker-entrypoint-initdb.d/
