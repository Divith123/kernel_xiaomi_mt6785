param([switch]$Rebuild)

$imageName = "nova-kernel-build:latest"
if ($Rebuild -or -not (docker images -q $imageName)) {
    docker build -t $imageName -f docker/Dockerfile .
}

docker run --rm -v ${PWD}:/workdir -w /workdir -e HOME=/workdir $imageName bash -lc "./nova-build.sh -b"
