FROM mcr.microsoft.com/powershell:preview-alpine-3.12

LABEL org.label-schema.maintainer="Jakub 'Ash258' Čábera <cabera.jakub@gmail.com>" \
    org.label-schema.description='Alpine based Shovel docker image for linux compatibility testing' \
    org.label-schema.url='https://github.com/Ash258/Scoop-Core'

ARG SCOOP_BRANCH='main'

ENV SHELL='/bin/sh'
ENV USERPROFILE='/root'
ENV SCOOP="$USERPROFILE/Shovel"
ENV SCOOP_GLOBAL='/opt/Shovel'
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
    wget -q "https://github.com/Ash258/Scoop-Core/archive/$SCOOP_BRANCH.zip" && \
    unzip -q "$SCOOP_BRANCH.zip" && \
    mv "Scoop-Core-$SCOOP_BRANCH" "$SCOOP_HOME/" && \
    rm -rf "$SCOOP_BRANCH.zip" && \
    wget -q 'https://github.com/ScoopInstaller/Main/archive/master.zip' && \
    unzip -q 'master.zip' && \
    mv 'Main-master' "$SCOOP/buckets/main" && \
    rm -rf 'master.zip'

# Checkup and other tweaks
RUN shovel config SCOOP_BRANCH "$SCOOP_BRANCH" && \
    shovel bucket add 'Base' 'https://github.com/shovel-org/Base.git' && \
    shovel update && \
    shovel status && \
    shovel -v

CMD [ "pwsh", "-NoLogo" ]
