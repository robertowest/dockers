#!/bin/bash
# docker images --format '{{.Repository}}:{{.Tag}}\t{{.ID}}\t{{.Size}}' | sort -h 
docker images --format '{{.ID}}\t{{.Size}}\t{{.Repository}}:{{.Tag}}'
