$PSNativeCommandArgumentPassing = 'Legacy'
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

Write-Host 'Starting installation' -ForegroundColor 'Green'

Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

# Shovel installation
Write-Host 'Downloading installer' -ForegroundColor 'Green'

Invoke-WebRequest 'https://raw.githubusercontent.com/ScoopInstaller/Install/master/install.ps1' -OutFile "$env:TMP\install.ps1" -UseBasicParsing
& "$env:TMP\install.ps1" -RunAsAdmin
Get-ChildItem "${env:SCOOP}\shims" -Filter 'scoop.*' | Copy-Item -Destination { Join-Path $_.Directory.FullName (($_.BaseName -replace 'scoop', 'shovel') + $_.Extension) }

# Remove trash config options
shovel config rm 'rootPath'

# Install dependencies and new powershell
Write-Host 'Installing crucial applications' -ForegroundColor 'Green'
shovel install --global 'lessmsi'
shovel config 'MSIEXTRACT_USE_LESSMSI' $true
shovel install --global '7zip' 'mingit' 'gsudo' 'innounp' 'dark' 'pwsh' 'zstd'
shovel config 'SCOOP_REPO' ${env:SCOOP_REPO}
shovel update
shovel config 'SCOOP_BRANCH' ${env:SCOOP_BRANCH}

shovel bucket add Base 'https://github.com/shovel-org/Base.git'

# Updates/migrations
shovel update
shovel status

# Cleanup
Write-Host 'Performing cleanup' -ForegroundColor 'Green'
shovel cache rm '*'
Remove-Item "$env:SCOOP\cache\*", "$env:TMP\*", "$env:TEMP\*" -ErrorAction 'SilentlyContinue' -Force -Recurse

exit 0
