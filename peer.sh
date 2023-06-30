#!/bin/bash

set -e

source utils.sh

function peerUp() {
    "${C_BLUE}Bringing up peer...${C_RESET}"
    docker-compose -f ~/fabric/compose-peer.yaml up -d
    "${C_GREEN}Peer container is up${C_RESET}"
}

function peerDown() {
    "${C_BLUE}Bringing down peer...${C_RESET}"
    docker-compose -f ~/fabric/compose-peer.yaml down --volumes --remove-orphans
    "${C_GREEN}Peer container is removed${C_RESET}"
}


if [ "$1" == "up" ]; then
    peerUp
elif [ "$1" == "down" ]; then
    peerDown
fi