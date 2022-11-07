###install Office Manual###
#1.download tools 
#https://www.microsoft.com/en-us/download/details.aspx?id=49117

#2.output&rename "config"
#https://config.office.com/deploymentsettings

#3.import config.xml & CMD input
cd C:\Program Files\Microsoft Office\Office16
setup /download config.xml
setup /configure config.xml

#4.CMD open with admin input(AutoKMS)
slmgr /skms kms.03k.org
slmgr /ato

#5.start KMS server
net start sppsvc
