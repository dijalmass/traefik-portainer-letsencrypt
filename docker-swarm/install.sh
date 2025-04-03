#!/bin/bash

touch /letsencrypt/acme.json &&\
chmod 600 /letsencrypt/acme.json &&\
docker swarm init &&\
docker stack rm traefik-swarm &&\
docker network rm traefik &&\
docker network create --driver=overlay traefik &&\
docker stack deploy -c docker-compose.yml traefik-swarm