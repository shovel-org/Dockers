$PSNativeCommandArgumentPassing = 'Legacy'
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

Write-Host 'Starting installation' -ForegroundColor 'Green'

Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

# Shovel installation
$cc = "${env:SCOOP}\cache"
if (Test-Path -LiteralPath "${cc}\install.ps1" -PathType 'Leaf') {
    Write-Host 'Using cached installer' -ForegroundColor 'Green'
    Copy-Item "${cc}\install.ps1" "${env:TMP}\install.ps1"
} else {
    Write-Host 'Downloading installer' -ForegroundColor 'Green'
    Invoke-WebRequest 'https://raw.githubusercontent.com/shovel-org/Install/NEW/install.ps1' -OutFile "${env:TMP}\install.ps1" -UseBasicParsing
}

$installParams = @{
    'ScoopDir'          = $env:SCOOP
    'ScoopGlobalDir'    = $env:SCOOP_GLOBAL
    'ScoopBranch'       = 'robocopyConfig'
    'SkipRobocopy'      = ($env:SKIP_ROBOCOPY -ne 'false')
    'InstallerCacheDir' = $cc
    'RunAsAdmin'        = $true
}
& "$env:TMP\install.ps1" @installParams

# Install dependencies and new powershell
Write-Host 'Installing crucial applications' -ForegroundColor 'Green'
$pkgs = @('7zip', 'mingit', 'gsudo', 'innounp', 'dark', 'pwsh', 'zstd')
if ($env:POWERSHELL_DISTRIBUTION_CHANNEL -notlike '*nanoserver*') {
    shovel install --global 'lessmsi'
} else {
    $pkgs[0] = 'https://raw.githubusercontent.com/shovel-org/Base/7zip/bucket/7zip.json'
    $pkgs = $pkgs -notlike 'pwsh'

    # Nanoserver hacks
    Write-Host 'Downloading alternative shim'
    $shim = "${env:SCOOP}\apps\scoop\current\supporting\shimexe\bin\shim.exe"
    Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ScoopInstaller/Scoop/5ad8c76dd7fd534ff7ed6e8e67d66e793293eab0/supporting/shims/rshim/shim.exe' -OutFile $shim -UseBasicParsing
    New-Item "${env:SCOOP_GLOBAL}\shims" -ItemType 'Directory' -Force
    Copy-Item $shim "${env:SCOOP_GLOBAL}\shims\powershell.exe"
    Set-Content "${env:SCOOP_GLOBAL}\shims\powershell.shim" @'
path = pwsh.exe
'@
}
shovel install --global @pkgs

# Updates/migrations
shovel update
shovel status

# Cleanup
Write-Host 'Performing cleanup' -ForegroundColor 'Green'
shovel cache rm '*'
Remove-Item "${env:SCOOP}\cache\*", "${env:TMP}\*", "${env:TEMP}\*" -ErrorAction 'SilentlyContinue' -Force -Recurse

exit 0
