cd /d %~dp0
Powershell.exe -executionpolicy remotesigned -File .\common\settings.ps1
@timeout 5 > nul

Powershell.exe -executionpolicy remotesigned -File .\win10_as1\services_as1.ps1
@timeout 5 > nul

.\LGPO.exe /g .\win10_as1

@echo off
pause
