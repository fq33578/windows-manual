:://install Office Manual//
::1.download tools 
::https://www.microsoft.com/en-us/download/details.aspx?id=49117

::2.setting&output&rename "config"
::https://config.office.com/deploymentsettings

::3.create folder & CMD cd to floder
cd C:\Program Files\Microsoft Office\Office16

::4.Move config.xml to floder

::5.Download Office
setup /download config.xml

---------------------------------------

::6.Install Office
setup /configure config.xml

::7.Lisence Enabled
::If Can't Enable Please Change Other KMS Server Link
::KMS Server List :https://www.coolhub.top/tech-articles/kms_list.html
cd C:\Program Files\Microsoft Office\Office16
cscript ospp.vbs /sethst:kms.loli.beer
cscript ospp.vbs /act

----------------------------------------
::If Can't Enable Please Try These
::CMD open with admin input(AutoKMS)
slmgr /skms kms.loli.beer
slmgr /ato

::restart KMS server
net start sppsvc
net stop sppsvc&net start sppsvc


