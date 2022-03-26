ARG IMAGE='windows'
ARG VERSION='20H2'

FROM mcr.microsoft.com/${IMAGE}:${VERSION} as windows

LABEL org.label-schema.maintainer="Jakub 'Ash258' Čábera <cabera.jakub@gmail.com>" \
    org.label-schema.description='Shovel docker image' \
    org.label-schema.url='https://github.com/Ash258/Scoop-Core'

USER ContainerAdministrator

ARG SCOOP_REPO='https://github.com/Ash258/Scoop-Core.git'
ARG SCOOP_BRANCH='main'
ARG POWERSHELL='powershell.exe'
ARG SKIP_ROBOCOPY='false'

ENV SCOOP='C:\Shovel'
ENV SCOOP_GLOBAL='C:\ProgramData\Shovel'

COPY '.cache/*' 'C:/Shovel/cache/'
COPY 'windows/install.ps1' 'C:/'

RUN %POWERSHELL% -NoLogo -NonInteractive -Command "Set-ExecutionPolicy Bypass; & 'C:\install.ps1'; exit $LASTEXITCODE"

CMD [ "pwsh.exe", "-NoLogo", "-NoExit" ]
