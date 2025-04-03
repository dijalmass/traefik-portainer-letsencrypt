#!/bin/bash

docker stack rm traefik-swarm &&\
docker stack deploy -c docker-compose.yml traefik-swarm