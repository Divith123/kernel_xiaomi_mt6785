FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential clang lld gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu \
    bc curl wget git flex bison libncurses-dev libssl-dev device-tree-compiler \
    python3 python3-pip ccache rsync unzip zstd file libelf-dev pkg-config \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# non-root builder user (recommended when running with -u)
RUN useradd -ms /bin/bash builder

WORKDIR /workdir
USER builder

ENV PATH="/usr/bin:${PATH}"
ENV ARCH=arm64
ENV DEFCONFIG=begonia_user_defconfig
ENV KBUILD_BUILD_USER="Divith"
ENV KBUILD_BUILD_HOST="local-docker"

ENTRYPOINT ["/bin/bash","-lc"]
