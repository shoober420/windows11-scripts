rem # Disable Cloud Files Filter Driver (CltFlt)

rem # !!! WARNING !!!

rem # Breaks desktop files from opening and other OneDrive files

rem # !!! WARNING !!!

PAUSE

net stop CldFlt
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CldFlt" /v "Start" /t REG_DWORD /d "4" /f

PAUSE