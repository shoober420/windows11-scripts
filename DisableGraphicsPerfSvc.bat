rem # Disable GraphicsPerfSvc

rem # !!! WARNING !!!

rem # BREAKS HAGS (GPU SCHEDULING) AND DLSS

rem # !!! WARNING !!!

PAUSE

net stop GraphicsPerfSvc

reg add "HKLM\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE