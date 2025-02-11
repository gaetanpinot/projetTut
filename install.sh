source ./db.env;
docker compose up -d --remove-orphans;
docker exec amap_php bash -c "composer install ; composer upgrade"
docker exec amap_pgsql bash -c "psql -U user amap < /var/sql/amap.sql"
docker exec amap_pgsql bash -c "psql -U user amap < /var/sql/amap.data.sql"
