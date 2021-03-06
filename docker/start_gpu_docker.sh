#!/bin/bash

get_abs_filename() {
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

DOCKER_DIR=`dirname $0`
PROJECT_ROOT=$(get_abs_filename "$( dirname $DOCKER_DIR )")
echo "Forwaring host folder $PROJECT_ROOT to container folder /Finetune"
docker run --runtime=nvidia -it -d -v $PROJECT_ROOT:/Finetune $@ --name finetune -p 0.0.0.0:6006:6006 finetune
