#region Windows
# $env:SCOOP_CACHE="$PWD/.cache"; shovel update; shovel download 7zip zstd dark lessmsi gsudo innounp innoextract oh-my-posh3 posh-git cwRsync EXEExplorer fiddler RDPWrapper pwsh pwsh-preview vim win32-openssh winget zstd git mingit dotnet-sdk --skip
$env:DOCKER_SCAN_SUGGEST = 'false'

Push-Location $PWD

$org = 'shovelinstaller'
$image = "$org/shovel"
$scoopImage = "$org/scoop"

## windows
### latest, windows, windows-latest, 20H2, windows-20H2
docker build `
    --tag "${image}:latest" `
    --tag "${image}:windows" `
    --tag "${image}:windows-latest" `
    --tag "${image}:20H2" `
    --tag "${image}:windows-20H2" `
    --no-cache `
    --file .\windows\Dockerfile `
    .

### 2009, windows-2009
docker build `
    --tag "${image}:2009" `
    --tag "${image}:windows-2009" `
    --build-arg 'VERSION=2009' `
    --no-cache `
    --file .\windows\Dockerfile `
    .

### 2004, windows-2004
docker build `
    --tag "${image}:2004" `
    --tag "${image}:windows-2004" `
    --build-arg 'VERSION=2004' `
    --no-cache `
    --file .\windows\Dockerfile `
    .

##servercore
docker build `
    --tag "${image}:windowsservercore" `
    --tag "${image}:windowsservercore-latest" `
    --tag "${image}:windowsservercore-2004" `
    --build-arg 'IMAGE=powershell' `
    --build-arg 'VERSION=windowsservercore-2004' `
    --build-arg 'POWERSHELL=pwsh.exe' `
    --no-cache `
    --file .\windows\Dockerfile `
    .

docker build `
    --tag "${image}:windowsservercore-1909" `
    --build-arg 'IMAGE=powershell' `
    --build-arg 'VERSION=windowsservercore-1909' `
    --build-arg 'POWERSHELL=pwsh.exe' `
    --no-cache `
    --file .\windows\Dockerfile `
    .

## just scoop windows latest for some verification runs
docker build `
    --tag "${scoopImage}:latest" `
    --tag "${scoopImage}:windows" `
    --tag "${scoopImage}:windows-latest" `
    --tag "${scoopImage}:20H2" `
    --tag "${scoopImage}:windows-20H2" `
    --build-arg 'SCOOP_REPO=https://github.com/lukesampson/scoop' `
    --build-arg 'SCOOP_BRANCH=master' `
    --no-cache `
    --file .\windows\Dockerfile `
    .

# docker push 'shovelinstaller/shovel' --all-tags
# docker push 'shovelinstaller/scoop' --all-tags
# (docker inspect mcr.microsoft.com/windows:2004 | ConvertFrom-Json).OsVersion | clip
# (docker inspect mcr.microsoft.com/powershell:windowsservercore-2004 | ConvertFrom-Json).OsVersion | clip
#endregion Windows

#region Linux
#endregion Linux

Pop-Location
