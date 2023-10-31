rem Disable all Windows Defender components
rem Make sure program versions are the same for the directory path

rem Disable Windows Defender Security Center
reg add "HKLM\System\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f

rem Disable services (it will stop WdFilter.sys as well, better not to disable the driver by itself)
reg add "HKLM\System\CurrentControlSet\Services\WdBoot" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WdFilter" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WdNisDrv" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f

rem Disable Anti-malware Service Executable (to restore run "sfc /scannow")
takeown /s %computername% /u %username% /f "C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.23090.2008-0\MsMpEng.exe"
icacls "C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.23090.2008-0\MsMpEng.exe" /grant:r %username%:F
taskkill /im MsMpEng.exe /f
rem del "C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.23090.2008-0\MsMpEng.exe" /s /f /q
ren "C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.23090.2008-0\MsMpEng.exe" "MsMpEng.exe.bak"

rem Disable Microsoft Network Realtime Inspection Service (to restore run "sfc /scannow")
takeown /s %computername% /u %username% /f "C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.23090.2008-0\NisSrv.exe"
icacls "C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.23090.2008-0\NisSrv.exe" /grant:r %username%:F
taskkill /im NisSrv.exe /f
rem del "C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.23090.2008-0\NisSrv.exe" /s /f /q
ren "C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.23090.2008-0\NisSrv.exe" "NisSrv.exe.bak"
