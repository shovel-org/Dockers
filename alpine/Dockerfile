FROM mcr.microsoft.com/powershell:preview-alpine-3.12

LABEL org.label-schema.maintainer="Jakub 'Ash258' Čábera <cabera.jakub@gmail.com>" \
    org.label-schema.description='Shovel docker image' \
    org.label-schema.url='https://github.com/Ash258/Scoop-Core'

ARG SCOOP_BRANCH='main'

ENV SHELL='/bin/sh'
ENV USERPROFILE='/root'
ENV SCOOP="$USERPROFILE/shovel"
ENV SCOOP_GLOBAL='/opt/shovel'
ENV SCOOP_HOME="$SCOOP/apps/scoop/current"
ENV PATH="$SCOOP/shims:$SCOOP_GLOBAL/shims:$PATH"

# FS setup
RUN mkdir -p $SCOOP $SCOOP_GLOBAL "$SCOOP/apps/scoop" "$SCOOP/shims" "$SCOOP/buckets/" "$SCOOP_GLOBAL/shims" '~/.config/scoop'

COPY 'support/shovel*' "$SCOOP/shims/"
COPY 'support/config.json' '~/.config/scoop/'

# Install basic dependencies
RUN apk update && apk add git p7zip --virtual shovelDeps

# Install Shovel
RUN chmod +x "$SCOOP/shims/shovel" "$SCOOP/shims/shovel.ps1" && \
    wget -q 'https://github.com/Ash258/Scoop-Core/archive/main.zip' && \
    unzip -q main.zip && \
    mv Scoop-Core-main "$SCOOP_HOME/" && \
    rm -rf main.zip && \
    wget -q 'https://github.com/ScoopInstaller/Main/archive/master.zip' && \
    unzip -q master.zip && \
    mv Main-master "$SCOOP/buckets/main" && \
    rm -rf master.zip

# Checkup and other tweaks
RUN shovel config SCOOP_BRANCH $SCOOP_BRANCH && \
    shovel update && \
    shovel status && \
    shovel -v

CMD [ "pwsh", "-NoLogo" ]
