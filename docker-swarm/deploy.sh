#!/bin/bash

set -a
source .env
set +a

echo $DOMAIN_NAME $EMAIL_ADDRESS &&\
docker stack rm traefik-swarm &&\
docker stack deploy -c docker-compose.yml traefik-swarm --detach=false