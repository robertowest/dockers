#!/bin/bash
docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}"
