#!/bin/bash

docker build . -t image_nginx:v4
docker run -d --rm -p 80:81 -v $(pwd)/nginx/:/etc/nginx/ --name nginx_container image_nginx:v4
sleep 5
curl localhost:80
printf "\n"
curl localhost:80/status
docker stop nginx_container
docker rmi image_nginx:v4
