::1. Get Local Image Version Index
Get-WindowsImage -ImagePath D:\Sources\Install.wim

::2. install GUI From Local Image & Restart Server.
Install-WindowsFeature Server-Gui-Mgnt-Infra.Server-Gui-Shell -Restart -Source wip:D: 1so esLinstall.wiu:2
