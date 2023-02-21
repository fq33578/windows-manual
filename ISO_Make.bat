::Backupdriver
::1 Backup All Drivers
dism /online /export-driver /destination:D:/MyDrivers
::Make New ISO Base Driver
::http://jasonyychiu.blogspot.com/2019/07/windows-how-to-add-driver-on-windows.html
::2 Get Windows Version
Dism /Get-WimInfo /WimFile:D:\Sources\install.wim 
::3 Mount USB ISO
Dism /Mount-Image /ImageFile:D:\Sources\install.wim /Index:3 /MountDir:C:\Mount 
::4 ADD Drivers TO USB ISO
Dism /Image:C:\Mount /Add-Driver /Driver:C:\Drivers /Recurse /ForceUnsigned
::5 SAVE And Unmount USB ISO
Dism /Unmount-Image /MountDir:C:\Mount /Commit 
::6 Clean Trash Files
Dism /Cleanup-Wim
