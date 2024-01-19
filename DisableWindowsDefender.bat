REM Disable all Windows Defender components
REM AV Software is bloat
REM Use router firewall instead
REM Run in SAFE MODE

rem Disable Microsoft SAM (Security Accounts Manager)
reg add "HKLM\System\CurrentControlSet\Services\SamSs" /v "Start" /t REG_DWORD /d "4" /f

rem Disable Windows Defender Security Center
reg add "HKLM\System\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f

rem Disable services (it will stop WdFilter.sys as well, better not to disable the driver by itself)
reg add "HKLM\System\CurrentControlSet\Services\WdBoot" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WdFilter" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WdNisDrv" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\MDCoreSvc" /v "Start" /t REG_DWORD /d "4" /f

REM Disable Windows Firewall (use router firewall instead)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mpssvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wtd" /v "Start" /t REG_DWORD /d "4" /f

REM Disable Anti-malware and Network Realtime Inspection Services
takeown /s %computername% /u %username% /f "C:\ProgramData\Microsoft\Windows Defender\Platform"
icacls "C:\ProgramData\Microsoft\Windows Defender\Platform" /grant:r %username%:F
taskkill /im MsMpEng.exe /f
taskkill /im NisSrv.exe
REM del "C:\ProgramData\Microsoft\Windows Defender\Platform" /s /f /q
ren "C:\ProgramData\Microsoft\Windows Defender\Platform" "Platform.bak"

rem Disable Anti-malware Service Executable (to restore run "sfc /scannow")
rem takeown /s %computername% /u %username% /f "C:\ProgramData\Microsoft\Windows Defender\Platform\*\MsMpEng.exe"
rem icacls "C:\ProgramData\Microsoft\Windows Defender\Platform\*\MsMpEng.exe" /grant:r %username%:F
rem taskkill /im MsMpEng.exe /f
rem del "C:\ProgramData\Microsoft\Windows Defender\Platform\*\MsMpEng.exe" /s /f /q
rem ren "C:\ProgramData\Microsoft\Windows Defender\Platform\*\MsMpEng.exe" "MsMpEng.exe.bak"

rem Disable Microsoft Network Realtime Inspection Service (to restore run "sfc /scannow")
rem takeown /s %computername% /u %username% /f "C:\ProgramData\Microsoft\Windows Defender\Platform\*\NisSrv.exe"
rem icacls "C:\ProgramData\Microsoft\Windows Defender\Platform\*\NisSrv.exe" /grant:r %username%:F
rem taskkill /im NisSrv.exe /f
rem del "C:\ProgramData\Microsoft\Windows Defender\Platform\*\NisSrv.exe" /s /f /q
rem ren "C:\ProgramData\Microsoft\Windows Defender\Platform\*\NisSrv.exe" "NisSrv.exe.bak"

PAUSE
