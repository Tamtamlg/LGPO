@echo off
echo Reset policy...
RD /S /Q "%WinDir%\System32\GroupPolicy"
RD /S /Q "%WinDir%\System32\GroupPolicyUsers"
gpupdate /force
echo Please reboot your PC.
pause
