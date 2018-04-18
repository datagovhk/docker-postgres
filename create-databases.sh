#!/bin/bash

set -e
set -u

function create_user_and_database() {
	local database=$1
	echo "Creating user and database '$database'..."
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	    CREATE USER $database;
	    CREATE DATABASE $database;
      ALTER USER $database WITH PASSWORD '$database';
	    GRANT ALL PRIVILEGES ON DATABASE $database TO $database;
EOSQL
}

create_user_and_database ckan_en
create_user_and_database ckan_tc
create_user_and_database ckan_sc

echo "Users and databases created"
