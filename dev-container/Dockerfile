FROM mcr.microsoft.com/powershell:preview-debian-11

LABEL org.label-schema.maintainer="Jakub 'Ash258' Čábera <cabera.jakub@gmail.com>" \
    org.label-schema.description='Shovel docker image' \
    org.label-schema.url='https://github.com/Ash258/Scoop-Core'

# [Option] Install zsh
ARG INSTALL_ZSH='true'
# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES='true'

# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
ARG USERNAME='root'
ARG USER_UID='0'
ARG USER_GID="$USER_UID"

COPY 'dev-container/library-scripts/*.sh' '/tmp/library-scripts/'
RUN apt-get update \
    && /bin/bash '/tmp/library-scripts/common-debian.sh' "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" "true" "true" \
    && chsh "${USERNAME}" -s "$(which pwsh)" \
    && apt-get autoremove -y && apt-get clean -y && rm -rf '/var/lib/apt/lists/*' '/tmp/library-scripts'

ARG SCOOP_BRANCH='main'

ENV SHELL='/bin/bash'
ENV USERPROFILE='/root'
ENV SCOOP="$USERPROFILE/Shovel"
ENV SCOOP_GLOBAL='/opt/Shovel'
ENV SCOOP_HOME="$SCOOP/apps/scoop/current"
ENV PATH="$SCOOP/shims:$SCOOP_GLOBAL/shims:$PATH"

# FS setup
RUN mkdir -p $SCOOP $SCOOP_GLOBAL "$SCOOP/apps/scoop" "$SCOOP/shims" "$SCOOP_GLOBAL/shims" ~/.config/scoop

COPY 'support/shovel*' "$SCOOP/shims/"
COPY 'support/config.json' '~/.config/scoop/'

# Install Shovel
RUN chmod +x "$SCOOP/shims/shovel" "$SCOOP/shims/shovel.ps1" && \
    wget -q "https://github.com/Ash258/Scoop-Core/archive/$SCOOP_BRANCH.zip" && \
    unzip -q "$SCOOP_BRANCH.zip" && \
    mv "Scoop-Core-$SCOOP_BRANCH" "$SCOOP_HOME/" && \
    rm -rf "$SCOOP_BRANCH.zip" && \
    wget -q 'https://github.com/ScoopInstaller/Main/archive/master.zip' && \
    unzip -q 'master.zip' && \
    mkdir -p "$SCOOP/buckets/" && \
    mv 'Main-master' "$SCOOP/buckets/main" && \
    rm -rf 'master.zip'

# Checkup and other tweaks
RUN shovel config SCOOP_BRANCH "$SCOOP_BRANCH" && \
    shovel bucket add 'Base' 'https://github.com/shovel-org/Base.git' && \
    shovel update && \
    shovel status && \
    shovel -v

RUN config="$USERPROFILE/.config/powershell/Microsoft.PowerShell_profile.ps1" && \
    mkdir -p "${config%/*}" && \
    pwsh -Command 'Set-PSRepository -Name ''PSGallery'' -InstallationPolicy Trusted && Install-Module posh-git' && \
    touch $config && \
    echo 'try {' >> $config && \
    echo '    Set-PSReadLineOption -HistoryNoDuplicates:$true' >> $config && \
    echo '    Set-PSReadLineOption -PredictionSource History' >> $config && \
    echo '    Import-Module ''posh-git'', "${env:SCOOP_HOME}/supporting/completion/Scoop-Completion.psd1" -Force' >> $config && \
    echo '} catch {' >> $config && \
    echo '    Write-Host $_.Exception.Message -f red' >> $config && \
    echo '}' >> $config
