rem # Enable Cloud Files Filter Driver (CldFlt)

rem # !!! WARNING !!!

rem # Breaks desktop files from opening and other OneDrive files when disabled

rem # !!! WARNING !!!

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Services\CldFlt" /v "Start" /t REG_DWORD /d "2" /f
net start CldFlt

PAUSE