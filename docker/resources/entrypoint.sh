#!/usr/bin/env bash
set -euo pipefail

trap nginx_stop EXIT
trap nginx_stop SIGINT

function nginx_start {
    echo "Starting nginx ..."
    nginx
}

# Function to stop the localhost proxy to the Redis queue
function nginx_stop {
    echo "Stopping nginx ..."
    for nginxPID in $(pidof nginx) ; do
        echo "Killing nginx (${nginxPID}) ..."
        kill "${nginxPID}"
    done
}

function main {
    nginx_start
}

main
exec "${@}"
