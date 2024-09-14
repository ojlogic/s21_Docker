#!/usr/bin/env bash

docker pull nginx

docker run --rm -d -p 81:81 --name server nginx

docker cp nginx.conf server:/etc/nginx/
docker cp fastcgi_server.c server:/

docker exec server apt-get update
docker exec server apt-get install -y gcc spawn-fcgi libfcgi-dev
docker exec server gcc ./fastcgi_server.c -l fcgi -o fcgi_server
docker exec server spawn-fcgi -p 8080 fcgi_server
docker exec server nginx -s reload

printf "\n"
curl localhost:81
printf "\n\n"

docker stop server


