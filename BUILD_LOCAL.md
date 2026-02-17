# Local Docker build (WSL2 recommended)

This document explains how to build NoVA `begonia` kernel locally using Docker (works on WSL2 or native Linux).

## Prerequisites
- Docker Desktop with WSL2 backend (Windows) or Docker Engine on Linux
- Recommended: 8+ CPU cores, 8+ GB RAM, 20+ GB free disk

## Quick start (WSL - recommended)
1. Clone your fork and switch to the branch:

   git clone https://github.com/Divith123/kernel_xiaomi_mt6785.git
   cd kernel_xiaomi_mt6785
   git checkout work/a15-build

2. Build image and kernel (single command):

   ./scripts/docker-build.sh

3. Artifacts
- Kernel image: `out/arch/arm64/boot/Image.gz-dtb`
- Packaged ZIP (AnyKernel): `*.zip` in repo root

## From PowerShell (Windows)
- Recommended: run via WSL (`wsl ./scripts/docker-build.sh`).
- Alternatively use the bundled PowerShell helper:

  .\scripts\docker-build.ps1

## If the build fails
- Try regenerating/using the antman toolchain inside container:
  docker run --rm -v "$(pwd)":/workdir -w /workdir nova-kernel-build:latest bash -lc "./nova-build.sh -t && ./nova-build.sh -b"
- Increase Docker memory/CPU in Docker Desktop settings

## Notes
- `nova-build.sh -t` will bootstrap an Android toolchain (antman) — use only if necessary.
- The container uses system clang + lld; cross binutils are installed.
