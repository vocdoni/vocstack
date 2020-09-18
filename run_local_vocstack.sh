#!/bin/bash
set -e

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

export DOCKER_CLI_EXPERIMENTAL=enabled
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

if ! ping -c 1 vocstack.local >/dev/null; then
    echo -e "${RED}vocstack.local does not exist. Add \"127.0.0.1 vocstack.local\" to your /etc/hosts${NOCOLOR}"
    exit 1
fi

echo -e "${GREEN}Updating submodules...${NOCOLOR}"
git submodule update --recursive --remote --init

pushd docker/vocstack_local
echo -e "${GREEN}Building components...${NOCOLOR}"
docker-compose build

echo -e "${GREEN}Building components...${NOCOLOR}"
docker-compose up -d

echo -e "${GREEN}Ready! \nFrontend running at http://vocstack.local:8081\nVocexplorer running at http://vocstack.local:8082${NOCOLOR}"
