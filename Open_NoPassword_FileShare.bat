::Turn off File Share No Password Authority.
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LanmanWorkstation /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f
::After CMD Run,Please Reboot Your PC.
