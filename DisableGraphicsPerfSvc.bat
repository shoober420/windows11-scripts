rem # Disable GraphicsPerfSvc

rem # https://steamcommunity.com/discussions/forum/11/2798375980835798574/#c3458220484816217479

rem # !!! WARNING !!!

rem # BREAKS HAGS (GPU SCHEDULING) AND DLSS

rem # !!! WARNING !!!

PAUSE

net stop GraphicsPerfSvc

reg add "HKLM\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE