#!/bin/bash

# 配置参数
OLD_CONTAINER_NAME=kwdb-env             # 你当前运行和配置过的容器名
NEW_IMAGE_NAME=kwdb-image:v1            # 想要保存的镜像名
NEW_CONTAINER_NAME=kwdb-dev             # 新容器名
HOST_SRC_DIR=$HOME/kwdb/src/go          # 主机上挂载的目录
CONTAINER_SRC_DIR=/home/go              # 容器中的目录

# 创建宿主机挂载目录（如果不存在）
mkdir -p "$HOST_SRC_DIR"

# Step 2: 创建新容器（挂载卷）
echo "[1/2] 创建新容器：$NEW_CONTAINER_NAME，挂载 $HOST_SRC_DIR --> $CONTAINER_SRC_DIR"
docker run -it \
  --name "$NEW_CONTAINER_NAME" \
  -v "$HOST_SRC_DIR":"$CONTAINER_SRC_DIR" \
  "$NEW_IMAGE_NAME" \
  /bin/bash

# Step 3: 提示
echo "[2/2] 新容器已启动并挂载，使用以下命令再次启动："
echo "docker start -ai $NEW_CONTAINER_NAME"

