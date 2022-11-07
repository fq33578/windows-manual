:://以系統管理員執行////
@echo off
:: BatchGotAdmin (Run as Admin code starts)
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
:: BatchGotAdmin (Run as Admin code ends)
:: Your codes should start from the following line

::///services.msc開啟/關閉/自動/// 
::sc config wuauserv start= auto 
::///開啟遠端桌面/// 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f 
::///將遠端桌面新增到防火牆規則/// 
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes 

::///關閉windows update/// 
sc stop WaasMedicSvc 
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\WaasMedicSvc /v Start /f /t REG_DWORD /d 4 
echo.  
sc stop wuauserv 
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\wuauserv /v Start /f /t REG_DWORD /d 4 
echo. 
sc stop UsoSvc 
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc /v Start /f /t REG_DWORD /d 4 
echo. 

::///關閉任何休眠/// 
powercfg /change disk-timeout-dc 0
echo.
powercfg /change monitor-timeout-dc 0
echo.
powercfg /change standby-timeout-dc 0
echo.
powercfg /change hibernate-timeout-dc 0
echo.
powercfg /change disk-timeout-ac 0
echo.
powercfg /change monitor-timeout-ac 0
echo.
powercfg /change standby-timeout-ac 0
echo.
powercfg /change hibernate-timeout-ac 0
echo.
powercfg -h off
echo.

::///開啟網路探索,印表機共用//////
netsh advfirewall firewall set rule group="網路探索" new enable=Yes
netsh advfirewall firewall set rule group="檔案及印表機共用" new enable=Yes
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
netsh advfirewall firewall set rule group="File and printer sharing" new enable=Yes

::///關閉所有防火牆///
netsh advfirewall set currentprofile state off
echo.
netsh advfirewall set Domainprofile state off
echo.
netsh advfirewall set Privateprofile state off
echo.
netsh advfirewall set Publicprofile state off
echo.
::///帳戶設定空白密碼///
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /f /v LimitBlankPasswordUse /t "REG_DWORD" /d 0 

::///IIS設定///
::///生成開啟或關閉程式功能列表///
::dism /online  /Get-Features >C:\Feauture_ON_OFF_List.txt
::///線上啟用IIS///
::DISM.EXE /enable-feature /online /featureName:IIS-ManagementConsole /All /featureName:NetFx3 /All /featureName:IIS-NetFxExtensibility /All /featureName:IIS-NetFxExtensibility45 /All /featureName:IIS-ASP /All /featureName:IIS-ASPNET45 /All /featureName:IIS-ASPNET /All
::///離線啟用IIS///
:://基礎IIS安裝///
::start /w pkgmgr /iu:IIS-WebServerRole;WAS-WindowsActivationService;WAS-ProcessModel;WAS-NetFxEnvironment;WAS-ConfigurationAPI&echo %errorlevel%
::start /w pkgmgr /iu:IIS-ASPNET;IIS-NetFxExtensibility;NetFx4Extended-ASPNET45;IIS-ASPNET45;IIS-NetFxExtensibility45;NetFx4Extended-ASPNET45;NetFx3&echo %errorlevel%
IIS-ManagementConsole NetFx3 IIS-NetFxExtensibility IIS-NetFxExtensibility45 IIS-ASP IIS-ASPNET45 IIS-ASPNET 
:://驗證遠端桌面已開啟///
start SystemPropertiesRemote
:://驗證防火牆已關閉///
start firewall.cpl
:://檢查網卡順序///
start control Ncpa.cpl
:://驗證電源選項///
start control powercfg.cpl,,3
:://驗證網路共用選項///
control.exe /name Microsoft.NetworkAndSharingCenter /page Advanced
:://驗證IIS開啟///
start optionalfeatures
///驗證空白密碼///
start secpol.msc
pasuse
 
