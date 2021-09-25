# [Shovel Docker images](https://hub.docker.com/u/shovelinstaller)

## Production images

Images intended as a base image for the production setups.

<!-- https://hub.docker.com/_/microsoft-windows -->
<!-- https://hub.docker.com/_/microsoft-powershell -->
<!-- ./ https://github.com/Ash258/Scoop-Dockers/blob/ -->

| Tag                      |             Dockerfile             | OsVersion                                  |
| :----------------------- | :--------------------------------: | :----------------------------------------- |
| latest                   | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.1237)             |
| windows                  | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.1237)             |
| windows-latest           | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.1237)             |
| 20H2                     | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.1237)             |
| windows-20H2             | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.1237)             |
| 2009                     | [Dockerfile](./windows/Dockerfile) | Windows 2009 (10.0.19042.1237)             |
| windows-2009             | [Dockerfile](./windows/Dockerfile) | Windows 2009 (10.0.19042.1237)             |
| 2004                     | [Dockerfile](./windows/Dockerfile) | Windows 2004 (10.0.19041.1237)             |
| windows-2004             | [Dockerfile](./windows/Dockerfile) | Windows 2004 (10.0.19041.1237)             |
| ------------------------ | ---------------------------------- | -----------------------------------------  |
| windowsservercore        | [Dockerfile](./windows/Dockerfile) | Windows Server Core 2004 (10.0.19041.1165) |
| windowsservercore-latest | [Dockerfile](./windows/Dockerfile) | Windows Server Core 2004 (10.0.19041.1165) |
| windowsservercore-2004   | [Dockerfile](./windows/Dockerfile) | Windows Server Core 2004 (10.0.19041.1165) |
| windowsservercore-1909   | [Dockerfile](./windows/Dockerfile) | Windows Server Core 1909 (10.0.18363.1556) |

## Development images

Images for local development and testing behaviour on multiple OS versions or Excavator execution

| Tag            |            Dockerfile             | OsVersion                                |
| :------------- | :-------------------------------: | :--------------------------------------- |
| latest         | [Dockerfile](./alpine/Dockerfile) | Alpine 3.12 (PowerShell 7.2.0-preview.9) |
| alpine         | [Dockerfile](./alpine/Dockerfile) | Alpine 3.12 (PowerShell 7.2.0-preview.9) |
| preview        | [Dockerfile](./alpine/Dockerfile) | Alpine 3.12 (PowerShell 7.2.0-preview.9) |
| preview-alpine | [Dockerfile](./alpine/Dockerfile) | Alpine 3.12 (PowerShell 7.2.0-preview.9) |
