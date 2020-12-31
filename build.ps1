#region Windows
# shovel cache rm *; shovel download 7zip cwRsync dark EXEExplorer fiddler mingit git gsudo innounp lessmsi pwsh pwsh-preview RDPWrapper vim win32-openssh winget zstd; Copy-Item "$env:SCOOP\cache\*" '.\.cache' -Force
Push-Location $PWD

$image = 'shovelinstaller/shovel'

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

## just scoop windows latest for some verification runs
docker build `
    --tag 'shovelinstaller/scoop:latest' `
    --tag 'shovelinstaller/scoop:windows' `
    --tag 'shovelinstaller/scoop:windows-latest' `
    --tag 'shovelinstaller/scoop:20H2' `
    --tag 'shovelinstaller/scoop:windows-20H2' `
    --build-arg 'SCOOP_REPO=https://github.com/lukesampson/scoop' `
    --build-arg 'SCOOP_BRANCH=master' `
    --no-cache `
    --file .\windows\Dockerfile `
    .

# docker push 'shovelinstaller/shovel' --all-tags
# docker push 'shovelinstaller/scoop' --all-tags
#endregion Windows

#region Linux
#endregion Linux
Pop-Location
