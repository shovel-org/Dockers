ARG IMAGE='windows'
ARG VERSION='2009'

FROM mcr.microsoft.com/${IMAGE}:${VERSION} as windows

LABEL org.label-schema.maintainer="Jakub 'Ash258' Čábera <cabera.jakub@gmail.com>" \
    org.label-schema.description="Shovel docker image" \
    org.label-schema.url="https://github.com/Ash258/Scoop-Core"

ARG SCOOP_REPO='https://github.com/Ash258/Scoop-Core.git'
ARG SCOOP_BRANCH='main'
ARG POWERSHELL='powershell.exe'

ENV SCOOP="C:\SCOOP"

COPY '.cache/*' "C:/SCOOP/cache/"

RUN %POWERSHELL% -NoLogo -NonInteractive -NoExit -Command " \
    Set-ExecutionPolicy Bypass; \
    Invoke-WebRequest 'https://raw.githubusercontent.com/ScoopInstaller/Install/master/install.ps1' -OutFile 'install.ps1' -UseBasicParsing; \
    .\install.ps1 -RunAsAdmin; \
    scoop install lessmsi --global;\
    scoop config 'MSIEXTRACT_USE_LESSMSI' $true; \
    scoop install 7zip git gsudo innounp dark pwsh --global; \
    scoop config SCOOP_REPO ${env:SCOOP_REPO}; \
    scoop update; \
    scoop config SCOOP_BRANCH ${env:SCOOP_BRANCH}; \
    scoop update; \
    Get-ChildItem "${env:SCOOP}\shims" 'scoop.*' | Copy-Item -Destination { Join-Path $_.Directory.FullName (($_.BaseName -replace 'scoop', 'shovel') + $_.Extension) }; \
    shovel status; \
    shovel cache rm '*'; \
    exit 0; \
    "

CMD [ "pwsh.exe", "-NoLogo", "-NoExit" ]
