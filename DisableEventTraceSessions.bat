rem # Disable Event Trace Sessions
rem # NEVER disable UBPM, required by Windows

rem # Requires SAFE MODE
rem # Requires SetACL.bat script to be run first

PAUSE

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

PAUSE
