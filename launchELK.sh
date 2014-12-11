#!/bin/bash

docker pull dockerfile/elasticsearch:latest
docker build -t kibana4beta2

docker rm -f elasticsearch
docker rm -f kibana4

docker run -d \
    -p 9200:9200 \
    -p 9300:9300 \
    --name elasticsearch \
    dockerfile/elasticsearch

docker run -d \
    -p 80:80 \
    -e KIBANA_SECURE=false \
    --link elasticsearch:es \
    --name kibana4 \
    kibana4beta2
