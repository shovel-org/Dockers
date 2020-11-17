$ErrorActionPreference = 'Stop'

# Shovel installation
Invoke-WebRequest 'https://raw.githubusercontent.com/ScoopInstaller/Install/master/install.ps1' -OutFile "$env:TMP\install.ps1" -UseBasicParsing
& "$env:TMP\install.ps1" -RunAsAdmin
Get-ChildItem "${env:SCOOP}\shims" -Filter 'scoop.*' | Copy-Item -Destination { Join-Path $_.Directory.FullName (($_.BaseName -replace 'scoop', 'shovel') + $_.Extension) }

# Remove trash config options
shovel config rm 'rootPath'
# Install dependencies and new powershell
shovel install 'lessmsi' --global
shovel config 'MSIEXTRACT_USE_LESSMSI' $true
shovel install '7zip' 'mingit' 'gsudo' 'innounp' 'dark' 'pwsh' --global
shovel config 'SCOOP_REPO' ${env:SCOOP_REPO}
shovel update
shovel config 'SCOOP_BRANCH' ${env:SCOOP_BRANCH}

# Updates/migrations
shovel update
shovel status

# Cleanup
shovel cache rm '*'
Remove-Item "$env:SCOOP\cache\*", "$env:TMP\*", "$env:TEMP\*" -ErrorAction 'SilentlyContinue' -Force -Recurse

exit 0
