Powershell.exe -executionpolicy remotesigned -File C:\LGPO\win10_as3\services_as3.ps1
@timeout 5 > nul

C:\LGPO\LGPO.exe /g C:\LGPO\win10_as3

@echo off
pause