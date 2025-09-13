rem # Disable Event Trace Sessions
rem # NEVER disable UBPM, required by Windows

rem # Disables logs

rem # Requires SAFE MODE

rem # Requires SetACL.bat script to be run first

PAUSE

rem # Launch SetACL.bat to take ownership of reg keys
cd "%~dp0"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main\windows11-scripts-main"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts\windows11-scripts"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\Circular Kernel Context Logger"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Circular Kernel Context Logger"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\FilterMgr-Logger"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\FilterMgr-Logger"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\LwtNetLog"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\LwtNetLog"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\Microsoft-Windows-ProjFS-Filter-Log"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-ProjFS-Filter-Log"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\Microsoft-Windows-Rdp-Graphics-RdpIdd-Trace"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-Rdp-Graphics-RdpIdd-Trace"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\NtfsLog"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NtfsLog"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\ReFSLog"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\ReFSLog"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\UnionFS-Filter"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\UnionFS-Filter"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\WdiContextLog"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WdiContextLog"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\WiFiDriverIHVSession"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSession"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\WdiContextLog"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WdiContextLog"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\Tpm"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Tpm"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\DefenderApiLogger"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\DefenderAuditLogger"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\EventLog-Application"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\EventLog-Application"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\EventLog-System"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\EventLog-System"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\EventLog-Security"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\EventLog-Security"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\Cellcore"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Cellcore"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\NetCore"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NetCore"
ECHO Yes | reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\RadioMgr"
ECHO Yes | reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RadioMgr"

rem https://docs.microsoft.com/en-us/windows/win32/etw/configuring-and-starting-an-autologger-session
rem DiagLog is required by Diagnostic Policy Service (Troubleshooting)
rem EventLog-System/EventLog-Application are required by Windows Events Log Service
rem perfmon
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f

rem # Disable WMI logs
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Reliability Analysis\WMI" /v "WMIEnable" /t REG_DWORD /d "0" /f


PAUSE
