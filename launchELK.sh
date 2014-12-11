#!/bin/bash

docker rm -f elasticsearch
docker rm -f kibana4

docker pull dockerfile/elasticsearch:latest
docker rmi kibana4beta2
docker build -t kibana4beta2 .


docker run -d \
    -p 9200:9200 \
    -p 9300:9300 \
    --name elasticsearch \
    dockerfile/elasticsearch

docker run -ti \
    -p 82:80 \
    -e KIBANA_SECURE=false \
    --link elasticsearch:es \
    --name kibana4 \
    kibana4beta2 \
    /bin/bash
