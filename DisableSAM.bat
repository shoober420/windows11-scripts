rem # Disable Microsoft SAM (Security Accounts Manager)
rem # Causes black screen and unresponsive desktop if LanmanServer (Server service) is enabled

rem # Requires SetACL.bat script to be run first

PAUSE

net stop SamSs
reg add "HKLM\System\CurrentControlSet\Services\SamSs" /v "Start" /t REG_DWORD /d "4" /f

PAUSE