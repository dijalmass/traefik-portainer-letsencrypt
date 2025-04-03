#!/bin/bash

touch acme.json &&\
chmod 600 acme.json &&\
docker network create traefik &&\
docker-compose up -d