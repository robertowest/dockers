#!/bin/bash
# docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter "since=$1" --quiet)

docker_image_desc() {
  for image in $(docker images --quiet --filter "since=${1}"); do
    if [ $(docker history --quiet ${image} | grep ${1}) ]; then
      docker_image_desc "${image}"
    fi
  done
  echo "${1}"
}

docker_image_desc $1 | awk '!x[$0]++'

