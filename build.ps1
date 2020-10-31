#region Windows
## windows
# latest, windows-latest, 2009, windows-2009
docker build --tag 'shovelinstaller/shovel:latest' --tag 'shovelinstaller/shovel:windows-latest' --tag 'shovelinstaller/shovel:2009' --tag 'shovelinstaller/shovel:windows-2009' --no-cache -f .\windows\Dockerfile .
# 2004, windows-2004
docker build --build-arg VERSION=2004 --tag 'shovelinstaller/shovel:2004' --tag 'shovelinstaller/shovel:windows-2004' --no-cache -f .\windows\Dockerfile .

##servercore
docker build --build-arg POWERSHELL='pwsh.exe' --build-arg VERSION='windowsservercore-2004' --build-arg IMAGE='powershell' --tag 'shovelinstaller/shovel:windowsservercore' --tag 'shovelinstaller/shovel:windowsservercore-2004' --no-cache -f .\windows\Dockerfile .

docker push shovelinstaller/shovel
#endregion Windows

#region Linux
#endregion Linux
