#!/usr/bin/env pwsh

# $env:SCOOP_CACHE="$PWD/.cache"; shovel update; shovel download 7zip zstd dark lessmsi gsudo innounp innoextract oh-my-posh3 posh-git cwRsync EXEExplorer fiddler RDPWrapper pwsh pwsh-preview vim win32-openssh winget zstd git mingit dotnet-sdk --skip
$env:DOCKER_SCAN_SUGGEST = 'false'

Push-Location $PWD

$org = 'shovelinstaller'
$image = "$org/shovel-dev"
$scoopImage = "$org/scoop"

#region Linux
# shovel-dev
docker build `
    --tag "${image}:latest" `
    --tag "${image}:alpine" `
    --tag "${image}:preview" `
    --tag "${image}:preview-alpine" `
    --build-arg 'SCOOP_BRANCH=NEW' `
    --platform 'linux/amd64' `
    --file './alpine/Dockerfile' `
    --no-cache `
    .
# shovel-dev - debian
docker build `
    --tag "${image}:debian" `
    --tag "${image}:preview-debian" `
    --build-arg 'SCOOP_BRANCH=NEW' `
    --platform 'linux/amd64' `
    --file './debian/Dockerfile' `
    --no-cache `
    .
# shovel-dev - ubuntu
docker build `
    --tag "${image}:ubuntu" `
    --tag "${image}:preview-ubuntu" `
    --build-arg 'SCOOP_BRANCH=NEW' `
    --build-arg 'IMAGE=preview-ubuntu-focal' `
    --platform 'linux/amd64' `
    --file './debian/Dockerfile' `
    --no-cache `
    .

# shovel-dev - rocky/other UBI

# shovel-dev container
docker build `
    --tag "${image}:container" `
    --tag "${image}:container-latest" `
    --tag "${image}:container-preview" `
    --tag "${image}:container-debian" `
    --tag "${image}:container-debian-preview" `
    --build-arg 'SCOOP_BRANCH=NEW' `
    --platform 'linux/amd64' `
    --file './dev-container/Dockerfile' `
    --no-cache `
    .
#endregion Linux
