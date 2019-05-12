#!/bin/bash

echo "Derrubando serviço Top Five Backend..."
docker-compose down

echo "Levantando serviço Top Five Backend..."
docker-compose up -d --build

echo "Gerando documentacao..."
docker run --rm -v $PWD:/application ceumanti/docker-aglio:latest aglio -i ./application/app/docs/top-five-backend.apib --theme-full-width --no-theme-condense -o ./application/app/templates/apidocs/index.html
