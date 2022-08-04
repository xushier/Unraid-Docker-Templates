#!/bin/bash

cd templates_compose
while :
do
    read -p "输入容器名：" container_name

    mkdir -p $container_name && cd $container_name

    echo "true" > autostart
    echo "$container_name" > name
    echo "" > description
    echo "" > docker-compose.yml
    echo "" > docker-compose.override.yml
    echo "" > .env
    cd ..
done