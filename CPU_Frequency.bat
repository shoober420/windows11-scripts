rem # CPU Frequency

rem # !!! WARNING !!!

rem # FIND CPU MAX TURBO BOOST SPEED BEFORE ADJUSTING

rem # !!! WARNING !!!

rem # VALUE IS MHZ

rem # 4.2GHZ = 4200MHZ

PAUSE

echo "Enter CPU Max Turbo Speed in MHz"
set /p MHz=""

rem # Maximum processor frequency

reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "ValueMax" /t REG_DWORD /d "%MHz%" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "ValueMax" /t REG_DWORD /d "%MHz%" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "ValueMin" /t REG_DWORD /d "%MHz%" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "ValueMin" /t REG_DWORD /d "%MHz%" /f

powercfg -setacvalueindex scheme_current SUB_PROCESSOR PROCFREQMAX %MHz%


rem # Maximum processor frequency for Processor Power Efficiency Class 1

reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101" /v "ValueMax" /t REG_DWORD /d "%MHz%" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101" /v "ValueMax" /t REG_DWORD /d "%MHz%" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101" /v "ValueMin" /t REG_DWORD /d "%MHz%" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101" /v "ValueMin" /t REG_DWORD /d "%MHz%" /f

powercfg -setacvalueindex scheme_current SUB_PROCESSOR PROCFREQMAX1 %MHz%

PAUSE

