rem # Starts and enables GraphicsPerfSvc

rem # REQUIRED FOR HAGS (GPU SCHEDULING) AND DLSS

rem # https://steamcommunity.com/discussions/forum/11/2798375980835798574/#c3458220484816217479

reg add "HKLM\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc" /v "Start" /t REG_DWORD /d "2" /f

net start GraphicsPerfSvc

PAUSE
