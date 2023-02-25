::Enable MS Store
Get-AppXPackage *WindowsStore* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
::This Demo is ForWindows App Direcotry
takeown /f "C:\Program Files\WindowsApps" /r
