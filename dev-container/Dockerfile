FROM mcr.microsoft.com/powershell:preview-debian-11

LABEL org.label-schema.maintainer="Jakub 'Ash258' Čábera <cabera.jakub@gmail.com>" \
    org.label-schema.description="Shovel docker image" \
    org.label-schema.url="https://github.com/Ash258/Scoop-Core"

# [Option] Install zsh
ARG INSTALL_ZSH="true"
# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="false"

# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
COPY dev-container/library-scripts/*.sh /tmp/library-scripts/
RUN apt-get update \
    && /bin/bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" "true" "true" \
    && chsh "${USERNAME}" -s "$(which pwsh)" \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# Install shovel
ARG SCOOP_BRANCH='main'

ENV SHELL=/bin/bash
ENV SCOOP=/home/vscode/shovel
ENV SCOOP_GLOBAL=/opt/shovel
ENV SCOOP_HOME="$SCOOP/apps/scoop/current"
ENV PATH="$SCOOP/shims:$SCOOP_GLOBAL/shims:$PATH"
ENV USERPROFILE=/home/vscode

# FS setup
RUN mkdir -p $SCOOP $SCOOP_GLOBAL $SCOOP/apps/scoop && \
    mkdir -p $SCOOP/shims $SCOOP_GLOBAL/shims ~/.config/scoop

COPY 'support/shovel*' $SCOOP/shims/
COPY 'support/config.json' ~/.config/scoop/

RUN chmod +x $SCOOP/shims/shovel $SCOOP/shims/shovel.ps1

# Install basic dependencies
# RUN apk update && apk add git p7zip --virtual shovelDeps

# Install Shovel
RUN wget -q 'https://github.com/Ash258/Scoop-Core/archive/main.zip' && \
    unzip -q main.zip && \
    mv Scoop-Core-main $SCOOP_HOME/ && \
    rm -rf main.zip && \
    wget -q 'https://github.com/ScoopInstaller/Main/archive/master.zip' && \
    unzip -q master.zip && \
    mkdir -p $SCOOP/buckets/ && \
    mv Main-master $SCOOP/buckets/main && \
    rm -rf master.zip

# Checkup and other tweaks
RUN shovel config SCOOP_BRANCH $SCOOP_BRANCH && \
    shovel update && \
    shovel status && \
    shovel -v
