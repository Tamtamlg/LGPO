cd /d %~dp0
Powershell.exe -executionpolicy remotesigned -File .\config\common\settings.ps1
@timeout 5 > nul

Powershell.exe -executionpolicy remotesigned -File .\config\win10_as1\services_as1.ps1
@timeout 5 > nul

.\config\common\LGPO.exe /g .\config\win10_as1

@echo off
pause
