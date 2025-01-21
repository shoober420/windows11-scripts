rem # Enable Delete page file on shutdown

rem # !!! WARNING !!!
rem # Causes very long restarts and shut downs when large page sizes are used
rem # !!! WARNING !!!

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "1" /f

PAUSE