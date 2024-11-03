rem # Disable Power Management option on all devices

rem # NIC
for /f %%n in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (

rem # Keyboard
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e96b-e325-11ce-bfc1-08002be10318}\0000" /v "PnPCapabilities" /t REG_DWORD /d "0x00000118" /f

rem # Mouse
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e96f-e325-11ce-bfc1-08002be10318}\0000" /v "PnPCapabilities" /t REG_DWORD /d "0x00000118" /f

PAUSE