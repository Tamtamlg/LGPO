Powershell.exe -executionpolicy remotesigned -File C:\LGPO\win10_as1\services_as1.ps1
@timeout 5 > nul

C:\LGPO\LGPO.exe /g C:\LGPO\win10_as1

@echo off
pause
