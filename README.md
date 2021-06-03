# [Shovel Docker images](https://hub.docker.com/u/shovelinstaller)

## Production images

Images intended as a base image for the production setups.

<!-- https://hub.docker.com/_/microsoft-windows -->
<!-- https://hub.docker.com/_/microsoft-powershell -->
<!-- ./ https://github.com/Ash258/Scoop-Dockers/blob/ -->

| Tag                      |             Dockerfile             | OsVersion                                  |
| :----------------------- | :--------------------------------: | :----------------------------------------- |
| latest                   | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.985)              |
| windows                  | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.985)              |
| windows-latest           | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.985)              |
| 20H2                     | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.985)              |
| windows-20H2             | [Dockerfile](./windows/Dockerfile) | Windows 20H2 (10.0.19042.985)              |
| 2009                     | [Dockerfile](./windows/Dockerfile) | Windows 2009 (10.0.19042.985)              |
| windows-2009             | [Dockerfile](./windows/Dockerfile) | Windows 2009 (10.0.19042.985)              |
| 2004                     | [Dockerfile](./windows/Dockerfile) | Windows 2004 (10.0.19041.985)              |
| windows-2004             | [Dockerfile](./windows/Dockerfile) | Windows 2004 (10.0.19041.985)              |
| ------------------------ | ---------------------------------- | -----------------------------------------  |
| windowsservercore        | [Dockerfile](./windows/Dockerfile) | Windows Server Core 2004 (10.0.19041.928)  |
| windowsservercore-latest | [Dockerfile](./windows/Dockerfile) | Windows Server Core 2004 (10.0.19041.928)  |
| windowsservercore-2004   | [Dockerfile](./windows/Dockerfile) | Windows Server Core 2004 (10.0.19041.928)  |
| windowsservercore-1909   | [Dockerfile](./windows/Dockerfile) | Windows Server Core 1909 (10.0.18363.1500) |

## Development images

Images for local development and testing behaviour on multiple OS versions or Excavator execution

| Tag            |            Dockerfile             | OsVersion                                |
| :------------- | :-------------------------------: | :--------------------------------------- |
| latest         | [Dockerfile](./alpine/Dockerfile) | Alpine 3.12 (PowerShell 7.2.0-preview.6) |
| alpine         | [Dockerfile](./alpine/Dockerfile) | Alpine 3.12 (PowerShell 7.2.0-preview.6) |
| preview        | [Dockerfile](./alpine/Dockerfile) | Alpine 3.12 (PowerShell 7.2.0-preview.6) |
| preview-alpine | [Dockerfile](./alpine/Dockerfile) | Alpine 3.12 (PowerShell 7.2.0-preview.6) |
