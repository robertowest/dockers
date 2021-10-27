#!/bin/bash
docker images --format '{{.Repository}}:{{.Tag}}\t{{.Size}}' | sort -h 
