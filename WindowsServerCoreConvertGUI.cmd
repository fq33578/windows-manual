::1. Get Local Image Version Index
Get-WindowsImage -ImagePath D:\Sources\Install.wim

::2. install GUI From Local Image & Restart Server.
Install-WindowsFeature Server-Gui-Mgmt-Infra,Server-Gui-Shell -Restart -Source wim:D:\Sources\Install.wim
