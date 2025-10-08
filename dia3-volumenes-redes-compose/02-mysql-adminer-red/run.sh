#!/usr/bin/env bash
set -euo pipefail

NET=pentanet
docker network inspect "$NET" >/dev/null 2>&1 || docker network create "$NET"

docker rm -f db adminer >/dev/null 2>&1 || true

docker run -d --name db --network "$NET" \
  -e MYSQL_ROOT_PASSWORD=pass mysql:5.7

echo "Esperando MySQL..."
timeout 60 sh -c 'until docker exec db mysqladmin ping -ppass --silent 2>/dev/null; do sleep 2; done'
echo "MySQL listo."

docker run -d --name adminer --network "$NET" -p 8083:8080 adminer

echo "Abra http://localhost:8083 y conecte a host: db, user: root, pass: pass"
