#!/bin/bash

exec docker inspect --format '{{ .State.Pid }}' "$@"
