#!/bin/bash

export DOCKER_CONTENT_TRUST=1
docker build . -t image_nginx:v5
dockle --ignore CIS-DI-0010 image_nginx:v5
export DOCKER_CONTENT_TRUST=0
docker run -d --rm -p 80:81 -v $(pwd)/nginx/:/etc/nginx/ --name nginx_container image_nginx:v5
sleep 5
curl localhost:80
printf "\n"
curl localhost:80/status
docker stop nginx_container
docker rmi image_nginx:v5
