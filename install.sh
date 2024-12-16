#!/bin/bash
source ./db.env;
docker compose up -d;
docker exec amap_pgsql bash -c "psql -U user amap < /var/sql/amap.sql"
