FROM postgres:9.6-alpine

# Allow connections, only linked containers can connect
RUN echo "host all  all    0.0.0.0/0  md5" >> /var/lib/postgresql/data/pg_hba.conf

# Environment variables
ENV POSTGRES_USER     ckan
ENV POSTGRES_PASSWORD ckan

# Add database creation script
COPY ./create-databases.sh /docker-entrypoint-initdb.d/
