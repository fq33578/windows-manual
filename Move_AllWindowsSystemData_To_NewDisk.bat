::1. Make EASYU WinPE To Boot USB 
::https://www.upe.net/
::2. Boot  WinPE Open Diskgenius To Move System
::https://www.diskgenius.cn/download.php

:::If Black Screen Only Mouse Cursor Please Try Remove Old Disk Mount:::
::3. Press Win+R Input "regedit"
::4. Press "HKEY_LOCAL_MOCHINE" 
::5. Press "File->LOAD LOAD Register Zone"
::6. Load Your Target System Disk "SYSTEM" File ex:"F:\Windows\System32\config\SYSTEM"
::7. Find "MountedDevices"
::8. Remove All Mount Disk

:::If Blue Screen Error Code 0xc00000e Please Try Fix EFI Boot:::
::9. Copy Target Disk GUID From Disk Genius
::10. Open CMD From Admin
::11. If Target Disk is F,Input 
bcdboot F:\windows /l zh-tw
::12. If Target Disk is F, Input 
bcdboot F:\windows /m {TARGET-DISK-ID}
::13. If Target Disk is F, BIOS Select Default Boot F Disk
::14.Reboot PC.
