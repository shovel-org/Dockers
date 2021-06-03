@echo off
setlocal enabledelayedexpansion
set args=%*
:: replace problem characters in arguments
set args=%args:"='%
set args=%args:(=`(%
set args=%args:)=`)%
set invalid="='
if !args! == !invalid! ( set args= )
pwsh -noprofile -ex unrestricted "& '$SCOOP/apps/scoop/current/bin/scoop.ps1'  %args%;exit $LASTEXITCODE"
