rem # Disable AMD HD Audio Service

rem # !!! WARNING !!!

rem # Breaks sound coming from GPU HDMI to monitor when disabled

rem # !!! WARNING !!!

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AtiHDAudioService" /v "Start" /t REG_DWORD /d "4" /f

PAUSE