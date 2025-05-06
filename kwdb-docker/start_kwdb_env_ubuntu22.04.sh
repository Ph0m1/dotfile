#!/bin/bash

CONTAINER_NAME=kwdb-dev

echo "启动容器：$CONTAINER_NAME"
docker start -ai "$CONTAINER_NAME"

