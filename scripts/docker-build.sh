#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="nova-kernel-build:latest"
DOCKERFILE_PATH="docker/Dockerfile"

echo "Building Docker image: ${IMAGE_NAME}"
docker build -t "${IMAGE_NAME}" -f "${DOCKERFILE_PATH}" .

echo "Running build inside container..."
# Use current user's UID/GID when available (Linux/WSL)
UID_ARG=""
if command -v id >/dev/null 2>&1; then
  UID_ARG="-u $(id -u):$(id -g)"
fi

docker run --rm ${UID_ARG} -v "$(pwd)":/workdir -w /workdir -e "HOME=/workdir" "${IMAGE_NAME}" bash -lc "./nova-build.sh -b"
