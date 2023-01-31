::/wait :禁止任何阻斷動作
::/passive :指出安裝正在進行中，但不會向使用者顯示提示或錯誤訊息。 使用者無法取消安裝。
::/norestart :永不重新開機選項。 安裝程式永遠不會在安裝之後重新開機電腦。
::/forcerestart :一律重新開機選項。 安裝程式一律會在每次安裝之後重新開機電腦。
start/wait .\Driver\LibreOffice_6.1.3_Win_x64.msi /passive /norestart
