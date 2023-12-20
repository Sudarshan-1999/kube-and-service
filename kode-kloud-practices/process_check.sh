#!/bin/bash
#set -ex

process_status() {
    export PATH=$PATH:/usr/sbin
    local port=3000
    #local jar_file="dental-ai-app-0.0.1*.jar"
    local build_folder=build
    local service_pid=$(lsof -ti:${port})

    if [ -n "$service_pid" ]; then
        echo "Service is already running with PID: $service_pid"
        kill -9 "$service_pid"
        echo "Killed the service with PID: $service_pid"
    else
        echo "Service is not running on port $port"
    fi

    npx serve $build_folder --debug  > service.log 2>&1 &
    echo "Started service build"
}

process_status
