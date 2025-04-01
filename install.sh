#!/bin/sh
source ./db.env;
docker compose up -d --remove-orphans;
docker compose exec php bash -c "composer install && composer upgrade"
docker compose exec amap.db bash -c "psql -U user amap < /var/sql/amap.sql"
docker compose exec amap.db bash -c "psql -U user amap < /var/sql/amap.data.sql"
