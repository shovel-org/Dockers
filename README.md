# [Shovel Docker images](https://hub.docker.com/u/shovelinstaller)

## Production images

Images intended as a base image for the production setups.

<!-- https://hub.docker.com/_/microsoft-windows -->
<!-- https://hub.docker.com/_/microsoft-powershell -->
<!-- ./ https://github.com/shovel-org/Dockers/blob/ -->

<!-- (docker inspect mcr.microsoft.com/windows:2004 | ConvertFrom-Json).OsVersion | clip -->
<!-- (docker inspect mcr.microsoft.com/powershell:windowsservercore-1909 | ConvertFrom-Json).OsVersion | clip -->

| Tag                      |             Dockerfile             | OsVersion                                  |
| :----------------------- | :--------------------------------: | :----------------------------------------- |
| latest                   | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.1415)             |
| windows                  | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.1415)             |
| windows-latest           | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.1415)             |
| 20H2                     | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.1415)             |
| windows-20H2             | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.1415)             |
| 2009                     | [Dockerfile](./windows/Dockerfile) | Windows 2009 (10.0.19042.1415)             |
| windows-2009             | [Dockerfile](./windows/Dockerfile) | Windows 2009 (10.0.19042.1415)             |
| 2004                     | [Dockerfile](./windows/Dockerfile) | Windows 2004 (10.0.19041.1415)             |
| windows-2004             | [Dockerfile](./windows/Dockerfile) | Windows 2004 (10.0.19041.1415)             |
| ------------------------ | ---------------------------------- | -----------------------------------------  |
| windowsservercore        | [Dockerfile](./windows/Dockerfile) | Windows Server Core 2004 (10.0.19041.1415) |
| windowsservercore-latest | [Dockerfile](./windows/Dockerfile) | Windows Server Core 2004 (10.0.19041.1415) |
| windowsservercore-2004   | [Dockerfile](./windows/Dockerfile) | Windows Server Core 2004 (10.0.19041.1415) |
| windowsservercore-1909   | [Dockerfile](./windows/Dockerfile) | Windows Server Core 1909 (10.0.18363.1556) |

## Development images

Images for local development and testing behaviour on multiple OS versions or Excavator execution

| Tag                                   |                Dockerfile                | OsVersion                                 |
| :------------------------------------ | :--------------------------------------: | :---------------------------------------- |
| [shovel-dev] latest                   |    [Dockerfile](./alpine/Dockerfile)     | Alpine 3.14 (PowerShell 7.3.0-preview.1)  |
| [shovel-dev] alpine                   |    [Dockerfile](./alpine/Dockerfile)     | Alpine 3.14 (PowerShell 7.3.0-preview.1)  |
| [shovel-dev] preview                  |    [Dockerfile](./alpine/Dockerfile)     | Alpine 3.14 (PowerShell 7.3.0-preview.1)  |
| [shovel-dev] preview-alpine           |    [Dockerfile](./alpine/Dockerfile)     | Alpine 3.14 (PowerShell 7.3.0-preview.1)  |
| ------------------------------------- | ---------------------------------------- | ----------------------------------------- |
| [shovel-dev] ubuntu                   |    [Dockerfile](./debian/Dockerfile)     | Ubuntu 20.04 (PowerShell 7.3.0-preview.1) |
| [shovel-dev] preview-ubuntu           |    [Dockerfile](./debian/Dockerfile)     | Ubuntu 20.04 (PowerShell 7.3.0-preview.1) |
| [shovel-dev] debian                   |    [Dockerfile](./debian/Dockerfile)     | Debian 11 (PowerShell 7.3.0-preview.1)    |
| [shovel-dev] preview-debian           |    [Dockerfile](./debian/Dockerfile)     | Debian 11 (PowerShell 7.3.0-preview.1)    |
| ------------------------------------- | ---------------------------------------- | ----------------------------------------- |
| [shovel-dev] container                | [Dockerfile](./dev-container/Dockerfile) | Debian 11 (PowerShell 7.3.0-preview.1)    |
| [shovel-dev] container-latest         | [Dockerfile](./dev-container/Dockerfile) | Debian 11 (PowerShell 7.3.0-preview.1)    |
| [shovel-dev] container-preview        | [Dockerfile](./dev-container/Dockerfile) | Debian 11 (PowerShell 7.3.0-preview.1)    |
| [shovel-dev] container-debian         | [Dockerfile](./dev-container/Dockerfile) | Debian 11 (PowerShell 7.3.0-preview.1)    |
| [shovel-dev] container-debian-preview | [Dockerfile](./dev-container/Dockerfile) | Debian 11 (PowerShell 7.3.0-preview.1)    |
