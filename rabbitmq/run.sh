#!/bin/bash

docker-compose down
docker-compose build
docker-compose up -d
docker-compose ps

sleep 5;

docker exec rabbitmq_rabbit_1 ./init.sh