#!/usr/bin/env bash
set -euo pipefail

docker volume create datos
docker run -d --name webv -v datos:/app/data nginx:alpine
docker exec webv sh -c "echo 'Pentatech Rocks!' > /app/data/test.txt"
docker rm -f webv
docker run -d --name webv2 -v datos:/app/data nginx:alpine

echo "Contenido persistente:"
docker exec webv2 cat /app/data/test.txt