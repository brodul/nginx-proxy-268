#!/bin/bash
docker run --name nginx-proxy-brodul-debug -d -p 80:80 -p 443:443 \
 -v $PWD/_certs:/etc/nginx/certs \
 -v /var/run/docker.sock:/tmp/docker.sock:ro \
 jwilder/nginx-proxy

docker run -d --name app1.example.com \
-e VIRTUAL_PORT=8001 \
-e VIRTUAL_HOST=app1.example.com \
app1.example.com

docker run -d --name app2.example.com \
-e VIRTUAL_PORT=8001 \
-e VIRTUAL_HOST=app2.example.com \
app2.example.com
