#!/bin/bash

touch ./letsencrypt/acme.json &&\
chmod 600 ./letsencrypt/acme.json &&\
docker network rm traefik &&\
docker network create traefik &&\
docker compose up -d